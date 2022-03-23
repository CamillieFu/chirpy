chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  if (request.action === "pop_auth") {
    let service_worker_name = request.name;
    let service_worker_token = request.token;
    let service_worker_child = request.child;
    chrome.storage.sync.set({ user: service_worker_name });
    chrome.storage.sync.set({ api_token: service_worker_token });
    chrome.storage.sync.set({ child_user: service_worker_child });
    console.log(request.name);
    console.log("changed");
    return true;
  }
});

// Wrote a function to send stored email & api token to the active tab if the url has twitter, checks every 10 seconds
chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  if (request.action === "on_twitter") {
    console.log("connected");
    sendAuth_userMsg();
  }
  return true;
});

function sendAuth_userMsg() {
  chrome.storage.sync.get(["user", "api_token", "child_user"], function (data) {
    let back_u = data.user;
    let back_k = data.api_token;
    let back_c = data.child_user;
    chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
      chrome.tabs.sendMessage(tabs[0].id, {
        name: back_u,
        token: back_k,
        child: back_c,
        action: "back_auth",
      });
    });
  });
}
