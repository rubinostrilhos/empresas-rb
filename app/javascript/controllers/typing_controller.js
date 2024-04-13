let i = 0;
let palavras = [" Rubistas", " Empresas", "\na Comunidade"];
let cores = ["red", "#00b8fb", "yellow"];
let contadorPalavras = 0;
let estaApagando = false;
let tempoEntrePalavras = [2000, 2000, 4000]; // tempo de espera em milissegundos

function efeitoMaquinaDeEscrever() {
  let palavraAtual = palavras[contadorPalavras];
  let corAtual = cores[contadorPalavras];

  if (estaApagando && i <= 0) {
    estaApagando = false;
    contadorPalavras = (contadorPalavras + 1) % palavras.length;
  }

  if (!estaApagando && i == palavraAtual.length) {
    estaApagando = true;
    setTimeout(efeitoMaquinaDeEscrever, tempoEntrePalavras[contadorPalavras]);
    return;
  }

  if (estaApagando) {
    i--;
  } else {
    i++;
  }

  document.getElementById("texto").innerHTML = "Conectando<span style='color:" + corAtual + ";'>"+ "<br/>" + palavraAtual.slice(0, i) + "</span>";
  setTimeout(efeitoMaquinaDeEscrever, estaApagando ? 150 : 100);
}

efeitoMaquinaDeEscrever();
