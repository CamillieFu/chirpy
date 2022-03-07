// const interval = setInterval(function () {
//   document.querySelectorAll("article").forEach((tweet) => {
//     let c_list = Array.from(tweet.classList);
//     if (!c_list.includes("checked")) {
//       fetch("https://www.chirpyapp.net/api/v1/statistics", {
//         method: "POST",
//         body: JSON.stringify({
//           content: tweet.innerText,
//         }),
//         headers: {
//           "Content-type": "application/json; charset=UTF-8",
//           "X-User-Email": "mom@gmail.com",
//           "X-User-Token": "o6XfWTy3Q7wHXykn7vBW",
//         },
//       })
//         .then((response) => response.json())
//         .then((data) => {
//           if (data["bad"] === "true") {
//             tweet.style.display = "none";
//             tweet.classList.add("checked");
//             console.log("bad");
//           } else if (data["bad"] === "false") {
//             tweet.classList.add("checked");
//             console.log("not bad");
//           } else {
//             console.log(data);
//           }
//         });
//     }
//   });
// }, 1000);

// interval;

chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  if (request.action === "get_tweets") get_tweets();
});

function get_tweets() {
  document.querySelectorAll("article").forEach((tweet) => {
    let c_list = Array.from(tweet.classList);
    if (!c_list.includes("checked")) {
      let email_value = window.localStorage.getItem("user");
      let api_value = window.localStorage.getItem("api_key");
      fetch("https://www.chirpyapp.net/api/v1/statistics", {
        method: "POST",
        body: JSON.stringify({
          content: tweet.innerText,
        }),
        headers: {
          "Content-type": "application/json; charset=UTF-8",
          "X-User-Email": email_value,
          "X-User-Token": api_value,
        },
      })
        .then((response) => response.json())
        .then((data) => {
          if (data["bad"] === "true") {
            tweet.style.display = "none";
            tweet.classList.add("checked");
            console.log("bad");
          } else if (data["bad"] === "false") {
            tweet.classList.add("checked");
            console.log("not bad");
          } else {
            console.log(data);
          }
        });
    }
  });
}
