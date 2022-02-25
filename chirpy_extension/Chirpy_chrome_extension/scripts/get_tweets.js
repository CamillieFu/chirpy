// const initRemoveTweet = () => {
//   const tweets = []
//   const article = document.querySelectorAll("article").forEach((tweet) => {
//     // if (tweet.innerText.includes("tomorrow")) {
//     //   tweet.remove()
//     // }
//     tweets.push(tweet.innerText)

//     // fetch(application/json)
//     // if true
//     // tweets.remove
//   })
//   const tweets_string = tweets.join()
// };

// document.querySelectorAll("article").forEach((tweet) => {
//   const article = tweet.innerText
//   })

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
          if (data["bad"] == "false") {
            tweet.style.display = "none";
            tweet.classList.add("checked");
          } else {
            tweet.classList.add("checked");
          }
        })
        .catch((error) => {
          console.error(
            "There has been a problem with your fetch operation:",
            error
          );
        });
    }
  });
}
