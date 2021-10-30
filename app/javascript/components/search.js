const openSearchInput = () => {
  var containerInput = document.querySelector(
    ".search-container > form > input"
  );
  var searchIcon = document.querySelector(".search");
  containerInput.addEventListener("focus", () => {
    searchIcon.classList.add("move-right");
  });
  containerInput.addEventListener("blur", () => {
    searchIcon.classList.remove("move-right");
  });
};

export { openSearchInput };
