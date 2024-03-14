
let colorInputSelected = document.getElementById('color-card-selected');

colorInputSelected.addEventListener('input', function() {
    let selectedColor = colorInputSelected.value;

    let evento = new CustomEvent('selectedColorChanged', { detail: selectedColor });
    window.dispatchEvent(evento);
});
