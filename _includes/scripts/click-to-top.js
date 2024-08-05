function initClickToTap(){
    function smoothScrollTo(top) {
        window.scrollTo({
            top: top,
            behavior: 'smooth'
        });
    }
    var clickToTop = document.getElementById('click-to-top');
    clickToTop.addEventListener('click', () => {
        smoothScrollTo(0);
    });
}
document.addEventListener('DOMContentLoaded', initClickToTap);