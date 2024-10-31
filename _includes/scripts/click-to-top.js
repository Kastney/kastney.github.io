function initClickToTop() {
    var clickToTop = document.getElementById('click-to-top');
    var header = document.querySelector('header');

    clickToTop.addEventListener('click', () => {
        var hasBanner = header.getAttribute('banner') === 'true';
        var scrollToPosition = hasBanner && window.scrollY >= 2 ? 1 : 0;
        
        smoothScrollTo(scrollToPosition);
    });
}

document.addEventListener('DOMContentLoaded', initClickToTop);