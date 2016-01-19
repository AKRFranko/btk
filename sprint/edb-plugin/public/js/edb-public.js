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
      this.deactivate( current );
      $target.addClass( this.activeClass );
      this.$el.trigger('activated-page', [ $target ] );
      this.$el.trigger('selected-page-changed', [ $target, $previous ]);
    },
    cycle: function( dir ){
      var it = this;
      requestAnimFrame( function(){
        it.activate( it.active + dir );  
      });
      
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
    console.log('restoreSummaryToggles', summaryStates );
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
    console.log( $image );
    $picker.find('.active-choice').removeClass('active-choice');
    $label.addClass('active-choice');
    $cart.find('input[name=variation_id]').val(varid);
    $cart.find('input[name=attribute_edb_material]').val(value);
    
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
    var $targets = $( hash +', '+ '.summary[data-panel='+hash+'], a[href='+hash+']');
    $targets.addClass('active');
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
          $('#checkout-panel-tabs a[href='+hash+']').click();  
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
      if($input.length){
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
    
  // var updateQueryStringShippingAddress = function( qs ){
  //   if(!window.userSuppliedShippingAddress) return qs;
  //   var parts = qs.split('&');
  //   var res = [];
  //   var replacements = {
  //     's_country': 'shipping_country',
  //     's_state': 'shipping_state',
  //     's_postcode':'shipping_postcode',
  //     's_city': 'shipping_city',
  //     's_address': 'shipping_address',
  //     's_address_2': 'shipping_address_2'
  //   };
  //   var newParts = parts.map(function( part ){
  //     var kv = part.split('=');
  //     var key= kv[0];
  //     var value= kv[1];
  //     if(replacements[key]){
  //       var newValue = $('input[name='+replacements[key]+']').val();
  //       value = newValue;
  //     }
  //     return [key,value].join('=');
  //   });
  //   return newParts.join('&');
  // }
  
  var setDoNotShip = function( checked ){
    var $diffAddr  = $('#ship-to-different-address input');
    var $noShip  = $('#do-not-ship input');
    var addrHadChecked = $diffAddr.data('user-checked');
    if(!checked && addrHadChecked && addrHadChecked.value ){
      $diffAddr.prop('checked', true );
      $('.woocommerce-shipping-fields').show().trigger('update-shipping-fields', [ true ]);
    }
    if(checked){
      $diffAddr.prop('checked', false );
      $('.woocommerce-shipping-fields').hide().trigger('update-shipping-fields', [ false ]);
    }
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
  
  
  // HANDLE EVENTS.  
    
  // Highjack Woocommerce Ajax Updates
  $(document).ajaxSend( function( event, request, settings ){
    var wcAjax = parseWCAjaxSettings( settings );
    if(wcAjax ){
      if(wcAjax == 'update_shipping_method' || wcAjax == 'update_order_review'){
        saveSummaryToggles();
        var queryString = settings.data;
        // queryString = updateQueryStringShippingAddress(queryString);
        // console.log(queryString.split('&'));
        settings.data = queryString+'&'+$( 'select.shipping_method, input[name^=shipping_method][type=radio]:checked, input[name^=shipping_method][type=hidden]' ).serialize();
      }
    }
  });
  
  // Highjack Woocommerce Ajax Responses
  $(document).ajaxSuccess( function( event, request ,settings, data ){
    var wcAjax = parseWCAjaxSettings( settings );
    
    
    if(wcAjax && wcAjax == 'update_order_review'){
      // copyCartContents();
      restoreSummaryToggles();
      
      changeCheckoutTab( $('#currentPanel').val() );
    }
  });
  
  // prevent submition of checkout form via enter key if not in final step.
  $(document).on('keydown', 'form.checkout', function( e ){
    var currentPanel = $('#currentPanel').val();
    if(e.keyCode === 13 && currentPanel !== '#place-order-panel'){
      e.preventDefault();
      $(document.body).trigger('update_checkout');
    }
  })
  
  // watch for quantity/coupon code changes and update cart
  
  $(document).on('change focusout', '.cart-item-quantity-input input', function( e ){
    var time = e.type =='focusout' ? 1200 : 3000;
    debounce( updateCart, time );
  });
  $(document).on('change keyup focusout', '#coupon_code', function( e ){
    var time = e.type =='focusout' ? 1 : e.type =='keyup' ? 1000 : 500;
    debounce( applyCoupon, time );
  });
  
  // $(document).on('keyup focusout', '#coupon_code', function( e ){
  //   debounce( applyCoupon, 2000 );
  // });
  
  // watch for cc info changes
  $(document).on('keyup focusout','#paypal_pro-card-number', function( e ){
    debounce( copyCreditCardInfo, 500 );
  } );

  $(document).on('change','input[name=billing_postcode],[name=shipping_postcode]', function(){
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
    $('#currentPanel').val( '#' + $panels.eq(targetIndex).attr('id') );
    $(document.body).trigger('update_checkout');
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
    var $widget = $(this).parents('.qty-widget');
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
  // When document is ready....
  $(function(){
    
    fixFormPlaceholders();
    
    $('.edb-slideshow').each( function(){
      setupSlideShow( this )
    });
    
    if($('form.checkout').length){
      readCheckoutTabFromWindow();
    }
    
    $('#do-not-ship input, #ship-to-different-address input').trigger('change');
    
    
    
    
  });
  window.EdbPageSelector = PageSelector;
  
})( jQuery );
