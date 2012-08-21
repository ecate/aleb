// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery.ui.datepicker-fr
//= require twitter/bootstrap
//= require jquery_nested_form
//= require lazybox
//= require_tree .


$(window).load(function () {

    /*SLIDER NIVO *************************************************************************************/
    $("#slider").nivoSlider({
        directionNavHide: true,
        captionOpacity: 1,
        effect:'fade'
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
        onSelect: function(dateText, inst) {
            alert(dateText);
            $("#q_horaire_dateequals").val(dateText);
        }

    });




});

