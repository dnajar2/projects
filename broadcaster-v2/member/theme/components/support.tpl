<!-- supportModal -->
<div class="modal fade" id="supportModal" tabindex="-1" role="dialog" aria-labelledby="supportModalLabel" >

	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header navbar-inverse">
				<h1 class="modal-title">Customer Support</h1>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="sidePanel-xs hidden-sm hidden-md hidden-lg">
						<img src="{$smarty.const.CDN_SCHEMA}/images/wcc3/support-chat.png" class="img-responsive" alt="support">
						<h4>Jessica</h4>
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#supportnavbar" aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<div id="supportnavbar" class="navbar-collapse collapse">
							<ul class="support-actions nav navbar-nav">
								<li><a href="#"><i class="fa fa-print"></i> Print Transcript</a></li>
								<li><a href="#"><i class="fa fa-download"></i> Download Transcript</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> Email Transcript</a></li>
								<li><a href="#"><i class="fa fa-close"></i> End Conversation</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-8 col-md-9">
						<div class="row nowChatting">
							<div class="col-xs-12 hidden-xs">
								<i class="fa fa-comment"></i><h3>You are now chatting with Jessica</h3>
							</div>
						</div>
						<div class="inner-content">
							<p><strong>Jessica:</strong> how may I help you?</p>

							<p><strong class="user">Me:</strong> I can�t log into my account!!!</p>

							<p><strong>Jessica:</strong> Oh my goodnes, I�m sorry to hear that. Can I have your username please?</p>

							<p><strong class="user">Me:</strong> Sure, it�s wankmypole</p>

							<p><strong>Jessica:</strong> Ok great, for security can I verify the last 4 digits of the card on file?</p>

							<p><strong class="user">Me:</strong> Sure, 4673</p>

							<p><strong>Jessica:</strong> Thanks for verifying that. Ok, it looks like you changed your password on November 12th. Do you remember doing that?</p>

							<p><strong class="user">Me:</strong> Oh yea that�s right, thanks!</p>
						</div>
					</div>
					<div class="col-sm-4 col-md-3 sidePanel hidden-xs">
						<img src="{$smarty.const.CDN_SCHEMA}/images/wcc3/support-chat.png" class="img-responsive">
						<h4>Jessica</h4>
						<ul class="support-actions">
							<li><a href="#"><i class="fa fa-print"></i> Print Transcript</a></li>
							<li><a href="#"><i class="fa fa-download"></i> Download Transcript</a></li>
							<li><a href="#"><i class="fa fa-envelope"></i> Email Transcript</a></li>
							<li><a href="#"><i class="fa fa-close"></i> End Conversation</a></li>
						</ul>
					</div>
				</div>
				<form class="row">
					<div class="col-sm-8 col-md-9 form-btm">
						<input type="text" placeholder="type your question here ...">
					</div>
					<div class="col-sm-4 col-md-3 sidePanel btm form-btm">
						<input type="submit" value="Send" class="btn btn-primary btn-info btn-block">
					</div>
				</form>
			</div>

		</div>
	</div>
</div>
