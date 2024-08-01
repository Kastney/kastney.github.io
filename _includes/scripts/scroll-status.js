function initHeader() {
    function setScrollStatus() {
        var y = window.scrollY;
        var status = y <= 0 ? "top" : window.innerHeight + y >= document.body.offsetHeight - 1 ? "bottom" : y - auxScrollY > 0 ? "down" : "up";
        html.setAttribute("scroll-status", status);
        auxScrollY = y;
    }
    var html = document.documentElement;
    var auxScrollY = window.scrollY;    
    window.addEventListener('scroll', function(){ setScrollStatus(); });
    setScrollStatus();
}
document.addEventListener('DOMContentLoaded', initHeader);