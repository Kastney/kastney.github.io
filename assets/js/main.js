function getScrollY() {
  var isCSS1Compat = ((document.compatMode || "") === "CSS1Compat");
  return window.scrollX !== undefined ? window.scrollY : isCSS1Compat ? document.documentElement.scrollTop : document.body.scrollTop;
}