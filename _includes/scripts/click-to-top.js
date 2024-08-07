function initClickToTap(){
    var clickToTop = document.getElementById('click-to-top');
    clickToTop.addEventListener('click', () => {
        smoothScrollTo(window.scrollY >= 2 ? 1 : 0);
    });
}
document.addEventListener('DOMContentLoaded', initClickToTap);