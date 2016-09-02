// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery.matchHeight.js
//= require_tree .

$(document).ready(function() {
    $('.match-height').matchHeight();

    carouselNormalization();

    $('form').validate();

    var $btn = $('form .btn-submit');

    $('form').ajaxForm({
        target: '#formResults',
        resetForm: true,
        beforeSubmit: function() {
            $btn.button('loading');
        },
        success: function() {
            $btn.button('reset');
        }
    });
});


// Normalize the height of each slide
function carouselNormalization() {
    var items = $('.carousel .item'), //grab all slides
        heights = [], //create empty array to store height values
        tallest; //create variable to make note of the tallest slide

    if (items.length) {
        function normalizeHeights() {
            items.each(function() { //add heights to array
                heights.push($(this).height());
            });
            tallest = Math.max.apply(null, heights); //cache largest value
            items.each(function() {
                $(this).css('min-height', tallest + 'px');
            });
        };
        normalizeHeights();

        $(window).on('resize orientationchange', function() {
            tallest = 0, heights.length = 0; //reset vars
            items.each(function() {
                $(this).css('min-height', '0'); //reset min-height
            });
            normalizeHeights(); //run it again
        });
    }
}
