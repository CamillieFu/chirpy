// Checks if the user is on twitter and sends a message to background.js to run sendAuth_userMsg()
if (window.location.href.includes("twitter.com")) {
  chrome.runtime.sendMessage({
    action: "on_twitter",
  });
}

// Gets the credentials from service worker(background.js) and saves them in session storage
chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  if (request.action === "back_auth") {
    let back_user = request.name;
    let back_key = request.key;
    window.sessionStorage.setItem("user", back_user);
    window.sessionStorage.setItem("api_key", back_key);
    console.log("changed");
  }
});
