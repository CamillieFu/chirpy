// Checks on load if the user is authenticated and show the correct screen
window.onload = (event) => {
  authFunction();
};

// Send a message to the active tab to 'hide_tweets'
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

// Added an event listener to trigger the functions below when clicking the "sign in" button
const elem = document.querySelector("#sign_in");

elem.addEventListener("click", (event) => {
  event.preventDefault();
  setEmail_Apikey();
  sendAuthentic_userMsg();
  authFunction();
});

// function to get user input and save it in local storage
function setEmail_Apikey() {
  window.localStorage.setItem(
    "user",
    document.getElementById("form_email").value
  );
  window.localStorage.setItem(
    "api_key",
    document.getElementById("form_api_key").value
  );
  document.getElementById("form_email").value = "";
  document.getElementById("form_api_key").value = "";
}

// Checks if the user is authenticated and show the correct screen
function authFunction() {
  let email_value = window.localStorage.getItem("user");
  let api_value = window.localStorage.getItem("api_key");
  fetch("https://www.chirpyapp.net/api/v1/pages", {
    method: "POST",
    body: JSON.stringify({
      content: "hi",
    }),
    headers: {
      "Content-type": "application/json; charset=UTF-8",
      "X-User-Email": email_value,
      "X-User-Token": api_value,
    },
  })
    .then((response) => response.json())
    .then((data) => {
      if (data["authentic_user"] === "true") {
        console.log("user is authentic");
        sign_out_img.classList.add("visible");
        document.querySelector("#user_signed_in").classList.add("visible");
        document.querySelector("#waiting").classList.add("hidden");
        document.querySelector("#user_signed_out").classList.remove("visible");
      } else {
        document.querySelector("#user_signed_out").classList.add("visible");
        document.querySelector("#waiting").classList.add("hidden");
        console.log(data.error);
      }
    });
}

// Wrote a function to send stored email & api key to the active tab
function sendAuthentic_userMsg() {
  let u = window.localStorage.getItem("user");
  let k = window.localStorage.getItem("api_key");
  chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
    chrome.tabs.sendMessage(tabs[0].id, { name: u, key: k, action: "auth" });
  });
}

// Below sends user to chirpyapp.net
document
  .querySelector("#go_to_chirpy")
  .addEventListener("click", (event) => openRequestedPopup());

function openRequestedPopup() {
  window.open("https://www.chirpyapp.net/dashboards", "_blank");
}

// Sign out button
const sign_out_img = document.querySelector("#signout_icon");

sign_out_img.addEventListener("click", (event) => {
  event.preventDefault();
  sign_out();
});

function sign_out() {
  window.localStorage.removeItem("user");
  window.localStorage.removeItem("api_key");
  sign_out_img.classList.remove("visible");
  document.querySelector("#user_signed_in").classList.remove("visible");
  document.querySelector("#user_signed_out").classList.add("visible");
  alert("You have been signed out");
}
