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
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
	console.log("turbolinks_load: application");
	flash_close();
	accordion_setup();
});

function flash_close() {
	console.log("Close Flash Message");
	var def = $.Deferred();

	$(".flash").click(def.resolve);
	setTimeout(def.resolve, 5000);

	def.done(function(){
		$(".flash").fadeOut("slow");
	});
}

function accordion_setup() {
	var acc = document.getElementsByClassName("accordion");

	for (var i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
			/* Toggle between adding and removing the "active" class,
			to highlight the button that controls the panel */
			this.classList.toggle("active");

			/* Toggle between hiding and showing the active panel */
			var panel = this.nextElementSibling;
			//console.log(panel.style.display);
			switch(panel.style.display) {
				case "block":
				case "inline-block":
					panel.style.display = "none";
					if (panel.nextElementSibling.tagName == "BR") {
						panel.nextElementSibling.style.display = "none";
					}
					break;
				default:
					if (panel.tagName == "TABLE") {
						panel.style.display = "block";
					} else {
						panel.style.display = "inline-block";
					}
					if (panel.nextElementSibling.tagName == "BR") {
						panel.nextElementSibling.style.display = "block";
					}
			}
		});
	}
}