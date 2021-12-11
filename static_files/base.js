$(document).ready(function() {
  $('#toggle-button').click(function(event) {
    $(this).toggleClass('collapsed');
    $('#header_main .navbar ul.navbar-nav').toggleClass('collapsed');
    $('#bg-black').toggleClass('collapsed');
    $('#header').toggleClass('collapsed');
  });
});
