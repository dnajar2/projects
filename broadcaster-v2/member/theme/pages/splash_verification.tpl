{include file="wcc3/components/html_header.tpl" show=$show}
<style type="text/css">
{literal}
    h2{
        padding-top: 50px;
    }
    .col-xs-12{
        padding-bottom: 15px;
    }
    .bg-warning.col-xs-12 {
        margin-top: 20px;
    }
    @media (max-width: 767px){
        .br-on-mobile{
            display: block;
        }
    }
{/literal}
</style>
<body>
{include file="wcc3/components/header.tpl"}
<div class="splash_container col-md-8 col-md-offset-2">
	{*<div class="bar1 splash_bar">*}
		{*<h2 class="txt1 splash_bar_txt col-xs-12 lead"><strong> Read The Following</strong></h2>*}
	{*</div>*}
	<div class="splash_box" data-module-box="true">
		<div class="txt splash_box_txt">
            <div class="bg-warning col-xs-12 primary-color">
                <div class="lead"><strong>WARNING! Read The Following</strong></div>
                <div class="splash_warning2">
                    THIS SITE CONTAINS ADULT-ORIENTED, AGE RESTRICTED MATERIALS<BR>
                    YOU MUST BE AT LEAST <span class="splash_18_years">18 YEARS</span> OLD TO ENTER THIS WEB SITE.
                </div>
            </div>
            <hr>
			
			<div class="splash_warning3 col-xs-12">
				By entering this website and/or submitting the information below, you agree to all of this site's <a href="/?{'show=terms&width=900'|base64_encode}" rel="popup wccterms 900 525 0 0 center resizeable scrollbars noicon" class="normal_link">Terms & Conditions</a>.  <span class="splash_warning3_emphasis">You further agree that the laws of the United States of America shall govern this transaction</span>.<br><br>
				To enter this site, you must certify and affirm, under the penalties of perjury, that you are over the age of majority on the following Birth Date Verifier&#8482; Form:<br><br>
				"I hereby affirm, under the penalties of perjury pursuant to Title 28 U.S.C. &sect;1746, that I am currently over the age of 18 years old.  I also agree that this transaction is governed by the Electronic Signatures in Global and National Commerce Act (E-Sign Act), 15 U.S.C. &sect;7001, et sq."
			</div>
			
			<div class="splash_button_container col-xs-12">
				<form method="POST" action="index.php" name="verification_form">
				<input type="hidden" name="isSet" value="1">
				<input type="hidden" name="show" value="{$show}">
           		<button type="submit" value="" class="btn button-2" onclick="document.verification_form.submit(); this.blur(); return false;">
                    By clicking this button, I intend to electronically <span class="br-on-mobile"> sign this document and affirm the above sworn statements</span>
                </button>
           		</form>
			</div>
			
			<div class="splash_warning4 col-xs-12">
				Note: This information is provided in an effort to comply with the Child Online Protection Act (COPA) and related state law.  Providing a false declaration under the penalties of perjury is a criminal offense.  This document constitutes an un-sworn declaration under federal law.  You may submit a paper copy of this transaction and print this form for your personal records.  You have the right to withdraw your consent to use the E-Sign Act by emailing us.  Your consent to use the E-Sign Act is limited to providing the information on this form.  Access to this electronic record requires a simple browser program such as Internet Explorer&#8482; or Netscape&#8482; and a computer.  You adopt the mark typed in the form below as your electronic signature.
			</div>
			
			<div class="splash_first_amendment col-xs-12">
				<a href="http://www.firstamendment.com" target="_blank"><img src="{$_PATH_IMG}/global/first_amendment.jpg" border="0" /></a>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
{include file="wcc3/components/footer.tpl" show=$show}
</body>

{include file="wcc3/components/html_footer.tpl" show=$show}
