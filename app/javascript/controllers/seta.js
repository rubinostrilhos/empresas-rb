var scrollAmount;

function setScrollAmount() {
  if (window.innerWidth <= 600) {
    // Se a largura da janela for 600px ou menos, assumimos que é um celular
    if (window.innerWidth > window.innerHeight) {
      // Se o celular estiver deitado
      scrollAmount = 100; // Altere para o valor desejado
    } else {
      // Se o celular estiver em pé
      scrollAmount = 760; // Altere para o valor desejado
    }
  } else {
    // Se a largura da janela for maior que 600px, assumimos que é um desktop
    scrollAmount = 910; // Altere para o valor desejado
  }
}

// Defina a quantidade de rolagem quando a página é carregada
setScrollAmount();

// Atualize a quantidade de rolagem quando a orientação do dispositivo muda
var mql = window.matchMedia('(orientation: portrait)');
mql.addEventListener('change', function() {
  setScrollAmount();
});

document.getElementById('seta').addEventListener('click', function(event) {
  event.preventDefault();
  window.scrollBy({ top: scrollAmount, behavior: 'smooth' });
});
