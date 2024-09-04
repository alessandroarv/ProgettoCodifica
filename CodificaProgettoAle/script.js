document.addEventListener('DOMContentLoaded', function() {
    // Aggiungo listener ai checkbox
    document.getElementById('corr').addEventListener('change', function() {
        toggleHighlight('.gap', this.checked, 'green');
    });
    document.getElementById('supplied').addEventListener('change', function() {
        toggleHighlight('.add', this.checked, 'rgb(189, 4, 189)');
    });
    document.getElementById('abbreviazioni').addEventListener('change', function() {
        toggleHighlight('.abbr', this.checked, 'rgb(112, 112, 112)');
    });
    document.getElementById('del').addEventListener('change', function() {
        toggleHighlight('.del', this.checked, 'rgb(255, 255, 255)');
    });
    document.getElementById('num').addEventListener('change', function() {
        toggleHighlight('.evidenziazione-orange', this.checked, 'orange');
    });
    document.getElementById('pers').addEventListener('change', function() {
        toggleHighlight('.evidenziazione', this.checked, 'yellow');
    });
    document.getElementById('place').addEventListener('change', function() {
        toggleHighlight('.evidenziazione-blue', this.checked, 'lightblue');
    });
    document.getElementById('org').addEventListener('change', function() {
        toggleHighlight('.evidenziazione-pink', this.checked, 'pink');
    });
});

function toggleHighlight(selector, isChecked, color) {
    const elements = document.querySelectorAll(selector);
    elements.forEach(function(element) {
        if (isChecked) {
            element.style.backgroundColor = color;
            if (selector === '.del') {
                element.style.textDecoration = 'line-through';
            }
        } else {
            // Ripristino i valori originali definiti nel CSS quando il checkbox è deselezionato
            element.style.backgroundColor = '';
            if (selector === '.del') {
                element.style.textDecoration = '';
            }
        }
    });
}
