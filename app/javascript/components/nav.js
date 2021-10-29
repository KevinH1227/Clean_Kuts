const changeOpacityOnNavbar = () => {
  const navbar = document.querySelector("#navbar");
  if (window != undefined) {
    window.onscroll = () => {
      if (window.scrollY > 40) {
        navbar.classList.add("navigation-active");
      } else {
        navbar.classList.remove("navigation-active");
      }
    };
  }
};

export { changeOpacityOnNavbar };
