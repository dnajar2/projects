{include file="$_THEME/components/html_header.tpl" show=$show}

<body>
{include file="$_THEME/components/header.tpl" show=$show}
<div id="preloader" >
	<div class="animated zoomInDown" id="status">&nbsp;</div>
</div>

<div class="page-header container-fluid" ><!-- page header -->
	<div style="display: block" class="title">{$page_title}</div>
</div> <!-- end of page hader -->

 <!-- top row -->
<div id="faq" class="container-fluid section_light">
	<div class="text-center under_construction">
		<img src="{$smarty.const.CDN_SCHEMA}/images/wcc3/under-construction.gif">
	</div>
	<div class="clearfix"></div>
</div> <!-- end of row // -->

{include file="$_THEME/components/footer.tpl" show=$show}

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

{literal}
<script>
$(function(){
	$("select").select2({dropdownCssClass: 'dropdown-inverse'});
	$("#home").focus();
	$('.view .fa').click(function(){
		$('.view .fa').css({color:"#cccccc"});
		 $(this).css({color:"#34495e"});
	});

	$(window).scroll(function(){
		var wypos = $(window).scrollTop();
		var wh	= $(window).height();
		var aypos = $('.bottom_ad').position().top;
		var ah	= $('.bottom_ad').outerHeight();

		if ($(window).width() > 640 && wypos+wh >= aypos){
			var test =  '0 '+ (wypos - aypos + aypos / 10) / 5 + 'px';
			$('.bottom_ad').css({'background-position': test});
		} else {
			$('.bottom_ad').css({'background-position':'0 -40px'});
		}
	});

	$('.bottom_ad').mouseenter(function(){
		$(this).stop().animate({"background-size":"104%"}, 1000);
	});

	$('.bottom_ad').mouseleave(function(){
		$(this).stop().animate({"background-size":"100%"}, 1000);
	});
});

 //logo pup up windows
function Rta() {
	var myWindow =  window.open("http://www.rtalabel.org", "_blank", "toolbar=yes, scrollbars=yes, resizable=yes, top=100, width=1024, height=700");
};

function Asacp() {
	var asacp =  window.open("http://www.asacp.org/ASACP.php", "_blank", "toolbar=yes, scrollbars=yes, resizable=yes, top=100, width=1024, height=700");
};

$(document).ready(function(){
	$('#container').each(function(idx,el){
		el.style.marginTop='';
	});
});
//Safari
if (navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1) {
	$('.element_holder').addClass('safari');
	$('.status').css("font-weight","bolder");
	$('.overlay1 .col-lg-12').css("font-weight","bolder !important");
}

$(document).ready(function(){
	$('#drop-down .dropdown-toggle').on("click", function(e){
		$(this).next('ul').toggle();
		e.stopPropagation();
		e.preventDefault();
	});

	$(function(){
		$('#cat li  i').on('click', function() {
			$("li  i.caret").removeClass("caret");
			$(this).addClass('caret');
		});
	});
});

$(function(){
	$('#joinModal').find('a').on('click', function(){
		$('.modal').modal('hide');
	});
});

$("#drop-down2").find('a').on('click', function(){
	$('#mobil-cat-menu').toggleClass('cat-menu joinbtn')
});

$('#faq  a').click(function(f){
	$(this).next('a').slideToggle('500');
	$(this).find('i').toggleClass('glyphicon-plus glyphicon-minus');
});
$('a#trigger').on('click', function(){
	$('.dropdown-menu ').slideToggle()
});

new WOW().init();

$(function () {
	$('[data-toggle="tooltip"]').tooltip()
});

$('.top-search').click(function() {
	var clicks = $(this).data('clicks');
	if (clicks) {//evem click
		$('.falt-ui-search').addClass('fadeOut');
		$('.falt-ui-search').delay(1000).queue(function(slideOutRight){
			$('.falt-ui-search').addClass('hide').removeClass('fadeOut');
			slideOutRight()
		})
	} else {// odd click

		$('.falt-ui-search').addClass('fadeIn');
		$('.falt-ui-search').removeClass('hide');
		$('.falt-ui-search').delay(1000).queue(function(slideInRight){
			$('.falt-ui-search').removeClass('fadeIn');
			slideInRight()
		});

		$(this).removeAttr('data-original-title');
		$(this).find('.tooltip').hide();
	}
	$(this).data("clicks", !clicks);
});
</script>
{/literal}

</body>

{include file="$_THEME/components/html_footer.tpl" show=$show}
