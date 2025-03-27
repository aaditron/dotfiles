const searchUrl = "https://google.com/search?q=";

// Search on enter key event
document.getElementById("search-field").addEventListener("keypress", function (e) {
  if (e.keyCode == 13) {
    var val = document.getElementById("search-field").value;
    window.open(searchUrl + val);
  }
});

// Get current time and format
function getTime() {
  let date = new Date(),
    min = date.getMinutes(),
    sec = date.getSeconds(),
    hour = date.getHours();

  return (
    "" +
    (hour < 10 ? "0" + hour : hour) +
    ":" +
    (min < 10 ? "0" + min : min) +
    ":" +
    (sec < 10 ? "0" + sec : sec)
  );
}


// Handle writing out Bookmarks
function setupBookmarks() {
}

window.onload = () => {
  setupBookmarks();
  // Set up the clock
  document.getElementById("clock").innerHTML = getTime();
  // Set clock interval to tick clock
  setInterval(() => {
    document.getElementById("clock").innerHTML = getTime();
  }, 100);
};

document.addEventListener("keyup", (event) => {
  if (event.keyCode == 32) {
    // Spacebar code to open search
    document.getElementById("search").style.display = "flex";
    document.getElementById("search-field").focus();
  } else if (event.keyCode == 27) {
    // Esc to close search
    document.getElementById("search-field").value = "";
    document.getElementById("search-field").blur();
    document.getElementById("search").style.display = "none";
  }
});
