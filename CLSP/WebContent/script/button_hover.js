const buttons = document.querySelectorAll('button');
buttons.forEach(function(button) {
    button.addEventListener('click', function() {
        for(let i=0; i<buttons.length; i++) {
            buttons[i].style.backgroundColor = '';
        }
        this.style.backgroundColor = '#C0C0C0';
    });
});