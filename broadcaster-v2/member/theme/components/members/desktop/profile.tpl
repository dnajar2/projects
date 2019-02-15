<!-- Start of section -->
<section id="my-profile" style="visibility: hidden" >
	<div class="account-panel">
		<div class="account-panel-title"><!-- title -->
			<div class="pull-left account-section-name">
				<i class="fa fa-user"></i> &nbsp; Profile {$membersaccount_settings.username}
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- end of title -->
		<div class="clearfix"></div>
		<!--  grab profile photo  -->
		<form id="profile-image-upload" action="/api/members/profile.php" method="post" enctype="multipart/form-data">
			<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
			<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
			<input id="profile-image" name="qqfile" type="file" class="file-loading">
		</form>
		<form id="profile-image-delete" action="/api/members/profile.php" method="post" enctype="multipart/form-data">
			<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
			<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
			<input type="hidden" name="deletePhoto" id="deletePhoto" value="deletePhoto">
		</form>
		<!--  grab member info  -->
		<form id="profile_informtion" action="/api/members/profile.php" enctype="multipart/form-data" method="post">
			<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
			<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
			<div class="field-message text-center" style="display: none"></div>
			<div class="section">
				<div class="section-panel">
					<div id="img-placeholder" class="col-lg-2 col-md-3">
						<div class="text-center">
							<div id="loading_pro_img" style="display: none">
								<img src="{$smarty.const.CDN_SCHEMA}/images/wcc3/loading.gif">
							</div>
							<img id="main_profile_photo" src="{$member_profile.mid_photo_url}" alt="{$member_profile.username}" onclick="document.getElementById('profile-image').click()">
						</div>
						<div class="centerContent">
							<span class="btn btn-default button-3"><i class="glyphicon glyphicon-remove" onclick="Members.deletePhoto()"></i></span> &nbsp;
							<span class="btn btn-primary btn-file button-2" onclick="document.getElementById('profile-image').click()"><i class="glyphicon glyphicon-folder-open"></i></span>
						</div>

						<!-- include other inputs if needed and include a form submit (save) button -->
					</div>
					<div id="profile-details" class="col-lg-6 col-md-5">

							<div id="gender" class="details-section">
								<label class="col-lg-3">
									my gender:
								</label>
								<div class="bfh-selectbox col-lg-9" data-name="profile[gender]" data-value="{$member_profile.gender}">
									<div data-value="">Select</div>
									<div data-value="female">Female</div>
									<div data-value="male">Male</div>

								</div>
								<div class="clearfix"></div>
							</div>
							<div id="interested_in" class="details-section">
								<label class="col-lg-3">
									Interested In:
								</label>
								<div class="bfh-selectbox col-lg-9" data-name="profile[desired_gender_id]" data-value="{$member_profile.desired_gender_id}">
									<div data-value="">Select</div>
									{foreach from=$genderIds key="k" item="v"}
									<div data-value="{$v.genderId}">{$v.label}</div>
									{/foreach}
								</div>
								<div class="clearfix"></div>
							</div>
							<div id="dob" class="details-section">
								<label class="col-lg-3">
									Date of Birth:
								</label>
								<div class="bfh-selectbox col-lg-3" data-name="profile[birthday_month]" data-value="{$member_profile.birthday_month}">
									<div data-value="">Select</div>
									{foreach from=$dob_month key='month_name' name='dob_month' item="dob_month"}
									<div data-value="{$dob_month}">{$month_name}</div>
									{/foreach}
								</div>
								<div class="bfh-selectbox col-lg-3" data-name="profile[birthday_day]" data-value="{$member_profile.birthday_day}">
									<div data-value="">Select</div>
									{foreach from=$dob_day name='dob_day' item="dob_day"}
									<div data-value="{$dob_day}">{$dob_day}</div>
									{/foreach}
								</div>
								<div class="bfh-selectbox col-lg-3" data-name="profile[birthday_year]" data-value="{$member_profile.birthday_year}">
									<div data-value="">Select</div>
									{foreach from=$dob_years item="dob_year"}
									<div data-value="{$dob_year}">{$dob_year}</div>
									{/foreach}

								</div>
								<div class="clearfix"></div>
							</div>
							<div id="located" class="details-section">
								<label class="col-lg-3">
									I live in:
								</label>
								<div class="bfh-selectbox col-lg-9" data-name="profile[country_id]" data-filter="true" data-value="{$member_profile.country_id}">
									<div data-value="">Select</div>
									{foreach from=$country_list name='countrys' key='k' item="country"}
									<div data-value="{$country.pkCountryID}">{$country.CountryName}</div>
									{/foreach}

								</div>
								<div class="clearfix"></div>
							</div>
							<div id="us_zip" class="details-section">
								<label class="col-lg-3">
									Zip code(us only):
								</label>
								<div class="col-lg-9">
									<input type="text" class="form-control" name="profile[zipcode]" id="zip-code" placeholder="Zip Code (US Only)" data-min="5" data-max="5" value="{$member_profile.zipcode}" readonly>
								</div>
								<div class="clearfix"></div>
							</div>
						</form>
					</div>
					<div id="about" class="col-md-4">
						<div id="about_title">
							ABOUT YOURSELF<br>
							<span id="countChars">1000 Max</span> <span> characters</span>
						</div>
						<div>
							<textarea name="profile[description]" id="profile_description" onKeyDown="coutChars(l,max)">{$member_profile.description}</textarea>
						</div>
						<div id="about_disclaimer">
							Your introduction should be a couple sentences long and con not contain HTML tags or personal contact information. Your introduction is subject to review.
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="text-center">
				<button id="sub-btn" type="button" class="btn btn-primary button-2">SUBMIT</button>
			</div>
		</form>
	</div><!-- end of col -->
