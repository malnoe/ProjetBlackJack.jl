
function updateLogoSizePosition(event) {
    if (event.currentSlide.matches('#title-slide')) {
    var elements = document.querySelectorAll(".slide-logo");
    [].forEach.call(elements, function(elem) {
        elem.classList.remove("slide-logo-bottom-right");
        elem.classList.add("slide-logo-max-size");
    });
    } else {
    var elements = document.querySelectorAll(".slide-logo");
    [].forEach.call(elements, function(elem) {
        elem.classList.add("slide-logo-bottom-right");
        elem.classList.remove("slide-logo-max-size");
    });
    }
};

window.addEventListener("load", (event) => {
    // Make sure the logo has his full size when the slideshow
    // is loaded (i.e. apply the slide-logo-max-size css class)
    var elements = document.querySelectorAll(".slide-logo");
    [].forEach.call(elements, function(elem) {
    elem.classList.remove("slide-logo-bottom-right");
    elem.classList.add("slide-logo-max-size");
    });

    Reveal.on("slidechanged", function(event) {
    updateLogoSizePosition(event);
    });
});