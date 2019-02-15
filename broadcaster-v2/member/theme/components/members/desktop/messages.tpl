<section id="my-messages" class="animated fadeIn" style="visibility: hidden">
			<div class="account-panel">
				<div class="account-panel-title"><!-- title -->
					<div class="pull-left account-section-name">
						<i class="fa {$buttons.messages.icon}"></i> &nbsp; {$buttons.messages.caption}
					</div>
				</div>
				<!-- header notifications -->
				<div id="form_output" class="inverted-color text-center" style="display: none;">
				</div>
				<!-- end of header notifications -->
				<!-- end of title -->
				   <div class="clearfix"></div>
				<!-- start of inbox -->
				<div class="inbox">
					<div id="inbox-folders" class="inverted-color col-sm-3 col-md-2 hidden-menu-xs"> <!-- actions menu -->
						<div class="compose-btn hidden-xs">
							<button type="button" class="btn btn-primary button-2">COMPOSE</button>
						</div>
						<!--
						<div class="inbox-folders">
							Folders <i class="fa fa-times hidden-sm hidden-md hidden-lg close-xs-menu" aria-hidden="true"></i>
						</div> -->
						<form id="session" action="/api/members/messages.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
							<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
							<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
							<input type="hidden" id="request_type" name="request_type" value="">
							<input type="hidden" id="message_id" name="message_id" value="">
							<input type="hidden" id="read" name="read" value="">
							<input type="hidden" id="mailbox_action" name="mailbox_action" value="">
						</form>
						<div id="inbox-label" data-target="#inbox-messages" class="primary-color folder-labels selected not-empty">
							<input type="hidden" name="folder" value="inbox">
							<i class="fa fa-inbox" ></i> &nbsp; Inbox <span class="inboxCount">({$f_inboxCount})</span>
						</div>
						<div id="addressbook-label" class="primary-color folder-labels">
							<i class="fa fa-book" ></i> &nbsp; Address Book
						</div>
						<div id="sent-mail-label" data-target="#sent-mail" class="primary-color folder-labels">
							<input type="hidden" name="folder" value="sent">
							<i class="fa fa-paper-plane"></i> &nbsp; Sent Mail {if $f_sentCount}<span class="sentCount">({$f_sentCount})</span>{/if}
						</div>
						<div id="archive-label" data-target="#archived-messages" class="primary-color folder-labels">
							<input type="hidden" name="folder" value="saved">
							<i class="fa fa-archive"></i> &nbsp; Saved <span class="savedCount">({$f_savedCount})</span>
						</div>
						<div id="trash-label" data-target="#deleted-messages" class="primary-color folder-labels">
							<input type="hidden" name="folder" value="trash">
							<i class="icon ion-trash-b"></i> &nbsp; Trash <span class="trashCount">({$f_trashCount})</span>
						</div>
					</div>

					<div id="messages-sections" class="col-sm-9 col-md-10"><!-- messages-->
						 <!-- inbox tools -->
						<div id="inbox-tools" class="show">
							<span class="selectBox button-3 hidden-xs">
								<label for="check-all">
								<input type="checkbox" name="check-all" id="check-all" >
									<span></span>
								</label>
							</span>
							<span class="mobile-compose button-2 hidden-sm hidden-md hidden-lg">
								<i class="fa fa-pencil"></i>
							</span>
							<!-- reload -->
							<span class="reloadBox unchecked button-2" >
								<i class="fa fa-repeat fa-rotate-right"></i>
							</span>
							<!-- go back -->
							<span class="back-arrow hide" >
								<i class="fa fa-long-arrow-left"></i>
							</span>
							<!-- archive -->
							<span class="archive button-3 checked" data-text="saved" title="Move to Save Messages">
								<i class="icon ion-android-archive" ></i>
							</span>
							<span class="block button-3 checked" data-text="block" title="Block model">
								<i class="fa fa-ban"></i>
							</span>
							<span class="delete button-3 checked" data-text="trash" title="Move to trash">
								<i class="icon ion-trash-b"></i>
							</span>
							<span class="bti checked"><!-- bti Back to Inbox -->
								<i class="fa fa-inbox"></i>
							</span>
							<span class="df button-3 checked" data-text="delete" title="Delete forever"><!-- delete forever -->
								<i class="fa fa-trash-o" ></i>
							</span>
							<!-- <span class="mobile-menu-toggle hidden-sm hidden-md hidden-lg">
								<i class="fa fa-align-justify "></i>
							</span> -->
							<div class="mobile-menu-toggle hidden-sm hidden-md hidden-lg">
								<div id="nav-icon1" >
									<span></span>
									<span></span>
									<span></span>
								</div>
							</div>
							<div class="pull-right ">
							<!-- messages navigation if more than.... -->
							{*<!--
								<div class="inbox-nav">
									<div class="msgs-str-count hidden-xs">1-20 <span>of</span> {$f_inboxCount}</div>
									<div class="msgs-nav-left"><i class="fa fa-chevron-left"></i></div>
									<div class="msgs-nav-right"><i class="fa fa-chevron-right"></i></div>
								</div>
								-->*}
							</div>
						</div><!-- end of tools -->
						<!-- start of messages -->
						<div id="inbox-messages" class="show section">
						{if $mail_list}
						{foreach from=$mail_list item="mail_item"}
							<div id="topMsg_{$mail_item.id}" class="dom_rendered message-line"><!-- messages container row-->
								<div class="msg-status {if $mail_item.status eq 'Unread' } unread-label{/if}"><!-- message status color code label-->
										&nbsp;
								</div>
								<div id="msg_{$mail_item.id}" class="message-div {if $mail_item.status eq 'Unread' } msg-unread{else} msg-read{/if}"><!-- messages list -->
									<div class="msg-checkbox"><!-- check box container -->
										<!--  /* label, input name and ipnput id must all much and be unique */ -->
										<label for="select-msg-{$mail_item.id}">
											<input type="checkbox" name="select-msg-{$mail_item.id}" id="select-msg-{$mail_item.id}" value="{$mail_item.id}">
											<span></span>
										</label>
									</div><!-- end of check box container -->
									<div class="from  unread-msg {if $mail_item.status eq 'Unread' } yes{else} no{/if}"><!-- message from -->
										{$mail_item.name} {if $mail_item.blocked}<span class="strong">{$mail_item.blocked}</span>{/if}
									</div><!-- end of from -->
									<div class="subject unread-msg {if $mail_item.status eq 'Unread' } yes{else} no{/if}"><!-- message subject -->
										{$mail_item.subject|truncate:62:" ...":false:false}
									</div><!-- end of subject -->
									<div class="message-intr"> <!-- message intro preview -->

											{foreach from=$mail_item.body item="body" name="body_text"}
												 {if $smarty.foreach.body_text.last}
													 {$body.text}
												 {/if}
											 {/foreach}

									</div>
									<!-- if message has attachment -->
									<div class="attachement">
									{if $mail_item.has_attachment}<i class="fa fa-paperclip" aria-hidden="true"></i>{else}&nbsp;{/if}

									</div>

									<div class="message-time text-right">
									{$mail_item.send_recv_date}
									</div>
								</div><!-- end of message list -->
							</div><!-- end of message row -->
							{/foreach}
							{else}
								<div id="no_messages_found" class="text-center message-line">No messages found</div>
							{/if}
							<div id="new_items">
							</div>
						</div>

						<div class="clearfix"></div>
						<!-- open and view message -->
						<div id="view-message" class="animated fadeIn hide" style="visibility: none">
							<input type="hidden" id="messageId" name="messageId" value="">
							<!-- from -->
							<div class="messageSubject">
							<div class="col-xs-6 senderImg"><!-- sender thumbnail -->
								<img src="" style="float:left; margin-right:15px;"> <h2></h2>
							</div>
							<div class="mvrs col-xs-6 text-right"> <!-- mvrs message view right side -->
								<span id="message-time"></span>
								<span id="reply">
									<span id="flag-o" style="visibility: hidden;">
									<i class="fa fa-flag-o"></i>
									</span>
									<span id="replyMsg">
									<i class="fa fa-reply text-right button-2"></i>
									</span>
								</span>
							</div>
							<div class="clearfix"></div>
							</div>
							<!-- message text -->
							<div id="message-txt" class="col-xs-12">
							</div>
							<div class="clearfix"></div>

							<div id="reply-input-txt" class="col-xs-12" style="display:none" >
								<form id="reply-message" action="/api/members/messages.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data" >
									<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
									<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
									<input type="hidden" id="request_type" name="post_type" value="message reply">
									<input type="hidden" id="rp_message_id" name="rp_message_id" value="">
									<div class="message-reply">
										<div class="col-sm-1" >
											<img src="{$memberPhotoUrl}">
										</div>
										<div class="col-sm-11" style="padding-right:0">
											<div class="email-message">
											<textarea class="form-control" id="message_reply" name="message_reply" placeholder="Reply text" ></textarea>
											<div class="btn-group pull-right">
												<a href="#" id="sendMsg" class="btn btn-primary button-2"> <i class="fa fa-paper-plane"></i> Send</a>
												<a href="#" id ="discardMsg" class="btn btn-default button-3"> <i class="fa fa-trash"></i> Discard</a>
											</div>
											<!-- end of text area -->
											</div>
										</div>
									</div>
									<div class="clearfix"></div>
								</form>
							</div>
							<!-- place holder for incoming attahcments -->
							<div id="has_attachment"></div>
						</div>

					</div><!-- end of messages -->
					<div class="clearfix"></div>
				</div>
				<!-- end of inbox -->
	</section>
<!--
		composer
 -->
 {include file="$_THEME/components/members/new_message.tpl"}

<div class="modal fade" id="address_book" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header navbar-inverse">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fa fa-times"></i></button>
				<h3 class="modal-title ">Address Book </h3>
			</div>
			<div class="inverted-color modal-body">
				{foreach from=$member_address_list item="address_list"}
				<div id='ab_{$address_list.id}' class="col-sm-4 col-xs-6 ab_model_grid" >
					<img src="{$address_list.photo_url}" > &nbsp; <span class="model_name" data-text="{$address_list.username}">{$address_list.username}</span>
					<span class="hidden" data-text="MDL{$address_list.id}">MDL{$address_list.id}</span>
					<a class="btn btn-primary btn-sm pull-right msgBtn button-2">Message<br> Me</a>
				</div>
				{/foreach}
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
<script>
	{literal}
    $(document).ready(function(){
        setTimeout(function(){
            $('#inbox-label').click();
        },1000);

        if (window.matchMedia('(max-width: 767px)').matches){
            $.cookie('messages', 'ture');
        }
    });

	{/literal}
</script>
