let i = 0;
let frase = "Conectando Rubistas";
let palavras = ["Rubistas", "Empresas", "a comunidade"];
let contadorPalavras = 0;
let estaApagando = false;
let tempoEntrePalavras = [2000, 2000, 4000]; // tempo de espera em milissegundos

function efeitoMaquinaDeEscrever() {
  if (estaApagando && i <= 11) { // 11 é o índice após "Conectando "
    estaApagando = false;
    contadorPalavras = (contadorPalavras + 1) % palavras.length;
    frase = "Conectando " + palavras[contadorPalavras];
  }

  if (!estaApagando && i == frase.length) {
    estaApagando = true;
    setTimeout(efeitoMaquinaDeEscrever, tempoEntrePalavras[contadorPalavras]);
    return;
  }

  if (estaApagando) {
    i--;
  } else {
    i++;
  }

  document.getElementById("texto").textContent = frase.slice(0, i);
  setTimeout(efeitoMaquinaDeEscrever, estaApagando ? 150 : 100);
}

efeitoMaquinaDeEscrever();
