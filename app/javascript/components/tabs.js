
function tabs() {

  // tabs_barber_profile aka 1
    // tab title variables
  const services = document.getElementById("services");
  const reviews = document.getElementById("reviews");
    // tabs section variables
  const spot = document.getElementById("spot");
  const spotService = document.getElementById("spot-service");

  // tabs_client_profile aka 2 appointments reviews favourite
    // tab title variables
  const appointments2 = document.getElementById("appointments2");
  const reviews2 = document.getElementById("reviews2");
  // const favourites2 = document.getElementById("favourites2");
    // tabs section variables
  const spot5 = document.getElementById("spot5");
  const spot6 = document.getElementById("spot6");
  // const spot7 = document.getElementById("spot7");

// tabs_barber_dashboard aka 3 schedule appointments reviews services
    // tab title variables
  const schedule3 = document.getElementById("schedule3");
  const appointments3 = document.getElementById("appointments3");
  const reviews3 = document.getElementById("reviews3");
  const services3 = document.getElementById("services3");
    // tabs section variables
  const spot1 = document.getElementById("spot1");
  const spot2 = document.getElementById("spot2");
  const spot3 = document.getElementById("spot3");
  const spot4 = document.getElementById("spot4");

  // tabs_barber_profile aka 1
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
  // -end of tabs_barber_profile aka 1
  // tabs_client_profile aka 2
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
      // favourites2.classList.remove("active");
      // favourites2.classList.add("passive");
      // appointments tab section
      spot5.classList.add("appear")
      spot5.classList.remove("change")
      // reviews tab section
      spot6.classList.add("change")
      spot6.classList.remove("appear")
      // favourites tab section
      // spot7.classList.add("change")
      // spot7.classList.remove("appear")
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
      // favourites2.classList.remove("active");
      // favourites2.classList.add("passive");

      // appointments tab section
      spot5.classList.remove("appear")
      spot5.classList.add("change")
      // reviews tab section
      spot6.classList.add("appear")
      spot6.classList.remove("change")
      // favourites tab section
      // spot7.classList.remove("appear")
      // spot7.classList.add("change")
    });
  };
  // ----
  // if(favourites2) {
  //   favourites2.addEventListener("click", (event)=> {
  //     // always needed no matter what
  //     event.preventDefault();
  //     console.log(event.currentTarget);
  //     // appointments title tab
  //     appointments2.classList.remove("active");
  //     appointments2.classList.add("passive");
  //     // reviews title tab
  //     reviews2.classList.remove("active");
  //     reviews2.classList.add("passive");

  //     // favourites title tabs
  //     favourites2.classList.add("active");
  //     favourites2.classList.remove("passive");

  //     // appointments tab section
  //     spot5.classList.remove("appear")
  //     spot5.classList.add("change")
  //     // reviews tab section
  //     spot6.classList.remove("appear")
  //     spot6.classList.add("change")
  //     // favourites tab section
  //     spot7.classList.add("appear")
  //     spot7.classList.remove("change")
  //   });
  // };
  // end of tabs_client_profile aka 2
  // tabs_barber_dashboard aka 3
  if(schedule3) {
    schedule3.addEventListener("click", (event)=> {
      // always needed no matter what
      event.preventDefault();
      console.log(event.currentTarget);
      // schedule title tab
      schedule3.classList.add("active");
      schedule3.classList.remove("passive");
      // appointments title tab
      appointments3.classList.remove("active");
      appointments3.classList.add("passive");
      // reviews title tabs
      reviews3.classList.remove("active");
      reviews3.classList.add("passive");
      // services title tabs
      services3.classList.remove("active");
      services3.classList.add("passive");
      // schedule tab section
      spot1.classList.add("appear")
      spot1.classList.remove("change")
      // appointments tab section
      spot2.classList.remove("appear")
      spot2.classList.add("change")
      // reviews tab section
      spot3.classList.remove("appear")
      spot3.classList.add("change")
      // services tab section
      spot4.classList.remove("appear")
      spot4.classList.add("change")
    });
  };
  if(appointments3) {
    appointments3.addEventListener("click", (event)=> {
      // always needed no matter what
      event.preventDefault();
      console.log(event.currentTarget);
      // schedule title tab
      schedule3.classList.remove("active");
      schedule3.classList.add("passive");
      // appointments title tab
      appointments3.classList.add("active");
      appointments3.classList.remove("passive");
      // reviews title tabs
      reviews3.classList.remove("active");
      reviews3.classList.add("passive");
      // services title tabs
      services3.classList.remove("active");
      services3.classList.add("passive");
      // schedule tab section
      spot1.classList.remove("appear")
      spot1.classList.add("change")
      // appointments tab section
      spot2.classList.add("appear")
      spot2.classList.remove("change")
      // reviews tab section
      spot3.classList.remove("appear")
      spot3.classList.add("change")
      // services tab section
      spot4.classList.remove("appear")
      spot4.classList.add("change")
    });
  };
  if(reviews3) {
    reviews3.addEventListener("click", (event)=> {
      // always needed no matter what
      event.preventDefault();
      console.log(event.currentTarget);
      // schedule title tab
      schedule3.classList.remove("active");
      schedule3.classList.add("passive");
      // appointments title tab
      appointments3.classList.remove("active");
      appointments3.classList.add("passive");
      // reviews title tabs
      reviews3.classList.add("active");
      reviews3.classList.remove("passive");
      // services title tabs
      services3.classList.remove("active");
      services3.classList.add("passive");
      // schedule tab section
      spot1.classList.remove("appear")
      spot1.classList.add("change")
      // appointments tab section
      spot2.classList.remove("appear")
      spot2.classList.add("change")
      // reviews tab section
      spot3.classList.add("appear")
      spot3.classList.remove("change")
      // services tab section
      spot4.classList.remove("appear")
      spot4.classList.add("change")
    });
  };
  if(services3) {
    services3.addEventListener("click", (event)=> {
      // always needed no matter what
      event.preventDefault();
      console.log(event.currentTarget);
      // schedule title tab
      schedule3.classList.remove("active");
      schedule3.classList.add("passive");
      // appointments title tab
      appointments3.classList.remove("active");
      appointments3.classList.add("passive");
      // reviews title tabs
      reviews3.classList.remove("active");
      reviews3.classList.add("passive");
      // services title tabs
      services3.classList.add("active");
      services3.classList.remove("passive");
      // schedule tab section
      spot1.classList.remove("appear")
      spot1.classList.add("change")
      // appointments tab section
      spot2.classList.remove("appear")
      spot2.classList.add("change")
      // reviews tab section
      spot3.classList.remove("appear")
      spot3.classList.add("change")
      // services tab section
      spot4.classList.add("appear")
      spot4.classList.remove("change")
    });
  };
  //end of tabs_barber_dashboard aka 3
};


export { tabs };
