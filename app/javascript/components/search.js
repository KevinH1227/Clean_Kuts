// When I click on filter -> filter_search appears
// location_search disappears

// When I click on location -> location_search appears
//                             filter_search appears

// addEventlistener
// trigger is click or tap
function search  (){
// variables
const searcher = document.getElementById("searcher");
const location_search = document.getElementById("location_search");
const filter_search = document.getElementById("filter_search");
const filter = document.getElementById("filter");
const location = document.getElementById("location");

  {searcher.addEventListener("click", (event)=> {
// always needed no matter what
event.preventDefault();
console.log(event.currentTarget);

// action is change or toggle to css class change
location_search.classList.toggle("change");
filter_search.classList.toggle("appear");
filter.classList.toggle("active");
location.classList.toggle("passive");
});
};

// {locator.addEventListener("click", (event)=> {
// // always needed no matter what
// event.preventDefault();
// console.log(event.currentTarget);

// // action is change or toggle to css class change
// location_search.classList.toggle("appear")

// if (location_search.classList("appear")){
// filter_search.classList.("change");

// } else if (filter_search.classList.("change")){
// location_search.classList.("appear")};

// });
// };


};

export { search };
