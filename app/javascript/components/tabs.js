
function tabs() {

  // tabs_barber_profile aka 1
    // tab title variables
  const services = document.getElementById("services");
  const reviews = document.getElementById("reviews");
    // tabs section variables
  const spot = document.getElementById("spot");
  const spotService = document.getElementById("spot-service");

  // tabs_client_profile aka 2 appointment reviews favourite
    // tab title variables
  const appointments2 = document.getElementById("appointments2");
  const reviews2 = document.getElementById("reviews2");
  const favourites2 = document.getElementById("favourites2");
    // tabs section variables
  const spot5 = document.getElementById("spot5");
  const spot6 = document.getElementById("spot6");
  const spot7 = document.getElementById("spot7");

  if(reviews) {
      reviews.addEventListener("click", (event)=> {
        // always needed no matter what
        event.preventDefault();
        console.log(event.currentTarget);

        // services title tab
        services.classList.add("passive");
        services.classList.remove("active");

        // reviews title tab
        reviews.classList.add("active");
        reviews.classList.remove("passive");

        // reviews tab section
        spot.classList.remove("change");
        spot.classList.add("appear");

        // services tab section
        spotService.classList.remove("appear");
        spotService.classList.add("change");
      }
    );
  };
  if(services) {
    services.addEventListener("click", (event)=> {
// always needed no matter what
      event.preventDefault();
      console.log(event.currentTarget);

      // action is change or toggle to css class change
        // reviews title tab
        reviews.classList.add("passive");
        reviews.classList.remove("active");
        // services title tab
        services.classList.remove("passive");
        services.classList.add("active");

        // reviews tab section
        spot.classList.remove("appear")
        spot.classList.add("change")
        // services tab section
        spotService.classList.remove("change")
        spotService.classList.add("appear")
    });
  };
// ----
  if(appointments2) {
    appointments2.addEventListener("click", (event)=> {
// always needed no matter what
      event.preventDefault();
      console.log(event.currentTarget);

        // appointments title tab
        appointments2.classList.add("active");
        appointments2.classList.remove("passive");
        // reviews title tab
        reviews2.classList.remove("active");
        reviews2.classList.add("passive");

        // favourites title tabs
        favourites2.classList.remove("active");
        favourites2.classList.add("passive");

        // appointments tab section
        spot5.classList.add("appear")
        spot5.classList.remove("change")
        // reviews tab section
        spot6.classList.add("change")
        spot6.classList.remove("appear")
        // favourites tab section
        spot7.classList.add("change")
        spot7.classList.remove("appear")
    });
  };
  // ----
    if(reviews2) {
    reviews2.addEventListener("click", (event)=> {
// always needed no matter what
      event.preventDefault();
      console.log(event.currentTarget);

        // appointments title tab
        appointments2.classList.remove("active");
        appointments2.classList.add("passive");
        // reviews title tab
        reviews2.classList.add("active");
        reviews2.classList.remove("passive");

        // favourites title tabs
        favourites2.classList.remove("active");
        favourites2.classList.add("passive");

        // appointments tab section
        spot5.classList.remove("appear")
        spot5.classList.add("change")
        // reviews tab section
        spot6.classList.add("appear")
        spot6.classList.remove("change")
        // favourites tab section
        spot7.classList.remove("appear")
        spot7.classList.add("change")
    });
  };
  // ----
    if(favourites2) {
    favourites2.addEventListener("click", (event)=> {
// always needed no matter what
      event.preventDefault();
      console.log(event.currentTarget);

        // appointments title tab
        appointments2.classList.remove("active");
        appointments2.classList.add("passive");
        // reviews title tab
        reviews2.classList.remove("active");
        reviews2.classList.add("passive");

        // favourites title tabs
        favourites2.classList.add("active");
        favourites2.classList.remove("passive");

        // appointments tab section
        spot5.classList.remove("appear")
        spot5.classList.add("change")
        // reviews tab section
        spot6.classList.remove("appear")
        spot6.classList.add("change")
        // favourites tab section
        spot7.classList.add("appear")
        spot7.classList.remove("change")
    });
  };
  // -----



};


export { tabs };
