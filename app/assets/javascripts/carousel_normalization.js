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
