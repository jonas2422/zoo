$(document).ready(function(){

var map = $("nav").outerHeight();
var d = $(window).height();
var height = d - map;
console.log(height);
$(".map").css("height", height);

/*$('.map-inside').bind('mousewheel', function(e){
    var maph = $(".map-inside").height();
    var mapw =  $(".map-inside").width();
    if(e.originalEvent.wheelDelta /120 > 0) {
        if(maph < 1612.4){
            maph = maph+16;
            mapw = mapw+16;
            $('.map-inside').css("height", maph);
            $('.map-inside').css("width", mapw);
        }
    }
    else{
        console.log(maph);
        if(maph > 1300){
            maph = maph-16;
            mapw = mapw-16;
            $('.map-inside').css("height", maph);
            $('.map-inside').css("width", mapw);
        }
    }
});

    $(".map-inside").draggable({
        stop: function(event, ui) {
            var helper = ui.helper, pos = ui.position;
            var h = -(helper.outerHeight() - $(helper).parent().outerHeight());
            var w = -(helper.outerWidth() - $(helper).parent().outerWidth());
            if (pos.top >= 0) {
                helper.animate({ top: 0 });
            } else if (pos.top <= h) {
                helper.animate({ top: h });
            }else if(pos.left >= 0){
                helper.animate({left:0})
            }
            else if(pos.left <= w){
                helper.animate({left:w})
            }
             
            
        }
         });*/
         if ($(window).width() < 600)
         size = $(window).width();
         else
         size = 600;
         $( ".dialog" ).dialog({
              clickOutside: true,
            autoOpen: false,
            draggable: false,
            resizable: false,
            closeOnEscape: true,
            height: 'auto',
            width: size,
            modal: true,
            dialogClass: 'someclass',
            open: function(){
              jQuery('.ui-widget-overlay').bind('click',function(){
                  jQuery('.dialog').dialog('close');
              })
            },
            show: {
                          effect: "fade",
                          duration: 300
                      },
            hide: {
                    effect: "fade",
                    duration: 300
                }
          
          })
         $('.pointer').click(function(){
            $(".dialog").dialog('open');
          })
});

