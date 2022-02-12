// hide_tweet.js

// Listen for messages on the content page
chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  if (request.action === "hide_tweet") hide_tweet();
});

// Our image replacement script
// function hide_tweet() {
//   document.querySelectorAll("img").forEach((img) => {
//     img.src = `https://source.unsplash.com/${img.width}x${
//       img.height
//     }/?cheese&${Math.random()}`;
//     img.srcset = img.src;
//   });
// }

function hide_tweet() {
  let articles = document.getElementsByTagName("article");
  console.log(articles);
  Array.from(articles).forEach((article) => {
    article.style.display = "none";
  });
}
