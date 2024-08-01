function getScrollY() {
  var supportPageOffset = window.scrollX !== undefined;
  var isCSS1Compat = ((document.compatMode || "") === "CSS1Compat");  
  return supportPageOffset ? window.scrollY : isCSS1Compat ? document.documentElement.scrollTop : document.body.scrollTop;
}