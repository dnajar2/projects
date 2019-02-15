<!-- $show is {$show} -->
{if $show eq 'myaccount'}
<!-- Bootstrap core JavaScript ================================================== -->
<!-- commented out the below line jquery is loaded twice -->
{*<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/bootstrap.min.js"></script>*}
{/if}

<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/flat-ui.min.js{$CacheBuster->getFileRevision()}"></script>

<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/isotope.pkgd.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/imagesloaded.pkgd.min.js{$CacheBuster->getFileRevision()}"></script>

{if empty( $show ) }
<script language="JavaScript" type="text/javascript" src="https://npmcdn.com/isotope-layout@3.0/dist/isotope.pkgd.min.js"></script>
{/if}

<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/css/assets/docs.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/wow.min.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/jquery_plugins/jquery.cookie.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="https://www.google.com/recaptcha/api.js"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/captchas.js{$CacheBuster->getFileRevision()}"></script>

{if $show eq 'myaccount' ||  $show eq 'contact'}
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/wow.min.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/fileinput.js{$CacheBuster->getFileRevision()}"></script>
{/if}

{if $smarty.session.__logged_in }
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/members/my-account.js{$CacheBuster->getFileRevision()}"></script>
{/if}

<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/effects.js{$CacheBuster->getFileRevision()}"></script>

{if $show eq 'myaccount' && ($desktop_button eq 'purchases' || $desktop_button eq 'credithistory')}
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/jquery-ui/jquery-ui.js{$CacheBuster->getFileRevision()}"></script>
{/if}
{if $desktop_button eq 'content'}
	<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/members/html-video-player.js{$CacheBuster->getFileRevision()}"></script>
	<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/owl/dist/owl.carousel.min.js{$CacheBuster->getFileRevision()}"></script>
{/if}
{if $show eq 'myaccount' && $desktop_button eq 'messages'}
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/sitemail.js{$CacheBuster->getFileRevision()}"></script>
{/if}

<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/bootstrap-formhelpers.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/jquery_plugins/jquery.extensions.js{$CacheBuster->getFileRevision()}"></script>

{if $show eq 'profile'}
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/blueimp-gallery.min.js{$CacheBuster->getFileRevision()}"></script>
{/if}
{if $show eq 'register_studios'}
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/managers/managers.js{$CacheBuster->getFileRevision()}"></script>
{/if}
<script>

{literal}
$(document).ready(function() {
	$.ajaxSetup({
		headers : {
			'X-REQUESTED-WITH' : 'xmlhttprequest'
		}
	});
});

{/literal}
var popjoinmodal = {if $smarty.get.popjoinmodal}true{else}false{/if};
</script>
{literal}


<script type="text/javascript">
    var  browserVersion = function(){
        var ua= navigator.userAgent, tem,
            M= ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
        if(/trident/i.test(M[1])){
            tem=  /\brv[ :]+(\d+)/g.exec(ua) || [];
            return 'IE '+(tem[1] || '');
        }
        if(M[1]=== 'Chrome'){
            tem= ua.match(/\b(OPR|Edge)\/(\d+)/);
            if(tem!= null) return tem.slice(1).join(' ').replace('OPR', 'Opera');
        }
        M= M[2]? [M[1], M[2]]: [navigator.appName, navigator.appVersion, '-?'];
        if((tem= ua.match(/version\/(\d+)/i))!= null) M.splice(1, 1, tem[1]);
        return M.join(' ');
    };

function whatAmI(str){
	$('#loginModal').modal('toggle');
	$('#login_error').removeClass('show').addClass('hide');
	$('#login_error_msg').text("")

		if(str === 'model'){
			$('#footer-login a:nth(0)').click()
			$('.log-in-fields a:nth(1)').parent().hide()
			$('.log-in-fields a:nth(3)').parent().show()
			$('.log-in-fields a:nth(2)').parent().show()
			$('.log-in-fields a:nth(3)').parent().find('.primary-color').show()
		}
		else if(str === 'manager'){
			$('#footer-login a:nth(1)').click();
			$('.log-in-fields a:nth(2)').parent().hide()
			$('.log-in-fields a:nth(3), .log-in-fields a:nth(1)').parent().show()
			$('.log-in-fields a:nth(3)').parent().find('.primary-color').hide()
		}
		else if(str === 'member'){
			$('#login_modal_button').click();
			$('.log-in-fields a:nth(3)').parent().hide();
			$('.log-in-fields a:nth(1), .log-in-fields a:nth(2)').parent().show()
		}

};

function nagBar(){
	setTimeout(function(){
		$('.fixed-header-wrap').css('position','relative')
		$('#confirm_email_top_bar').slideDown();
		$('.page-header').css('margin-top', '2px');
		$('#header_margin.navbar-inverse').css('margin-top', '0');
		$('body').css('padding-top', '0')
	}, 1000);

}
//brand modal pop up base on the string passed to the function
var modelName = null;

function joinModalBranded(str, model){
	if(modelName == null){
		modelName = model;
	}

	$('#branded').html('<p>Sign up and ' + str + '<em>"'+modelName+'"</em></p>')
}

function wcc3_build_modal(title, body, footer){
	this.title = title,
	this.body = body,
	this.footer = {
		enable: footer.enable,
		buttons: footer.buttons
	};
	$('#wcc3_modal .modal-title').text(this.title);
	$('#wcc3_modal .modal-body').empty().append(this.body);

	if( this.footer.enable ){
		$('.modal-footer').empty()
		if( this.footer.buttons == 1 ){
			$('.modal-footer').append('<div class="col-xs-12">'+
					'<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'+
					'</div>')
		}else if(this.footer.buttons == 2){
			$('.modal-footer').append('<div class="col-xs-6">'+
					'<button type="button" class="btn btn-default button-3" data-dismiss="modal">Close</button>'+
					'</div>'+
					'<div class="col-xs-6">'+
					'<button type="button" class="btn btn-primary button-2">Save changes</button>'+
					'</div>')
		}
	}else{
		$('#wcc3_modal .modal-footer').hide()
		}
	$('#wcc3_modal').modal('show')
}

//dynamiclaly generate a modal
//var title, body, footer
// title = "This modal's tile is cool";
// body = "<h2>What is the size of this text on the body section?</h2>";
// footer = {enable:true, content: '<p>What is the size of this text</p>', buttons:2 };
// wcc3_build_modal(title, body, footer)
$(document).ready(function() {
    $('#agreeToTerms').on('click', function(e){
        if($(this).hasClass('disabled')){
            alert("Please read the full terms and conditions before clicking I agree.");
            e.preventDefault()
        }
    });
    $('#theTerm').on('scroll', function() {
        if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {

            $('#agreeToTerms').removeClass('disabled');
        }
    });

	$('#tabletUserTools button').on('click', function(){
		$('#tabletUserTools .navbar-inverse.dropdown-menu.pull-right').slideToggle()
	});

	$('#joinModal').on('hidden.bs.modal', function () {
		try {
			$('#branded').html('');

			//check if the chat is loaded and reset scrollPosition;
			if ( typeof doScrollPage != "undefined" && typeof doScrollPage == "function" ) {
				hasSetScrollPointPort = false;
				hasSetScrollPointLand = false;
				doScrollPage();
			}
		}
		catch ( e ) {
			console.log('joinModal: doScrollPage catch e = ' + e );
		}
	});

	$('#joinModal').on('show.bs.modal', function () {
		try {
			//Scroll mobile device so button is visible.
			if ( window.innerWidth < 600 ) {
				window.scrollTo( 0, 180 );
			}
		}
		catch ( e ) {
			console.log('joinModal: scrollTo catch e = ' + e );
		}
	});

	$('.close.fa.fa-times-circle').on('click', function(){
        var parentId =  $(this).attr('data-target');
        $(parentId).slideUp(function(){
            $('.fixed-header-wrap, .page-header, #body, body').removeAttr('style')
            $('#header_margin.navbar-inverse').removeAttr('style');
            $('#confirm_email_top_bar').remove();
        });
	});
	//check if message box is present
	if( $('#form_output').length === 0 ){
		$('<div id="form_output" class="inverted-color text-center" style="display: none;"></div>').insertAfter('#header_margin.navbar-inverse')
	};

	// Get attribute type from link
	$('.linkplain, .loginbtn a, #login_modal_button, .btn-default.form-submit a').on('click', function(){
		if( $(this).attr('data-type') ){
			var dataType = $(this).attr('data-type');
			$('#login_type, #pwd_type').val(dataType);
			$('.member_type').text(dataType);

			if(dataType == "model"){ // Models

				$('#modal_body').addClass(dataType+"-type");
				if(window.matchMedia('(min-width:768px').matches){
                    $('#loginModal .modal-content').css('width', '450px');
                }
				$('#type_member,  #type_manager').hide();
				$('#type_model').show();
				$('#modal_body').css('background-color', '#fff');
				$('.log-in-fields a:nth(1)').parent().hide();
				$('.log-in-fields a:nth(3)').parent().show();
				$('.log-in-fields a:nth(2)').parent().show();
				$('.log-in-fields a:nth(3)').parent().find('.primary-color').show();

			}
			else if(dataType == "manager"){ // managers

				$('#modal_body').addClass('model-type');
                if(window.matchMedia('(min-width:768px').matches){
                    $('#loginModal .modal-content').css('width', '450px');
                }
				$('#closeModal, #type_member hr').hide();
				$('#type_manager').show();
				$('#type_model, #type_member').hide();
				$('#modal_body').css('background-color', '#fff');
				$('.log-in-fields a:nth(2)').parent().hide();
				$('.log-in-fields a:nth(3), .log-in-fields a:nth(1)').parent().show();
				$('.log-in-fields a:nth(3)').parent().find('.primary-color').hide();
			}
			else if(dataType == "member"){ // members
				$('#modal_body').addClass(dataType+"-type").removeClass('model-type');
				$('#closeModal, #type_member hr').show();
				$('#loginModal .modal-content').css('width', '');
				$('#type_member').show();
				$('#type_model, #type_manager').hide();
				$('#modal_body').css('background-color', '');
				$('.log-in-fields a:nth(3)').parent().hide();
				$('.log-in-fields a:nth(1), .log-in-fields a:nth(2)').parent().show();
			}
		}

	})

	//back to top
	var offset = 600;
	var duration = 300;
	$(window).on('scroll', function() {
		if ($(this).scrollTop() > offset) {
			$('.back-to-top').fadeIn(duration);
		} else {
			$('.back-to-top').fadeOut(duration);
		}
	});

	$('.back-to-top').on('click',function(event) {
		event.preventDefault();
		$('html, body').animate({scrollTop: 0}, duration);
		return false;
	});
    $(document).on('mouseup', function(e){
        var dropNav = $('#my-tools .dropdown');
        var dropNav2 = $('#tabletUserTools .dropdown');

        if ( dropNav.hasClass('open') ){
            if (!dropNav.is(e.target) && dropNav.has(e.target).length === 0 ){
                dropNav.toggleClass('open close');
            }
        }

        if ( dropNav2.hasClass('open') ){
            if (!dropNav2.is(e.target) && dropNav2.has(e.target).length === 0 ){
                dropNav2.removeClass('open');
                $('.tabletUserToolsPanel').find('.navbar-inverse').slideToggle()
            }
        }

    });
});

$('.modal-header').find('span').on('click', function(){
    var modalId = $(this).closest('.modal').attr('id');
    $('#'+modalId).find('input').val("");
})
// $('.btn').on('focus', function(){
// 	$(this).blur();
// })
{/literal}
//{* pop join modal  popjoinmodal=true *}
{if $smarty.get.popjoinmodal eq true}
    {literal}
        $(function(){
            $("#join_free_button").click();
        });
    {/literal}
{/if}
{if $smarty.get.poploginmodal eq true}
{literal}
$(function(){
    $("#login_modal_button").click();
});
{/literal}
{/if}
{literal}
</script>
{/literal}
{if $SiteSettings.display_confirm_email eq "On" && $smarty.session.show_confirm_email.nag}
<script type="text/javascript">
    nagBar()
</script>
{/if}

{include file="wcc3/components/pixel_fires.tpl"}
<!--  modals  -->
{include file="wcc3/components/load_modals.tpl" show=$show}
<script>
{if $jsFooter}
    {foreach from=$jsFooter item="jsLine"}
        {$jsLine}
    {/foreach}
{/if}
</script>
