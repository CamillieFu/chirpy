import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Towards a more positive future, together."],
    typespeed: 40,
    showCursor: false,
    // loop: true
    // startDelay: 500,
  });
}

export { loadDynamicBannerText };
