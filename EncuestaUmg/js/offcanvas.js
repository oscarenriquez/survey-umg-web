$(document).ready(function () {
  $('[data-toggle=offcanvas]').on('click', function () {
    $('.row-offcanvas').toggleClass('active')
  });

  $('#group-principal').find('a').on('click', function () {
    $(this).addClass('active').siblings().removeClass('active')
  });

  $(document).on('click', function (e) {
  	var menuToggle = $("#menuToggle")[0];
  	var currentStyle = $('.row-offcanvas').hasClass('active');
  	if(currentStyle && e.target !== menuToggle){
    	$('.row-offcanvas').toggleClass('active');
    }
  });
});