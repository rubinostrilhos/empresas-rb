// let selectorReveal = document.querySelector(".filters")
// let revelar = document.querySelector("#select-group")
// let modal = document.querySelector('.companies-upper')
// let gridDisappear = document.querySelector(".grid-cards")
// let submitGroup = document.querySelector(".submit-group")
// let searchOrderMobile = document.querySelector(".companies-search")
// let closeModal = document.querySelector('.x-mark')

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {

  static targets = [
    "revelar",
    "grid",
    "modal",
    "filters",
    "add",
    "fechar"
  ]

  connect() {

    this.modalTarget.classList.remove('modal-open')
    this.revelarTarget.classList.remove('select-group')
    this.revelarTarget.style.display = 'none';
    this.gridTarget.classList.remove('grid-desappear')
    this.fecharTarget.classList.add('grid-desappear')

    this.addTarget.classList.add('add-company')
    this.addTarget.classList.remove('add-position')

    // this.addTarget.style.left = "102px"
    // this.addTarget.style.bottom = "48px"

  }

  abrirModal() {

    this.fecharTarget.classList.remove('grid-desappear')
    this.modalTarget.classList.add('modal-open')
    this.filtersTarget.classList.remove('filter')
    this.filtersTarget.classList.add('grid-desappear')
    this.revelarTarget.classList.add('select-group')
    this.revelarTarget.style.display = 'flex';
    this.gridTarget.classList.add('grid-desappear')



    this.addTarget.classList.remove('add-company')
    this.addTarget.classList.add('add-position')


  }

  fecharModal() {
    this.fecharTarget.classList.remove('grid-desappear')
    this.filtersTarget.classList.add('filter')
    this.filtersTarget.classList.remove('grid-desappear')

    // this.addTarget.style.left = "102px"
    // this.addTarget.style.bottom = "48px"

    // this.filtersTarget.style.display = "none"
    this.modalTarget.classList.remove('modal-open')
    this.revelarTarget.classList.remove('select-group')
    this.revelarTarget.style.display = 'none';
    this.gridTarget.classList.remove('grid-desappear')

    this.addTarget.classList.add('add-company')
    this.addTarget.classList.remove('add-position')

  }

}
