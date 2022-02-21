const initCalc_age = () => {
  console.log("hello");
  const date_present = document.getElementById("calc_age");
  if (date_present) {
    const dob = document.getElementById("dob");
    dob.addEventListener("input", (event) => {
      let dob_value = event.target.value;
      let today = new Date();
      let birthDate = new Date(dob_value);
      let age = today.getFullYear() - birthDate.getFullYear();
      let m = today.getMonth() - birthDate.getMonth();
      if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
      }
      date_present.value = age;
      console.log(age);
    });
  }
};

export { initCalc_age };
