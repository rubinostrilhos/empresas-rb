let colorInputSelected = document.querySelector('#color-card-selected');

// console.log(colorInputSelected);

colorInputSelected.addEventListener('input', function() {
    let selectedColor = colorInputSelected.value;

    let evento = new CustomEvent('selectedColorChanged', { detail: selectedColor });
    window.dispatchEvent(evento);
});
