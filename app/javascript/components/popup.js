// when I click on "booking-button" "window-popup" appears
function window() {
  const buttons = document.querySelectorAll(".booking-button")
  const windowPopUp = document.getElementById("window-popup")
  const datePicker = document.getElementById("date-picker")
  // datePicker.step = 15 * 60
  console.log(datePicker);
  buttons.forEach((button) =>{
    console.log(button.dataset);
    button.addEventListener("click", (event)=> {
      event.preventDefault();
      console.log(event.currentTarget);
      datePicker.min = button.dataset.startDate
      datePicker.max = button.dataset.endDate
      // ...windowPopUp appears
      windowPopUp.classList.add("appear");
      windowPopUp.classList.remove("change");
    });
  })
};

export { window }
