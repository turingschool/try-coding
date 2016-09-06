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
//= require carousel_normalization.js
//= require jquery.matchHeight.js
//= require_tree .

$(document).ready(function() {
    $('.match-height').matchHeight();

    // Normalize the height of each bootstrap element
    carouselNormalization();

    // Js form validation
    $('.form-validate').validator({
        disable: false
    })

    // Form submit button
    var $btn = $('form .btn-submit');
    var original_button_html = $btn.html();

    $('form').ajaxForm({
        resetForm: true,
        beforeSubmit: function() {
            $btn.button('loading');
        },
        success: function() {
            // Some cool button transition animation
            $btn.addClass('btn-success').removeClass('btn-primary').html('Message sent <i class="fa fa-check-circle"></i>');
            setTimeout(function() {
                $btn.addClass('btn-primary').removeClass('btn-success').html(original_button_html).prop("disabled", false);
            }, 3000);
        }
    });
});
