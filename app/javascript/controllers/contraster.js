// function verificarContraste() {
//   var corFundo = document.getElementById("corFundo").value;
//   var elementoTexto = document.getElementById("texto");

//   // Converte a cor hexadecimal para RGB
//   var r = parseInt(corFundo.substring(1, 3), 16);
//   var g = parseInt(corFundo.substring(3, 5), 16);
//   var b = parseInt(corFundo.substring(5, 7), 16);

//   // Calcula o valor de luminosidade usando a fórmula de W3C
//   var luminosidade = (0.2126 * r + 0.7152 * g + 0.0722 * b);

//   // Define a cor do texto com base na luminosidade do fundo
//   if (luminosidade > 128) {
//       elementoTexto.style.color = "black"; // Fundo claro, texto preto
//   } else {
//       elementoTexto.style.color = "white"; // Fundo escuro, texto branco
//   }
// }

window.addEventListener('selectedColorChanged', function(event) {
    let selectedColor = event.detail;
    // Exibe o valor em tempo real
    console.log(selectedColor);
});
