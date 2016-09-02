(function($){
  $(function(){
  var leginfo = $('[data-legs]').data('legs');
  var el = $('[data-legs]');
  var options = Object.keys(leginfo).map(function( key){
    var leg = leginfo[key];
    return "<option data-price=\""+leg.price+"\" value=\""+leg.name+"\">"+leg.name+"</option>";
  }).join("\n");
  var select = $("<select class=\"select-leg\">" + options + "</select>");
  $('.product-color-choices').after( select );
  select.on('change', function(){
    var p = $(this).find('option:selected').data('price');
     
    $('.product-price').text('$'+p);
  }).trigger('change')
   
  })
})(jQuery)