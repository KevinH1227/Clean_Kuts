
function tabs() {

  // const searcher = document.getElementById("searcher");

  const services = document.getElementById("services");
  const reviews = document.getElementById("reviews");
  const spot = document.getElementById("spot");
  const spotService = document.getElementById("spot-service");


  if(reviews) {
      reviews.addEventListener("click", (event)=> {
  // always needed no matter what
        event.preventDefault();
        console.log(event.currentTarget);

        // action is change or toggle to css class change

        services.classList.add("passive");
        services.classList.remove("active");
        reviews.classList.add("active");
        reviews.classList.remove("passive");
        spot.classList.remove("change")
        spot.classList.add("appear")
        spotService.classList.remove("appear")
        spotService.classList.add("change")
      }
    );
  }
  if(services) {
    services.addEventListener("click", (event)=> {
// always needed no matter what
      event.preventDefault();
      console.log(event.currentTarget);

      // action is change or toggle to css class change

        reviews.classList.add("passive");
        reviews.classList.remove("active");
        services.classList.remove("passive");
        services.classList.add("active");
        spot.classList.remove("appear")
        spot.classList.add("change")
        spotService.classList.remove("change")
        spotService.classList.add("appear")
    }
  );
  }
};


export { tabs };
