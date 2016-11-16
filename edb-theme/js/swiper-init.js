(function($){
  // var mySwiper = new Swiper ('.swiper-container', {
  //   // Optional parameters
  //   direction: 'vertical',
  //   loop: true,
     
  //   // If we need pagination
  //   pagination: '.swiper-pagination',
     
  //   // Navigation arrows
  //   nextButton: '.swiper-button-next',
  //   prevButton: '.swiper-button-prev',
     
  //   // And if we need scrollbar
  //   scrollbar: '.swiper-scrollbar',
  // })       
  
  
  $(function(){
    var $mpi = $('#more-product-images');
    if($mpi.length){
    var $images = $mpi.find('img');
    
    var $swiper = $('<div>').attr('id','modal-swiper').addClass('swiper-container');
    var $inner = $('<div>').addClass('swiper-wrapper');
    var $close = $('<a>').attr('href','#').text('×').addClass('swiper-close');
    $close.on('click tap', function(){
      $swiper.removeClass('open')
    })
    
    // var $paging = $('<div>').addClass('swiper-pagination');
    $images.map(function(){
      var $img = $(this).clone();
      var $wrap = $('<div>').addClass('swiper-slide');
      $wrap.append($img);
      $inner.append( $wrap)
    });
    var $top_images = $('.edb-slide img');
    $top_images.map(function(){
      var $img = $(this).clone();
      var $wrap = $('<div>').addClass('swiper-slide');
      $wrap.append($img);
      $inner.append( $wrap)
    });
    // var $techimg = $('.product-technical-image img');
    // if($techimg.length > 0){
    //   var $img = $techimg.clone();
    //   var $wrap = $('<div>').addClass('swiper-slide');
    //   $wrap.append($img.css('background-color', '#fff'));
    //   $inner.append( $wrap)
    // }
    
    $('body').append($swiper);
    $swiper.append($inner);
    $swiper.append('<div class="swiper-button-prev"></div><div class="swiper-button-next"></div>');
    $swiper.append($close);
    var swiper = new Swiper('#modal-swiper', {
      loop:true,
      nextButton: '#modal-swiper .swiper-button-next',
      prevButton: '#modal-swiper .swiper-button-prev',
        // pagination: '#modal-swiper .swiper-pagination',
        // paginationClickable: true
    });
    $images.each(function(idx){
      $(this).on('click tap', function( e ){
        e.preventDefault();
        swiper.slideTo( idx+1, 0  );
        $swiper.addClass('open');
        setTimeout(function(){
          swiper.update(true);
        },222)
        
      })
    })
    // console.log($swiper);  
    }
    
  })
  // <div id="modal-swiper" class="swiper-container">
  //   <div class="swiper-wrapper">
  //     <?php
  //     foreach ( $more_images as $image ) {
  //           $slide = "<img src='{$image['url']}' width='{$image['width']}' height='{$image['height']}' alt='{$image['alt']}' />";
  //           echo '<div class="swiper-slide">'.$slide.'</div>';
            
              
          
  //     }
  //     ?>
  //   </div>
  //   <div class="swiper-pagination"></div>

  // </div>
})(jQuery);
