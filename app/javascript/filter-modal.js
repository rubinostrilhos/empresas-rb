// let selectorReveal = document.querySelector(".filters")
// let revelar = document.querySelector("#select-group")
// let modal = document.querySelector('.companies-upper')
// let gridDisappear = document.querySelector(".grid-cards")
// let submitGroup = document.querySelector(".submit-group")
// let searchOrderMobile = document.querySelector(".companies-search")
// let closeModal = document.querySelector('.x-mark')


// selectorReveal.addEventListener('click', function(event) {
//   event.preventDefault();

//   if (revelar.classList.contains('select-group')) {


//     revelar.style.display = 'flex';
//     revelar.style.order = '1';
//     submitGroup.style.order = '0';

//     modal.style.height = '100%'
//     modal.style.width = '100vw'
//     modal.style.position = 'absolute'
//     modal.style.top = '0'
//     modal.style.left = '0'
//     modal.style.background = 'white'

//     gridDisappear.style.display = 'none'

//     selectorReveal.style.display = 'none'
//     selectorReveal.style.position = 'relative'
//     selectorReveal.style.margin = '0 auto'

//     selectorReveal.style.order = '0 auto'

//     searchOrderMobile.style.display = "block"
//     closeModal.style.display = 'block'



//   } else {
//     closeModal.style.display = 'none'

//     revelar.style.display = 'none'

//     modal.style.width = '100%'
//     modal.style.height = '100%'
//     modal.style.position = 'static'
//     modal.style.background = 'transparent'

//     gridDisappear.style.display = 'flex'

//     selectorReveal.style.position = 'relative'
//     selectorReveal.style.margin = '0 auto 20px auto'

//     function menuExist(menu) {
//       if (menu.matches) {
//         selectorReveal.style.display = 'block'
//       } else {
//         selectorReveal.style.display = 'none'
//       }
//     }

//     var menu = window.matchMedia("(max-width: 863px)")

//     menuExist(menu);

//     menu.addEventListener("change", function() {
//       menuExist(menu);
//     });

//   }

//   closeModal.addEventListener('click', function() {

//     console.log('foi');

//     closeModal.style.display = 'block'

//     revelar.style.display = 'none';

//     modal.style.width = '100%'
//     modal.style.height = '100%'
//     modal.style.position = 'static'
//     modal.style.background = 'transparent'

//     gridDisappear.style.display = 'flex'


//     selectorReveal.style.display = 'block'
//     // selectorReveal.style.position = 'absolute'
//     // selectorReveal.style.top = '62px'
//     // selectorReveal.style.left = '28px'
//     // selectorReveal.style.margin = '0 15px 20px auto'
//     revelar.classList.add('select-group');

//   });

//   revelar.classList.toggle('select-group');

// });
