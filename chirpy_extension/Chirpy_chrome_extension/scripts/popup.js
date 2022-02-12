// Send a message to the active tab to 'hide_tweet' it
function sendHide_tweetMsg() {
  chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
    // Finds tabs that are active in the current window
    chrome.tabs.sendMessage(tabs[0].id, { action: "hide_tweet" }); // Sends a message (object) to the first tab (tabs[0])
  });
}

// Trigger the function above when clicking the 'Hide_tweet' button
document
  .querySelector("#hide_tweet")
  .addEventListener("click", (event) => sendHide_tweetMsg());

// TODO: Write a function to send a message to the active tab to 'hide_tweet' it

// TODO: Add an event listener to trigger the function above when clicking the 'Hide_tweet' button
