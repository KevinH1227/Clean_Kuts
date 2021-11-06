// when I click on "booking-button" "window-popup" appears
function window() {
  const buttons = document.querySelectorAll('.confirm-btn')
  const windowPopUp = document.getElementById('window-popup')
  const datePicker = document.getElementById('date-picker')
  const selectedDate = document.getElementById('selected-date')
  const dateField = document.getElementById('date-picker')
  // console.log(dateField);
  buttons.forEach((button) => {
    button?.addEventListener('click', (event) => {
      // event.preventDefault()
      selectedDate.innerText = button.dataset.startDate
      if (datePicker) {
        // datePicker.min = button.dataset.startDate
        // datePicker.max = button.dataset.endDate
        if (button.dataset.startDate) {
          datePicker.value = button.dataset.startDate
        }
      }
      // ...windowPopUp appears
      windowPopUp.classList.add('appear')
      windowPopUp.classList.remove('change')
      // const confirmBtn = document.getElementById('confirm-btn')
      // confirmBtn.disabled = true
      
      // console.log(service)
      // console.log(confirmBtn)
    })
  })
  const service = document.getElementById('appointment_service_id')
  if(service) {
    const confirmBtn = document.getElementById('confirm-btn')
    confirmBtn.disabled = true
  
    service.addEventListener("change", () => {
      if (service.value !== "") {
        confirmBtn.disabled = false
      }
    })
  }
}

export { window }
