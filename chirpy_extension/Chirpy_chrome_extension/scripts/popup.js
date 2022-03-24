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

// Checks on load if the user is authenticated and show the correct screen
window.onload = (event) => {
  authFunction();
};

// Added an event listener to trigger the functions below when clicking the "sign in" button
const elem = document.querySelector("#sign_in");

elem.addEventListener("click", (event) => {
  event.preventDefault();
  setEmail_Apitoken();
  authFunction();
  sendAuth_userMsg_background();
});

// function to get user input and save it in local storage
function setEmail_Apitoken() {
  window.localStorage.setItem(
    "user",
    document.getElementById("form_email").value
  );
  window.localStorage.setItem(
    "api_token",
    document.getElementById("form_api_token").value
  );
  window.localStorage.setItem(
    "child_user",
    document.getElementById("child_user").checked
  );
  document.getElementById("form_email").value = "";
  document.getElementById("form_api_token").value = "";
}

// Checks if the user is authenticated and show the correct screen
function authFunction() {
  let email_value = window.localStorage.getItem("user");
  let api_value = window.localStorage.getItem("api_token");
  let child_user = window.localStorage.getItem("child_user");
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
      if (data["authentic_user"] === "true" && child_user === "false") {
        console.log("user is authentic guardian");
        sign_out_img.classList.add("visible");
        document.querySelector("#user_signed_in").classList.add("visible");
        document.querySelector("#waiting").classList.add("hidden");
        document.querySelector("#user_signed_out").classList.remove("visible");
      } else if (data["authentic_user"] === "true" && child_user == "true") {
        console.log("user is authentic child");
        document.querySelector("#child_signed_in").classList.add("visible");
        document.querySelector("#waiting").classList.add("hidden");
        document.querySelector("#user_signed_out").classList.remove("visible");
      } else {
        document.querySelector("#user_signed_out").classList.add("visible");
        document.querySelector("#waiting").classList.add("hidden");
        console.log(data.error);
      }
    });
}

// Wrote a function to send stored email & api token to the service worker(listens to browser action)

function sendAuth_userMsg_background() {
  let pop_u = window.localStorage.getItem("user");
  let pop_t = window.localStorage.getItem("api_token");
  let pop_c = window.localStorage.getItem("child_user");
  chrome.runtime.sendMessage({
    name: pop_u,
    token: pop_t,
    child: pop_c,
    action: "pop_auth",
  });
}

// Below sends user to chirpyapp.net
document
  .querySelector("#go_to_chirpy")
  .addEventListener("click", () => openRequestedPopup());

function openRequestedPopup() {
  window.open("https://www.chirpyapp.net", "_blank");
}

// Sign out button
const sign_out_img = document.querySelector("#signout_icon");
const sign_out_button = document.querySelector("#child_sign_out");

sign_out_img.addEventListener("click", (event) => {
  event.preventDefault();
  sign_out();
  sendAuth_userMsg_background();
});

sign_out_button.addEventListener("click", (event) => {
  event.preventDefault();
  const api_token = window.localStorage.getItem("api_token");
  const api_input = document.getElementById("child_form_api_token");
  if (api_token === api_input.value) {
    sign_out();
    sendAuth_userMsg_background();
  } else {
    api_input.value = "";
    alert("Wrong API token");
  }
});

function sign_out() {
  window.localStorage.removeItem("user");
  window.localStorage.removeItem("api_token");
  window.localStorage.removeItem("child_user");
  sign_out_img.classList.remove("visible");
  document.querySelector("#user_signed_in").classList.remove("visible");
  document.querySelector("#child_signed_in").classList.remove("visible");
  document.querySelector("#user_signed_out").classList.add("visible");
}
