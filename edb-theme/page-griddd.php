<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>DEMO GRiddd</title>
  <meta name="description" content="The HTML5 Herald">
  <meta name="author" content="SitePoint">

  <link rel="stylesheet" href="css/styles.css?v=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

  <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]-->
  <style>
    #griddd{
      display:block;
      float:left;
      width:100vw;
      height:100vh;
      box-sizing:border-box;
    }
    #griddd .cell{
      /*outline:1px solid #999;*/
      vertical-align:top;
      position:relative;
      display:inline-block;
      float:left;
      width:50%;
      box-sizing:border-box;
    }
    #griddd .cell:before{
      content:"";
      display:block;
      padding-top:100%;
    }
    
    #griddd .inner{
      position:absolute;
      box-sizing:border-box;
      background-repeat:no-repeat;
      background-position:center;
      background-size:cover;
      top:10px;
      left:10px;
      right:10px;
      bottom:10px;
      width:calc(100% - 20px);
      height:calc(100% - 20px);
      
    }
    #griddd img{
      opacity:0;
      position:absolute;
      top:0;
      left:0;
      right:0;
      bottom:0;
      width:100%;
      height:100%;
      box-sizing:border-box;
    }
    
    #griddd .cell:nth-of-type(1n){
      width:25%;
    }
    #griddd .cell:nth-of-type(1n):before{
      padding-top:100%;
    }
    
    #griddd .cell:nth-of-type(11n){
      width:25%;
    }
    #griddd .cell:nth-of-type(11n):before{
      padding-top:100%;
    }
    #griddd .cell:nth-of-type(2n){
      width:25%;
    }
    #griddd .cell:nth-of-type(2n):before{
      padding-top:100%;
    }
    #griddd .cell:nth-of-type(12n){
      width:25%;
    }
    #griddd .cell:nth-of-type(12n):before{
      padding-top:100%;
    }
    #griddd .cell:nth-of-type(3n){
      width:50%;
    }
    #griddd .cell:nth-of-type(3n):before{
      padding-top:50%;
    }
    #griddd .cell:nth-of-type(13n){
      width:50%;
    }
    #griddd .cell:nth-of-type(13n):before{
      padding-top:50%;
    }
    #griddd .cell:nth-of-type(4n){
      width:25%;
    }
    #griddd .cell:nth-of-type(4n):before{
      padding-top:100%;
    }
    #griddd .cell:nth-of-type(14n){
      width:25%;
    }
    #griddd .cell:nth-of-type(14n):before{
      padding-top:100%;
    }
    
    
    #griddd .cell:nth-of-type(5n){
      width:25%;
    }
    #griddd .cell:nth-of-type(5n):before{
      padding-top:100%;
    }
    
    #griddd .cell:nth-of-type(15n){
      width:25%;
    }
    #griddd .cell:nth-of-type(15n):before{
      padding-top:100%;
    }
    
    #griddd .cell:nth-of-type(6n){
      width:calc(25% / 2);
    }
    #griddd .cell:nth-of-type(6n):before{
      padding-top:100%;
    }
    
    #griddd .cell:nth-of-type(16n){
      width:calc(25% / 2);
    }
    #griddd .cell:nth-of-type(16n):before{
      padding-top:100%;
    }
    #griddd .cell:nth-of-type(7n){
      width:calc(25% / 2);
    }
    #griddd .cell:nth-of-type(7n):before{
      padding-top:100%;
    }
    
    #griddd .cell:nth-of-type(17n){
      width:calc(25% / 2);
    }
    #griddd .cell:nth-of-type(17n):before{
      padding-top:100%;
    }
    #griddd .cell:nth-of-type(8n){
      width:calc(25% / 2);
    }
    #griddd .cell:nth-of-type(8n):before{
      padding-top:100%;
    }
    #griddd .cell:nth-of-type(18n){
      width:calc(25% / 2);
    }
    #griddd .cell:nth-of-type(18n):before{
      padding-top:100%;
    }
    #griddd .cell:nth-of-type(9n){
      width:calc(25% / 2);
    }
    #griddd .cell:nth-of-type(9n):before{
      padding-top:100%;
    }
    #griddd .cell:nth-of-type(19n){
      width:calc(25% / 2);
    }
    #griddd .cell:nth-of-type(19n):before{
      padding-top:100%;
    }
    
    #griddd .cell:nth-of-type(10n){
      width:50%;
    }
    #griddd .cell:nth-of-type(10n):before{
      padding-top:25%;
    }
    #griddd .cell:nth-of-type(20n){
      width:50%;
    }
    #griddd .cell:nth-of-type(20n):before{
      padding-top:25%;
    }
    #griddd .cell:nth-of-type(20) ~ .cell{
      display:none;
    }
    
    
    
   
    
    
    /*#griddd .cell:nth-of-type(1n),*/
    /*#griddd .cell:nth-of-type(2n){*/
    /*  width:25%;*/
    /*}*/
    /*#griddd .cell:nth-of-type(3n){*/
    /*  width:50%;*/
    /*}*/
    /*#griddd .cell:nth-of-type(3n):before{*/
    /*  padding-top:50%;*/
    /*}*/
    /*#griddd .cell:nth-of-type(4n){*/
    /* width:50%;*/
    /*}*/
    /*#griddd .cell:nth-of-type(5n){*/
    /* width:25%;*/
    /*}*/
    /*#griddd .cell:nth-of-type(5n):before{*/
    /*  padding-top:100%;*/
    /*}*/
    
    /*#griddd .cell:nth-of-type(6n){*/
    /* width:25%;*/
    /*}*/
    /*#griddd .cell:nth-of-type(6n):before{*/
    /*  padding-top:100%;*/
    /*}*/
    /*#griddd .cell:nth-of-type(7n){*/
    /* width:25%;*/
    /*}*/
    /*#griddd .cell:nth-of-type(7n):before{*/
    /*  padding-top:100%;*/
    /*}*/
    /*#griddd .cell:nth-of-type(8n){*/
    /* width:25%;*/
    /*}*/
    /*#griddd .cell:nth-of-type(8n):before{*/
    /* padding-top:100%;*/
    /*}*/
    /*#griddd .image:nth-of-type(1n){*/
    /*  width:25%;*/
    /*  height:25%;*/
    /*}*/
  </style>
</head>

<body>
  <script>
    (function($){
      var fetch = $.getJSON('https://badb0x.akr.club/wp-json/wp/v2/media');
      fetch.done( function( data ){
        data.concat(data).concat(data).forEach(function( image, i ){
          var cell = $('<div>').addClass('cell');
          var inner = $('<div>').addClass('inner');
          var img = $('<img>').attr('src',image.source_url);
          inner.css('background-image', 'url("'+image.source_url+'")');
          $('#griddd').append(cell.append(inner.append(img)));
        })
      })
    })(jQuery)
  </script>
  <div id="griddd">
    
  </div>
</body>
</html>