import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="typing"
export default class extends Controller {

  static targets = [
    "texto"
  ]

  connect() {
    this.i = 0;
    this.palavras = [" Rubistas", " Empresas", "\na Comunidade"];
    this.cores = ["red", "#00b8fb", "yellow"];
    this.contadorPalavras = 0;
    this.estaApagando = false;
    this.tempoEntrePalavras = [2000, 2000, 4000]; // tempo de espera em milissegundos
    this.efeitoMaquinaDeEscrever();
  }

  efeitoMaquinaDeEscrever() {
    let palavraAtual = this.palavras[this.contadorPalavras];
    let corAtual = this.cores[this.contadorPalavras];

    if (this.estaApagando && this.i <= 0) {
      this.estaApagando = false;
      this.contadorPalavras = (this.contadorPalavras + 1) % this.palavras.length;
    }

    if (!this.estaApagando && this.i == palavraAtual.length) {
      this.estaApagando = true;
      setTimeout(() => this.efeitoMaquinaDeEscrever(), this.tempoEntrePalavras[this.contadorPalavras]);
      return;
    }

    if (this.estaApagando) {
      this.i--;
    } else {
      this.i++;
    }

    if (window.innerWidth <= 486) {

      this.textoTarget.innerHTML = "Conectando<span style='color:" + corAtual + ";'>" + "<br/>" + palavraAtual.slice(0, this.i) + "</span>";
      setTimeout(() => this.efeitoMaquinaDeEscrever(), this.estaApagando ? 150 : 100);

    } else {
      this.textoTarget.innerHTML = "Conectando<span style='color:" + corAtual + ";'>" + palavraAtual.slice(0, this.i) + "</span>";
      setTimeout(() => this.efeitoMaquinaDeEscrever(), this.estaApagando ? 150 : 100);
    }


  }


}
