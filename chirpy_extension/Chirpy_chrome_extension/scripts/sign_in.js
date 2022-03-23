// Checks if the user is on twitter and sends a message to background.js to run sendAuth_userMsg()
const check_twitter_url = setInterval(function () {
  if (window.location.href.includes("twitter.com")) {
    chrome.runtime.sendMessage({
      action: "on_twitter",
    });
  }
}, 10000);

check_twitter_url;

// Gets the credentials from service worker(background.js) and saves them in session storage
chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  if (request.action === "back_auth") {
    let back_user = request.name;
    let back_token = request.token;
    let back_child = request.child;
    window.sessionStorage.setItem("user", back_user);
    window.sessionStorage.setItem("api_token", back_token);
    window.sessionStorage.setItem("child_user", back_child);
    console.log("changed");
  }
});
