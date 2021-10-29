// when I click on "booking-button" "window-popup" appears
function window() {

const button = document.getElementById("booking-button")
const windowPopUp = document.getElementById("window-popup")
  // when I click on button...
  if(button) {
    button.addEventListener("click", (event)=> {
      event.preventDefault();
      console.log(event.currentTarget);
      // ...windowPopUp appears
      windowPopUp.classList.add("appear");
      windowPopUp.classList.remove("change");
    });
  };
};

export { window }
