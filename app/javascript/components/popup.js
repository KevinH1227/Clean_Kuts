// when I click on "booking-button" "window-popup" appears
function window() {
  const buttons = document.querySelectorAll('.booking-button')
  const windowPopUp = document.getElementById('window-popup')
  const datePicker = document.getElementById('date-picker')
  const selectedDate = document.getElementById('selected-date')

  const timePicker = document.getElementById('time-picker')
  console.log(document.querySelector('.window-content'))
  console.log(timePicker)
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
