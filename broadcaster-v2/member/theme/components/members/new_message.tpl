	<!--
		Send message to model from anywhere on the site
	 -->

	<!-- compose message -->
	<div id="composer" class="message-composer pop-under" style="display: none;" >
		<div id="new_message_header">
			<div class="col-xs-9">New Message</div>
			<div class="col-xs-3 text-right" onclick="message.closeDialog()">
				<i class="fa fa-times"></i>
			</div>
			<div class="clearfix"></div>
		</div>
		<form id="new_message" action="/api/members/messages.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
			<div id="sitemail">
				<input type="hidden" name="member_id" value="{$smarty.session.userid}">
				<input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
				<input type="hidden" id="post_type" name="post_type" value="">
				<input type="hidden" id="model_id" name="model_id" value="">
				<div class="email-to">
					<label for="to">
						<input class="form-control" type="text" name="to_model" id="to_model" value="{$message.recipient_username}" autocomplete="off" placeholder="Search for a model" onkeyup="modelNameFilter()" />
					</label>
					<i class="fa fa-book hide"  title="Address Book" onclick="$('#address_book').modal('toggle')"></i>
				</div>
				<div id="sitemail_address_filter" class="" style="display:none;">
					<div id="sitemail_model_filter"  >
						<ul id="model_list">
						{foreach from=$member_address_list item="address_list"}
							<li id='ab_{$address_list.id}'>
								<a>
									<img src="{$address_list.photo_url}" > &nbsp; <span class="model_name" data-text="{$address_list.username}">{$address_list.username}</span>
									<span class="hidden" data-text="MDL{$address_list.id}">MDL{$address_list.id}</span>
								</a>
							</li>
							{/foreach}
						</ul>
					</div>
				</div>
				<div class="email-subject">
					<label for="subject">
						<input class="form-control" type="text" name="mail_subject" id="mail_subject" placeholder="Subject" >
					</label>
				</div>
				<!-- text area -->
				<div class="email-message">
					<div id="editor">
						<textarea class="form-control" id="mail_message" name="mail_message" placeholder="Say something..."></textarea>
					</div>
					<div id="message_attachment"></div>
				</div>
				<!-- end of text area -->
				<div id="attch_img" class="hiddenfield">
					<input name="qqfile" type="file" id="qqfile" multiple/>
				</div>
				<!-- file upload -->

				<!-- start of composer buttons -->
				<div class="composer-actions">
					<div id="tool-icons">
						<div id="picture" title="Attach an Image">
						</div>
					</div>
					<!-- send mesage -->
					<span id="composer-btns" class="pull-right">
						<button class="btn btn-delete button-3"><i class="fa fa-trash" title="Delete Draft"></i></button>
						 <!-- tip model -->
						<button type="button" id="sendNewMessagePop" class="btn btn-primary button-2" onclick="message.sendMessagToModel()"> <span class="hidden-xs">&nbsp; send &nbsp;</span> <span class="hidden-lg hidden-md hidden-sm"><i class="fa fa-paper-plane" aria-hidden="true"></i></span></button>
					</span>
					<div class="clearfix"></div>
				</div>
			</div>
		</form>
		<div class="clearfix"></div>
	</div>
