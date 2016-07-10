(function( $ ) {
	'use strict';
	

window.requestAnimFrame = (function(){
  return  window.requestAnimationFrame       ||
          window.webkitRequestAnimationFrame ||
          window.mozRequestAnimationFrame    ||
          function( callback ){
            window.setTimeout(callback, 1000 / 60);
          };
})();

  // // Read a page's GET URL variables and return them as an associative array.

  var PageSelector = function( el, options ){
    this.$el  =$(el);
    this.options = options;
    this.pageSelector = options.pageSelector;
    this.activeClass = options.activeClass;
    if(!this.pageSelector){ throw new Error('Missing pageSelector option.'); }
    if(!this.activeClass){ throw new Error('Missing activeClass option.'); }
    this.$pages = $(this.pageSelector);
    this.$active = $(this.pageSelector+'.'+this.activeClass);
    this.active = this.$active.index();
    if(this.$active.length === 0 ){
      this.activate( 0 );
    }
    $(el).data('pageSelector', this );
  }
  
  PageSelector.prototype = {
    deactivate: function( index ){
      var $target = this.$pages.eq( index );
      if(!$target.hasClass(this.activeClass)){
        return;
      }
      $target.removeClass(this.activeClass)
      this.$el.trigger('deactivated-page', [ $target ] );
    },
    activate: function( index ){
      var current = this.active;
      var lastIndex = this.$pages.length - 1;
      if( current === index){ 
        return false; 
      }
      this.active = index;
      if( index > lastIndex ){
        this.active = 0;
      }else if( index < 0){
        this.active = lastIndex;
      }
      if(this.active == lastIndex){
        this.$el.addClass('at-last');
      }else{
        this.$el.removeClass('at-last');
      }
      var $previous = this.$pages.eq( current );
      var $target = this.$pages.eq( this.active );
      var it = this;
      requestAnimFrame( function(){
        it.deactivate( current );
        $target.addClass( it.activeClass );
        it.$el.trigger('activated-page', [ $target ] );
        it.$el.trigger('selected-page-changed', [ $target, $previous ]); 
      });
      
    },
    cycle: function( dir ){
      this.activate( this.active + dir );  
    }
  }
  
  var debounce = function( fn, time ){
    clearTimeout(fn.debounceTimeout);
    fn.debounceTimeout = setTimeout( fn, time );
  }
  
  var parseWCAjaxSettings = function( settings ){
    var wcAjax = settings.url.match(/wc-ajax=(\w+)/);
    if( wcAjax && wcAjax[1]){
      return wcAjax[1];
    }else{
      return false;
    }
  };
  var summaryStates = {};
  var saveSummaryToggles = function( ){
    $('.summary').each(function(){
      var index = $(this).index();
      if($(this).hasClass('on')){
        summaryStates[index] = true;  
      }else{
        summaryStates[index] = false;
      }
      
    });
  }
  var restoreSummaryToggles = function( ){
    // console.log('restoreSummaryToggles', summaryStates );
    var i =0;
    while( i < 4){
      if(summaryStates[i]){
        $('.summary').eq(i).addClass('on');
      }else{
        $('.summary').eq(i).removeClass('on');
      }
      i++;
    }
  }
  // trigger woocommerce's updateCart form handling
  var updateCart = function(){
    $('input[name=update_cart]').click();
  }
  
  // post the apply coupon form.
  var applyCoupon = function(){
      var wc_checkout_params = window.wc_checkout_params;
      if(!wc_checkout_params || (wc_checkout_params && !wc_checkout_params.apply_coupon_nonce)){
        return false;
      }
      var security = wc_checkout_params.apply_coupon_nonce;
      var url = wc_checkout_params.wc_ajax_url.replace('%%endpoint%%','apply_coupon');
      var coupon_code = $('#coupon_code').val();
      var data = { coupon_code: coupon_code, security: security }  
      var $form = $('#coupon_code').parents('form');
      if(!coupon_code || $form.is('.processing') ){
        return false;
      }
      $form.addClass('processing').block({
        message: null,
        overlayCSS: {
          background: '#fff',
          opacity: 0.6
        }
      });
      $.post( url, data, function( html ){
        $form.removeClass( 'processing' ).unblock();
        var $html = $( html );
        $('#coupon_code').val('');
        $( '.woocommerce-error, .woocommerce-message' ).remove();
        $form.before( $html );
        // console.log('update because apply coupon');
        $( document.body ).trigger( 'update_checkout', { update_shipping_method: false } );
      }); 
  }
  
  var applyCredits = function(){
      var wc_checkout_params = window.wc_checkout_params;
      if(!wc_checkout_params || (wc_checkout_params && !wc_checkout_params.apply_coupon_nonce)){
        return false;
      }
      var security = wc_checkout_params.apply_coupon_nonce;
      var url = wc_checkout_params.wc_ajax_url.replace('%%endpoint%%','apply_credits');
      var creds = parseFloat($('#checkout-personal-credit .amount').text().replace('$','').trim());
      var amount = parseFloat($('#use_credits').val());
      var data = { use_credits: amount, security: security }  
      var $form = $('#use_credits').parents('form');
      if(!amount || $form.is('.processing') ){
        return false;
      }
      $form.addClass('processing').block({
        message: null,
        overlayCSS: {
          background: '#fff',
          opacity: 0.6
        }
      });
      $.post( url, data, function( html ){
        $form.removeClass( 'processing' ).unblock();
        var $html = $( html );
        $('#use_credits').val('');
        $('#checkout-personal-credit .amount').text('$'+(creds - amount).toFixed(2));
        $( '.woocommerce-error, .woocommerce-message' ).remove();
        $form.before( $html );
        $( document.body ).trigger( 'update_checkout', { update_shipping_method: false } );
      }); 
  }
  
  // show variation image in slideshow
  var showVariationImage = function( material ){
    var $slideshow = $('.edb-slideshow');
    var $lastActive = $slideshow.find('.active-slide');
    var $tempSlide = $slideshow.find('[data-material='+material+']');
    var activeBG;
    
    if($lastActive.data('original-image')){
      activeBG = $lastActive.data('original-image');
    }else{
      activeBG = $lastActive.attr('style');
      $lastActive.data('original-image', activeBG);
    }
    
    $lastActive.attr('style', $tempSlide.attr('style') );
    $slideshow.one('selected-page-changed', function(){
      $lastActive.attr('style', activeBG);
    });
  }
  
  
  
 
  var setupSlideShow = function( ctx ){
    var now = new Date().getTime();
    var domID = 'page-selector-' + now + '-' + Math.floor(Math.random() * now);
    
    var $slideshow = $(ctx);
    
    if($slideshow.attr('id')){
      domID = $slideshow.attr('id');
    }else{
      $slideshow.attr('id', domID );
    }
    
    var $prevButton = $slideshow.find('.edb-slideshow-prev');
    var $nextButton = $slideshow.find('.edb-slideshow-next');
    var pageSelector = new PageSelector( $slideshow, {
        pageSelector: '#' + domID + ' .edb-slideshow-image-container',
        activeClass: 'active-slide'
    });
    
   
    $prevButton.on('click', function( e ){
      e.preventDefault();
      pageSelector.cycle( -1 );
    });
    
    $nextButton.on('click', function( e ){
      e.preventDefault();
      pageSelector.cycle( 1 );
    });
  }
  
  var changeSelectedMaterial = function( ctx ){
    
    var $choice = $(ctx);
    var $label  = $choice.closest('label');
    var $picker = $choice.closest('.edb-material-picker');
    var $image  = $label.find('.edb-material-choice-square');
    var $cart   = $('form.cart');
    var value   = $choice.val();
    var varid   = $choice.data('variation-id');
    // console.log( $image );
    $picker.find('.active-choice').removeClass('active-choice');
    $label.addClass('active-choice');
    $cart.find('input[name="variation_id"]').val(varid);
    $cart.find('input[name="attribute_edb_material"]').val(value);
    
    $cart.find('.product-selected-material .value').attr( 'style', $image.attr('style') );
    $(document).trigger('selected-edb-material-changed', [ value, varid ] );
  }
  
  var changeCheckoutTab = function( hash ){
    if(!$('form.checkout').length){
      return;
    }
    if(!hash){
      hash = '#address-info-panel';
    }
    $('#currentPanel').val( hash );
    $('.checkout-panel.active, #checkout-panel-tabs a.active, .summary.active').removeClass('active');
    var $targets = $( hash +', '+ '.summary[data-panel="'+hash+'"], a[href="'+hash+'"]');
    $targets.addClass('active');
    //$( hash ).find('.edb-save-and-continue').click();
    if(!history.replaceState){
      window.location.hash = hash;
    }else{
      history.replaceState({}, '', hash);
    }
  }
  
  var readCheckoutTabFromWindow = function(){
      var hash = window.location.hash;
      if(hash){
        var activeHash = $('#checkout-panel-tabs a.active').attr('href');
        if(activeHash != hash){
          $('#checkout-panel-tabs a[href="'+hash+'"]').click();  
        }  
        var panelInput = $('#currentPanel');
        if(panelInput.length === 0){
          panelInput = $('<input>').attr({ id: 'currentPanel',type: 'hidden', name: 'current_panel' }).appendTo('form.checkout');
        }
        panelInput.val( window.location.hash );  
      }
      
    
  }
  
  var fixFormPlaceholders = function(){
    $('.woocommerce form .form-row label').each(function(){
      var $label = $( this );
      var $input = $label.next('input,select');
      if($input.length && $label.text()){
        $input.attr('placeholder', $label.text() );
      }
    })
  }
  
  // get type of credit card
  var getCreditCardType = function(accountNumber){
    var result = "unknown";
    if (/^5[1-5]/.test(accountNumber)){
      result = "mastercard";
    }else if (/^4/.test(accountNumber)){
      result = "visa";
    }else if (/^3[47]/.test(accountNumber)){
      result = "amex";
    }
    return result;
  }
  // fuzz credit card number for screen viewing
  var getCreditCardNumberString = function( number ){
    var parts = number.split(' ');
    var string = [];
    if(parts.length >= 4){
      return 'xxxx xxxx xxxx ' + parts[parts.length-1];
    }else{
      return '-';
    }
  }
  
  
  var handleGenericToggle = function( ){
    $(this).toggleClass('on');
  }
    
  
  var setDoNotShip = function( checked ){
    var $diffAddr  = $('#ship-to-different-address input');
    var $opposite = $('input[name="ship_to_different_address"]');
    var $noShip  = $('#do-not-ship input');
    var addrHadChecked = $diffAddr.data('user-checked');
    if(!checked && addrHadChecked && addrHadChecked.value ){
      $diffAddr.prop('checked', true );
      $opposite.val( 0 );
      $('.woocommerce-shipping-fields').show().trigger('update-shipping-fields', [ true ]);
    }
    if(checked){
      $diffAddr.prop('checked', false );
      $opposite.val( 1 );
      $('.woocommerce-shipping-fields').hide().trigger('update-shipping-fields', [ false ]);
    }
    //jQuery('input[name=ship_to_different_address]').val();
    if($noShip.is('checked')){
      $opposite.val( 0 );
    }
    console.log('update beaause do not ship')
    $(document.body).trigger('update_checkout');
    
    
  }
  
  var setDiffAddr = function( checked ){
    var $diffAddr  = $('#ship-to-different-address input');
    var $noShip  = $('#do-not-ship input');
    $diffAddr.data('user-checked', { value: checked } );
    if( checked && $noShip.is(':checked') ){
      $noShip.prop('checked', false );
    }
    if(checked){
      $('.woocommerce-shipping-fields').show().trigger('update-shipping-fields', [ true ]);
    }else{
      $('.woocommerce-shipping-fields').hide().trigger('update-shipping-fields', [ false ]);
    }
  }
  var panelValidators = {
    'address-info-panel': function( $panel ){
      var hasErrors = false;
      $panel.find('.validate-required').each(function(){
        
        var $input =  $( this ).find('input,select,textarea');
        var value = $input.val();
        
        if(!value){
          hasErrors= true;
          $input.addClass('missing')
        }else{
          $input.removeClass('missing')
        }
      })
      $('#billing_postcode,#shipping_postcode').each( function(){
        var val = $(this).val();
        if(!/^([a-zA-Z]\d[a-zA-Z]( )?\d[a-zA-Z]\d)$/.test(val)){
          hasErrors = true;
          $(this).addClass('missing');
        }
      })
      return !hasErrors;
    },
    'payment-info-panel': function( $panel ){
      var $required = $panel.find('#paypal_pro-card-number, #paypal_pro-card-expiry, #paypal_pro-card-cvc');
      var hasErrors = false;
      $required.each( function(){
        var $input = $(this);
        var value = $input.val();
        if(!value){
          hasErrors = true;
          $input.addClass('missing');
        }else{
          $input.removeClass('missing');
        }
      })
      return !hasErrors;
    },
    'place-order-panel': function( $panel ){
      return true;
      // var checks = $panel.find('.checklist-checkbox');
      // var hasErrors = false;
      // checks.each(function(){
      //   var $input = $(this).find('input');
      //   if(!$input.is(':checked')){
      //     $(this).addClass('missing')
      //     hasErrors = true;
      //   }else{
      //     $(this).removeClass('missing')
      //   }
      // })
      // return !hasErrors;
    }
  };
  
  var validatePanel = function( panel ){
    if(panelValidators[panel]){
     return panelValidators[panel]($('#'+panel));
    }
    return true;
  }
  
  // HANDLE EVENTS.  
    
  // Highjack Woocommerce Ajax Updates
  $(document).ajaxSend( function( event, request, settings ){
    var wcAjax = parseWCAjaxSettings( settings );
    // console.log('Highjack', event, request, settings );
    if(wcAjax ){
      if(wcAjax == 'update_shipping_method' || wcAjax == 'update_order_review'){
        saveSummaryToggles();
        var queryString = settings.data;
        var data = queryString.split('&').reduce( function( params, param ){
          var pair = param.split('=').map(function (value) {
              return decodeURIComponent(value.replace('+', ' '));
          });
          params[pair[0]] = pair[1];
          return params; 
        }, {} )
        var s_map = {
          s_address:$('input#shipping_address_1').val(),
          s_address_2:$('input#shipping_address_2').val(),
          s_city:$('input#shipping_city').val(),
          s_country:$('input#shipping_country').val(),
          s_postcode:$('input#shipping_postcode').val(),
          s_state:$('input#shipping_state').val()
        }
        Object.keys(s_map).forEach( function( key ){
          if( s_map[key] ){
            data[key] = s_map[key];
          }
        });
        // console.log('data',  $.param(data) )
        // console.log('queryString',queryString.split('&'))
        // queryString = updateQueryStringShippingAddress(queryString);
        // var fixed = queryString.split('&').map( function( s ){
        //   if(/^s_postcode/.test(s)){
        //           return 's_postcode='+$('input[name=s_postcode]').val();     
        //   }
        //   return s;
        // });
        // console.log(fixed.join('&'));
        settings.data = $.param(data)+'&'+$( 'select.shipping_method, input[name^=shipping_method][type=radio]:checked, input[name^=shipping_method][type=hidden]' ).serialize();
      }
    }
  });
  
  // Highjack Woocommerce Ajax Responses
  $(document).ajaxSuccess( function( event, request ,settings, data ){
    var wcAjax = parseWCAjaxSettings( settings );
    
    
    if(wcAjax && wcAjax == 'update_order_review'){
      // copyCartContents();
      restoreSummaryToggles();
      fixFormPlaceholders();
      changeCheckoutTab( $('#currentPanel').val() );
    }
  });
  
  // prevent submition of checkout form via enter key if not in final step.
  $(document).on('keydown', 'form.checkout', function( e ){
    var currentPanel = $('#currentPanel').val();
    if(e.keyCode === 13 && currentPanel !== '#place-order-panel'){
      e.preventDefault();
      console.log('update bwecause key enter');
      $(document.body).trigger('update_checkout');
    }
  })
  
  
  $(document).on('change focusout', '.cart-item-quantity-input input', function( e ){
    // var time = e.type =='focusout' ? 1200 : 3000;
    updateCart();
    // debounce( , 1000 );
  });
  $(document).on('click', '#apply_coupon', function( e ){
    applyCoupon()
    
  });
  $(document).on('click','#apply_credits', function(e){
    applyCredits();
  })
  // $(document).on('keyup focusout', '#coupon_code', function( e ){
  //   debounce( applyCoupon, 2000 );
  // });
  
  
  // 

  $(document).on('change','input[name=billing_postcode],[name=shipping_postcode]', function(){
     console.log('updaeting chefkout because input[name=billing_postcode],[name=shipping_postcode] changed');
      $(document.body).trigger('update_checkout');
  });
  
  // material selection
  $(document).on('change', '.edb-material-picker input[type=radio]', function(){
    // console.log('change','.edb-material-picker');
    changeSelectedMaterial( this );
  });
  
  $(document).on('selected-edb-material-changed', function( event, material ){
    showVariationImage( material );
  });
  
  
  $(document).on('click', '#checkout-panel-tabs a', function( e ){
    e.preventDefault();
    var hash = $(this).attr('href');
    changeCheckoutTab( hash );
  });
  
  $(document).on('click', '#place_order', function( e ){
    if(!validatePanel('place-order-panel')){
      e.preventDefault()
      
      
    }
  });
  
  
  
  
  $(document).on('click', '.edb-save-and-continue', function( e ){
    var $panels =$('.checkout-panel');
    var activeIndex;
    $panels.each(function(i){
      if( $(this).is('.active')){
        activeIndex = i;
      }
    });
    var targetIndex = activeIndex+1;
    if(targetIndex >= $panels.length) return;
    if(validatePanel( $panels.filter('.active').attr('id') )){
     console.log('update checkout because save on continues')
      $(document.body).trigger('update_checkout');
      $(document.body).one('updated_checkout', function(){
        $('#currentPanel').val( '#' + $panels.eq(targetIndex).attr('id') );
      })  
    }else{
      var $panel = $('.checkout-panel.active');
      var offset = $panel.offset();
      $('html,body').animate({
        scrollTop: 0
      });
      console.log('not valid');
    }
    
  });
 
  // Shipping & Billing
  
  // $(document).on('update-shipping-fields', function(event){
  //   var $noShip  = $('#do-not-ship input');
    
    
   
    
  // });
  
  $(document).on('click', '#do-not-ship input', function( e ){
    if( $(this).is(':checked')){
      setDoNotShip( true );
    }else{
      setDoNotShip( false );
    }
  });
  
  
  
  
  
  
  $(document).on('click', '#ship-to-different-address input', function( e ){
    if( $(this).is(':checked')){
      setDiffAddr( true );
    }else{
      setDiffAddr( false );
    }
  })


  $(document).on('click', '.qty-plus, .qty-minus', function( e ){
    e.preventDefault();
    var $widget = $(this).parents('.qty-widget');
    var data = $widget.data();
    var $input = $widget.find('input');
    
    var $val = $widget.find('.qty-val');
    var value = 1*$input.val();
    if($(this).is('.qty-minus')){
      if(value <= 1 ){
        value = 1;
      }else{
        value--;
      }
    }else{
      value++;
    }
    $val.text(value);
    $input.val(value);
    $input.attr('value', value);
    // if( data.multiplier ){
    //   var multiplier = parseFloat(data.multiplier);
    //   var qty = parseFloat( value );
    //   var total = (multiplier*value).toFixed(2);
    //   var $target = $(data.multiplierTarget);
    //   $target.text('$'+total);
      
    // }
    $input.trigger('change');
  })
  
  $(document).on('click', '.summary-toggle', function( e ){
    e.preventDefault();
    var $summary = $(this).closest('.summary');
    handleGenericToggle.call( $summary );
  });

  $(document).on('click','.panel-link', function(e){
    e.preventDefault();
    
    $('#checkout-panel-tabs a[href='+$(this).data('panel')+']').click();
    
  });
  
  $(document).on('change','.shipping-calculator-form .value input', function(){
    //$('button[name=calc_shipping').click();
    var value = $(this).val();
    if(!value) return;
    if(!/^([a-zA-Z]\d[a-zA-Z]( )?\d[a-zA-Z]\d)$/.test(value)){
      var it = $(this);
      $(this).addClass('missing');
      
    }else{
      $(this).removeClass('missing');
      
    }
  });
  
 
  
  // When document is ready....
  $(function(){
    
    $('.shipping-calculator-form').submit(function(e){
      console.log('shipping-calculator-form submit()')
      var inp = $('.shipping-calculator-form .value input');
      var val = inp.val();
      if(!/^([a-zA-Z]\d[a-zA-Z]( )?\d[a-zA-Z]\d)$/.test(val)){
        e.preventDefault();
        return false;
      }
    });
    
    $('.shipping-calculator-form .value input').trigger('change');
    
    $('.checkout-button').on('click', function(e){
      var value  =$('.shipping-calculator-form .value input').val();
      
      $(this).parents('form').append($('<input>').attr({name:'shipping_postcode', type:'hidden'}).val( value ));
    });
    
    fixFormPlaceholders();
    
    $('.edb-slideshow').each( function(){
      setupSlideShow( this )
    });
    
    if($('form.checkout').length){
      readCheckoutTabFromWindow();
    }
    
    $('#do-not-ship input, #ship-to-different-address input').trigger('change');
    
    if($('#do-not-ship input').is(':checked')){
      $('input[name=ship_to_different_address]').val(0)
    }
    
    $(document.body).on('updated_checkout', fixFormPlaceholders );
    
  });
  window.EdbPageSelector = PageSelector;
  
})( jQuery );
