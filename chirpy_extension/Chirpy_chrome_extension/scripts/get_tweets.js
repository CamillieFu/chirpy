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
  console.log("hello")
  document.querySelectorAll("article").forEach((tweet) => {
    fetch("http://localhost:3000/api/v1/statistics", {
      method: "POST",
      body: JSON.stringify({
        content: tweet.innerText
      }),
      headers: {
        "Content-type": "application/json; charset=UTF-8",
        "X-User-Email": "dad@gmail.com",
        "X-User-Token": "y5gUinZNzd5BxCcjS9xh",
      }
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      });
  });
}
