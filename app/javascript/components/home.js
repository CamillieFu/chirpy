import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Towards a more positive future, together."],
    typespeed: 30000,
    showCursor: false,
    // loop: true
  });
}

export { loadDynamicBannerText };
