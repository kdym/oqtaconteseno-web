// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require jquery_ujs
//= require datatables.js.erb
//= require dd-slick/dd-slick.min
//= require moment-js
//= require jquery-validate.js.erb
//= require tooltip
//= require jquery.form
//= require jquery-masks
//= require jquery-tmpl
//= require marker-clusterer/marker-clusterer
//= require_tree .

$('#avatar-menu').popover({
    content: function () {
        return $('#user-popover').html();
    },
    placement: 'bottom',
    html: true
});