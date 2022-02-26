const initToggleSearch = () => {
  const searchButton = document.getElementById("search-btn");
  const searchBar = document.getElementById("search-bar");
  searchButton.addEventListener("click", (event) => {
    event.preventDefault;
    searchBar.classList.toggle("hideaway");
    if(searchBar.style.display === "block"){
      searchButton.style.borderLeft = "0px";
    }
  })
}

export { initToggleSearch };
