
function parallax() {
    var plxBackground, plxBackgroundTopToPageTop, plxBackgroundTopToWindowBottom, plxBackgroundTopToWindowTop, plxSpeed, plxWindow, plxWindowTopToPageTop, plxWindowTopToWindowTop, windowInnerHeight, windowTopToPageTop;
    if ($('#js-parallax-window').length > 0) {
        plxBackground = $('#js-parallax-background,#js-parallax-background-bright');
        plxWindow = $('#js-parallax-window');
        plxWindowTopToPageTop = $(plxWindow).offset().top;
        windowTopToPageTop = $(window).scrollTop();
        plxWindowTopToWindowTop = plxWindowTopToPageTop - windowTopToPageTop;
        plxBackgroundTopToPageTop = $(plxBackground).offset().top;
        windowInnerHeight = window.innerHeight;
        plxBackgroundTopToWindowTop = plxBackgroundTopToPageTop - windowTopToPageTop;
        plxBackgroundTopToWindowBottom = windowInnerHeight - plxBackgroundTopToWindowTop;
        plxSpeed = 0.35;
        plxBackground.css('top', -(plxWindowTopToWindowTop * plxSpeed) + 'px');
    }
}

$(document).ready(function(){
    parallax();
    $('body').scroll(function(){
        parallax();
    })
});