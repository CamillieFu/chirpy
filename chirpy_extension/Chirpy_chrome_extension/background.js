chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  if (request.action === "pop_auth") {
    let ron = request.name;
    let hermione = request.key;
    chrome.storage.sync.set({ user: ron });
    chrome.storage.sync.set({ api_key: hermione });
    console.log(request.name);
    console.log("changed");
    return true;
  }
});

// Wrote a function to send stored email & api key to the active tab every 5 seconds if the url has twitter
chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  if (request.action === "on_twitter") {
    console.log("connected");
    sendAuth_userMsg();
  }
  return true;
});

function sendAuth_userMsg() {
  chrome.storage.sync.get(["user", "api_key"], function (data) {
    let back_u = data.user;
    let back_k = data.api_key;
    chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
      chrome.tabs.sendMessage(tabs[0].id, {
        name: back_u,
        key: back_k,
        action: "back_auth",
      });
    });
  });
}
