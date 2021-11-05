const openSearchInput = () => {
  const containerInput = document.querySelector(".search-container > form > input");
  const searchIcon = document.querySelector(".search");
    if(containerInput) {
      containerInput.addEventListener("focus", () => {
        searchIcon.classList.add("move-right");
      });
    containerInput.addEventListener("blur", () => {
      searchIcon.classList.remove("move-right");
    });
  };
};

export { openSearchInput };
