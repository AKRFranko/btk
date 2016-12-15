

jQuery(function( $ ){
  
  
  
  
  
 if(document.querySelector('#edb-faq')){
  var ison = new Isotope( document.querySelector('#edb-faq'), {
    // options
    itemSelector: '.faq-item,.faq-image',
    masonry: {
      // use element for option
      columnWidth: '.grid-sizer'
    },
    // percentPosition: true
    layoutMode: 'masonry'
  });
   
   
   $(document).on('click tap', '.faq-item.full', function(){
     var it = $(this);
     $('.faq-item.opened').removeClass('opened');
     it.removeClass('full');
     $(document.body).removeClass('fixed');
     setTimeout( function(){
       it.remove();
     },200)
     $(this).remove();
   });
   
   $(document).on('click tap', '.faq-item:not(.full)', function( event ){
                                              var $item =  $(this);
                                              $('.faq-item.full').click();
                                              // console.log('clicked');
                                              
                                              var $clone = $item.clone(false,false).addClass('clone');
                                              $item.addClass('opened');
                                              var pos = $item.get(0).getBoundingClientRect();
                                              $clone.css({
                                                position: 'fixed',
                                                top: ((window.screen.height / 2) - (pos.height / 2) ) + 'px',
                                                left: ((window.screen.width / 2) - (pos.width / 2) ) + 'px',

                                                width: pos.width + 'px',
                                                height:pos.height + 'px',
                                              });
                                              $(document.body).append($clone);
                                              setTimeout( function(){
                                                $clone.addClass('full');
                                                $(document.body).addClass('fixed');
                                              },100)
                                            })
  // var $faqItems = $('.faq-item');
  // $faqItems.each( function(){
  //   var $item = $(this);
  //   $item.on('click tap', )
  // })
   
    
 }
  
  // var $faqItems = $('.faq-item');
  
  // $faqItems.each( function(){
  //   $('#edb-faq').append( getSquares( $(this).detach() ));
    
    
  //   // $(this).before.apply(this,getSquares( this )).remove();
  // })
  // function measureText( el, text ){
  //   var $span = $('<span>').text(text);
  //   $(el).append($span);
  //   var width = $span.width();
  //   var height = $span.height();
  //   $span.remove();
  //   return { width: width / text.length, height: height, area:  width * height  };
  // }
  // var $faq = $('#edb-faq');
  
  // var $questions = $('.faq-question');
  
  // var average;
  // var max=0;
  // var min=Infinity;
  // var numBuckets = 5;
  // var buckets = [];
  // while(buckets.length < numBuckets){
  //   buckets.push([]);
  // }
  
  
  // $('.faq-item').on('click tap', function(e){
  //   if($(e.target).is('.faq-close')){
  //     return true;
  //   }else{
  //   e.preventDefault();
    
  //   if(!$(this).hasClass('full')){
  //     $(this).addClass('full');
  //   }  
  //   }
    
    
  // });
  // $('.faq-close').on('click tap', function(e){
    
  //   e.preventDefault();
  //   $(this).closest('.faq-item').removeClass('full');
  // });

  

  // var $faq = $('#edb-faq');
  // var $questions = $('.faq-question');
 
  
  // function createQuestionColumns(){
  //   var $col1 = $('<div>').addClass('faq-column').css('width','100%');
  //   var $col2 = $('<div>').addClass('faq-column');
  //   var $col3 = $('<div>').addClass('faq-column');
  //   var i =0;
  //   var cols = [$col1,$col2,$col3];
    
  //   $questions.each( function(){
  //     var c = i++%3;
  //     cols[c].append( $(this).parents('.faq-item') );
  //   });
    
  //   $faq.append.apply($faq ,cols);
  // }
  
  
  // $(document).on('click tap', '.faq-item', function( e ){
  //   e.preventDefault();
  //   if($(this).is('.faq-clone')){
  //   return $(this).remove();
  //   }
  //   $('.faq-clone').remove();
  //   var measures = $(this).get(0).getBoundingClientRect();
  //   var $clone = $(this).clone(false,false).addClass('faq-clone');
  //   $clone.css({
  //     position: 'fixed',
  //     top: measures.top + 'px',
  //     left: measures.left + 'px',
  //     width: measures.width + 'px',
  //     height: measures.height + 'px',
  //   });
  //   $('body').append( $clone );
  //   $clone.addClass('full')
  //   // $clone.removeClass('faq-item').addClass('full-faq-item');
  //   console.log(measures)
    
    
  // });

  // createQuestionColumns();
  
  
  
  
  // function getFifth(){
  //   var fullWidth = $('#edb-faq').width();
  //   var fifth = fullWidth/5;
  //   return fifth;
  // }
  
  
  
  // function getClass(){
  //   var cs = ['model-a','model-b','model-c','model-d'];
  //   return cs[Math.floor(Math.random() * cs.length)]
  // }
  
  
  
  // function onresize( ){
  //   var fifth = getFifth();
  //   $('.faq-question').each( function(){
  //     $(this).parent('.faq-item').addClass(getClass()).css('min-height',fifth + 'px');
  //     $(this).width(fifth);
      
  //   });
  // }
  
  // onresize();
  
  
  
})