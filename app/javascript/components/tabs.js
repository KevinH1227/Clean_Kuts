// Use this JS for schedule reviews services
// When I click on filter -> filter_search appears
// location_search disappears

// When I click on location -> location_search appears
//                             filter_search appears

// addEventlistener
// trigger is click or tap
function tabs() {
variables
  // const searcher = document.getElementById("searcher");
  const reviews_section = document.getElementById("reviews_section");
  const services_section = document.getElementById("services_section");
  const services = document.getElementById("services");
  const reviews = document.getElementById("reviews");

  if(searcher) {
    searcher.addEventListener("click", (event)=> {
// always needed no matter what
      event.preventDefault();
      console.log(event.currentTarget);

      // action is change or toggle to css class change
      reviews_section.classList.toggle("change");
      services_section.classList.toggle("appear");
      services.classList.toggle("active");
      reviews.classList.toggle("passive");
    });
  }

};



export { tabs };
