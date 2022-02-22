import $ from "jquery";
import "select2";

const initSelect2 = () => {
  $("select").select2({
    minimumResultsForSearch: -1,
  });
};

export { initSelect2 };
