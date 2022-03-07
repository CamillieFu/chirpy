chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  if (request.action === "auth") {
    const poppy = request.name;
    const mave = request.key;
    window.localStorage.setItem("user", poppy);
    window.localStorage.setItem("api_key", mave);
    console.log(request.name);
    console.log("changed");
  }
});
