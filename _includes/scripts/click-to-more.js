function initClickToMore(){
    var clickToMore = document.getElementById('click-to-more');
    clickToMore.addEventListener('click', () => {
        smoothScrollTo(1);
    });
}
document.addEventListener('DOMContentLoaded', initClickToMore);