// const interval = setInterval(function () {
//   document.querySelectorAll("article").forEach((tweet) => {
//     let c_list = Array.from(tweet.classList);
//     if (!c_list.includes("checked")) {
//       fetch("http://localhost:3000/api/v1/statistics", {
//         method: "POST",
//         body: JSON.stringify({
//           content: tweet.innerText,
//         }),
//         headers: {
//           "Content-type": "application/json; charset=UTF-8",
//           "X-User-Email": "mom@gmail.com",
//           "X-User-Token": "ssDfQhr11iByJFxJCn4W",
//         },
//       })
//         .then((response) => response.json())
//         .then((data) => {
//           if (data["bad"] == "true") {
//             tweet.style.display = "none";
//             tweet.classList.add("checked");
//             console.log("bad");
//           } else {
//             tweet.classList.add("checked");
//             console.log("good");
//           }
//         })
//         .catch((error) => {
//           console.error(
//             "There has been a problem with your fetch operation:",
//             error
//           );
//         });
//     }
//   });
// }, 10000);

// interval;

chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  if (request.action === "get_tweets") get_tweets();
});

function get_tweets() {
  document.querySelectorAll("article").forEach((tweet) => {
    let c_list = Array.from(tweet.classList);
    if (!c_list.includes("checked")) {
      fetch("http://localhost:3000/api/v1/statistics", {
        method: "POST",
        body: JSON.stringify({
          content: tweet.innerText,
        }),
        headers: {
          "Content-type": "application/json; charset=UTF-8",
          "X-User-Email": "mom@gmail.com",
          "X-User-Token": "ssDfQhr11iByJFxJCn4W",
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
