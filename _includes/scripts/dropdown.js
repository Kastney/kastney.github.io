document.querySelector('.dropdown-button').addEventListener('click', function(event) {
    var dropdown = this.parentElement;
    dropdown.classList.toggle('active');
    event.stopPropagation();
});

document.addEventListener('click', function(event) {
    var dropdowns = document.querySelectorAll('.dropdown');
    dropdowns.forEach(function(dropdown) {
        if (dropdown.classList.contains('active')) {
            dropdown.classList.remove('active');
        }
    });
});