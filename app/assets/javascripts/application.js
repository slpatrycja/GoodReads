// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
function openNav() {
  document.getElementById("mySidenav").style.width = '200px';
  document.getElementById("mySidenav").style.display = "block";
  document.getElementById('openbtn').style.display = 'none';
  document.getElementById('content').style.marginLeft= '210px';
}

/* Set the width of the side navigation to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.display = "none";
    document.getElementById('openbtn').style.display = 'block';
    document.getElementById('content').style.marginLeft= '10px';
}