</section>
<!-- end of section -->

{literal}
<script>
$(document).ready(function(){

	setTimeout(function(){
		if($('#located .bfh-selectbox input').val() == 1){
			$('#us_zip input').attr('readonly',false);
			}
	}, 200)

	$('#profile-image').hide(); // hide file input
	if($('#main_profile_photo').attr('src') == "{$smarty.const.CDN_SCHEMA}/images/wcc2/global/members/mbr_no_photo_large.png"){
		$('.btn.btn-default').hide();
	}

	$(':file').on('change', function(){
		//initiate ajax call
		var parentId = $(this).parent().attr('id')
		Members.sendProfileImg(parentId);
	})

	$('.bfh-selectbox-options').find('li:contains(Select)').hide()
	// add fa icon to select box in place of default
	$('.selectbox-caret').removeClass('caret').addClass('fa fa-chevron-down')
	$('#sub-btn').on('click', function(){
		$('#profile_informtion').submit()
	});
	$('.file-default-preview img , .btn-file').attr('onclick', 'fileExplorer()');

	if (window.matchMedia('(max-width: 767px)').matches){
		$('.bfh-selectbox-toggle').on('touchstart', function(){
			var $this = $(this)
			$this.css('border-color','#2196F3');
		});
		$('.bfh-selectbox').on('hide.bfhselectbox',function(){
			$(this).find('a').removeAttr('style')
		});
	}
	var  inputVal = $('#located .bfh-selectbox input').val();
	$('#located .bfh-selectbox').on('change.bfhselectbox', function (){
		if(inputVal == 1){
			$('#us_zip input').attr('readonly',false);
			$('#us_zip input').focus().css('border-color','#3498db');
		}else{
			$('#us_zip input').attr('readonly',true);
			$('#us_zip input').focus().css('border-color','');
			$('#zip-code').val('')
		}
	})

	$('#img-placeholder .hidden-xs').addClass('hide')
	$('#img-placeholder .btn-file').attr("onclick", "document.getElementById('profile-image').click()");


	$('#profile_informtion').submit(function(e){
		Members.sendProfile($(this).attr('id'));
		e.preventDefault()
	});
	var btnW = $('#imageFuncBtn span').outerWidth();
	var btnL = $('#imageFuncBtn span').length;
});

//listen for text change
$('#located').on('change.bfhselectbox',function(){
	inputVal = $('#located .bfh-selectbox input').val();
	if(inputVal == "1"){
		$('#us_zip input').attr('readonly',false);
		$('#us_zip input').focus().css('border-color','#3498db');

	}
});
//about yourself char counter

	var curentChar = $('#profile_description').text().length;
	var sumOnLoad = 1000 - curentChar;
	$('#countChars').text(sumOnLoad + " Left")

function coutChars(a,b){
		var sum = b - a;
		if(sum == 1000){
			$('#countChars').text(sum + " Max")

		}else{
			$('#countChars').text(sum + " Left")
		}

}
var l = 0;
var max = 1000;
$('#profile_description').on('keydown', function(){
	$(this).delay(20).queue(function(count){
		l = $('#profile_description').val().length;
		coutChars(l,max);
		count()
	});
});
	//remove html tags
$('#profile_description').change(function(){
	var chars = $(this).val().length;
	var cleanText = $(this).val().replace(/<\/?[^>]+(>|$)/g, "");
	var rem_r_n = cleanText.replace(/(\r\n|\n|\r)/gm," ");

	if(rem_r_n > 1000){

		alert('wow trimming down to 1000');

	 	var trimmed = $(this).val().substr(0,1000);
		$(this).delay(1000).queue(function(removeExtTxt){
			$(this).val(trimmed);
			removeExtTxt()
		});
	}else{
		//render clean text
		$(this).val(rem_r_n);
	}
});

</script>
{/literal}
