// when I click on "booking-button" "window-popup" appears
function window() {
  const buttons = document.querySelectorAll('.confirm-btn')
  const windowPopUp = document.getElementById('window-popup')
  const datePicker = document.getElementById('date-picker')
  const selectedDate = document.getElementById('selected-date')
  buttons.forEach((button) => {
    button?.addEventListener('click', (event) => {
      event.preventDefault()
      selectedDate.innerText = button.dataset.startDate
      datePicker.min = button.dataset.startDate
      datePicker.max = button.dataset.endDate
      // ...windowPopUp appears
      windowPopUp.classList.add('appear')
      windowPopUp.classList.remove('change')
    })
  })
}

export { window }
