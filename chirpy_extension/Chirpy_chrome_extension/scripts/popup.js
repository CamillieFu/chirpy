// Send a message to the active tab to 'hide_tweets' it
function sendHide_tweetsMsg() {
  chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
    // Finds tabs that are active in the current window
    chrome.tabs.sendMessage(tabs[0].id, { action: "get_tweets" }); // Sends a message (object) to the first tab (tabs[0])
  });
}

// Trigger the function above when clicking the 'Hide_tweets' button
document
  .querySelector("#hide_tweets")
  .addEventListener("click", (event) => sendHide_tweetsMsg());

// TODO: Write a function to send a message to the active tab to 'hide_tweets' it

// TODO: Add an event listener to trigger the function above when clicking the 'Hide_tweets' button
