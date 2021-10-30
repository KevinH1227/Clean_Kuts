const openSearchInput = () => {
    var containerInput = document.querySelector('.search-container > form > input')
    var searchIcon = document.querySelector(".search")
    containerInput.addEventListener('focus', () => {
        searchIcon.classList.toggle('move-right')
    })

}





export { openSearchInput }