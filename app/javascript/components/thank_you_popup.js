function thankYouPopUp() {
  const confirmBtn = document.getElementById('confirm-btn')
  const thankYou = document.getElementById('thank-you-popup')

  if(confirmBtn) {
    (confirmBtn).addEventListener('click', (event) => {
      event.preventDefault()
      thankYou.classList.add('appear')
      confirmBtn.classList.remove('change')
    })
  }
}

export { thankYouPopUp }
