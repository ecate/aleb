// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require twitter/bootstrap
//= require jquery_nested_form
//= require_tree .

$(window).load(function () {

    /*SLIDER BOOTSTRAP ********************************************************************************/
    /*$('#myCarousel').carousel();*/

    /*SLIDER NIVO *************************************************************************************/
    $("#slider").nivoSlider({
        directionNavHide: true,
        captionOpacity: 1,
        prevText: '<',
        nextText: '>',
       });

    /*BOX RECHERCHE - RANGE SLIDER*********************************************************************/
    $("#slider-range").slider({
        range:true,
        min:1,
        max:100,
        values:[10, 50],
        slide:function (event, ui) {
            $("#amount").val("€" + ui.values[ 0 ] + " - €" + ui.values[ 1 ]);
            $("#q_syllabus_prixbase_gteq").val(parseInt($("#slider-range").slider("values", 0)));
            $("#q_syllabus_prixbase_lteq").val(parseInt($("#slider-range").slider("values", 1)));
        }
    });

    $("#amount").val("€" + $("#slider-range").slider("values", 0) +
        " - €" + $("#slider-range").slider("values", 1));

    /*BOX RECHERCHE - DATE PICKER **********************************************************************/
    $("#lessons_box_horaire").datepicker({
        dateFormat: 'dd-mm-yy',
        onSelect: function(dateText, inst) {
              $("#q_horaire_gteq").val(dateText);
           }

    });

});