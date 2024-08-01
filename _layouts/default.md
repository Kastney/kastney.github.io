---
layout: compress
---

<!DOCTYPE html>
<html lang="{{ page.lang | default: site.lang }}">
  {%- include head.html -%}
  <body>
    {%- include views/header.html -%}
    {%- include views/banner.html -%}
    {{ content }}    

<script>
function initHeader() {
  function setScrollStatus() {
    var y = getScrollY();
    var status = y <= 0 ? "top" : window.innerHeight + y >= document.body.offsetHeight - 1 ? "bottom" : y - auxScrollY > 0 ? "down" : "up";
    html.setAttribute("scroll-status", status);
    auxScrollY = y;
  }
  var auxScrollY = getScrollY();
  var html = document.documentElement;
  window.addEventListener('scroll', function(e){ setScrollStatus(); });
  setScrollStatus();
}
document.addEventListener('DOMContentLoaded', initHeader);
</script>

  </body>
</html>