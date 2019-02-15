{literal}
<style>
<!--
#main_container {
	margin: 0px !important;
	padding: 0px !important;
}
-->
</style>
{/literal}

<div id="whitelabel_iframe" style="margin:0;padding:0;width:100%;height:100% !important;overflow:hidden;left:0px;min-height:100% !important">
<iframe id="{$whitelabel_iframe_id}"
		src="{$whitelabel_iframe_src}"
		width="100%"
		scrolling="no"></iframe>
</div>
<p id="callback"></p>

{literal}
<script type="text/javascript">

$( "#{/literal}{$whitelabel_iframe_id}{literal}" ).iFrameResize({
	log                     : false,                  // Enable console logging
	checkOrigin             : false,                   // only allow incoming messages from the domain listed in the src property
	autoResize              : true,                   // enabled changes to the Window size or the DOM will cause the iFrame to resize to the new content size
	inPageLinks             : true,                   // page linking inside the iFrame and from the iFrame to the parent page will be enabled
	minHeight               : $("body").height() - 104,
	resizedCallback         : function(messageData){ // Callback fn when resize is received
		/*
		var msg = "resizedCallback [ frame_id : " + messageData.iframe.id + " , height : " + messageData.height + " , width : " + messageData.width + " , event_type : " + messageData.type + " ]";
		console.log(msg);
		*/
	},
	messageCallback         : function(messageData){ // Callback fn when message is received
		/*
		var msg = "messageCallback [ frame_id : " + messageData.iframe.id + " , message : " + messageData.message + "]";
		console.log(msg);
		document.getElementsByTagName('iframe')[0].iFrameResizer.sendMessage('Hello back from parent page');
		*/
	},
	closedCallback         : function(id){ // Callback fn when iFrame is closed
		/*
		var msg = "closedCallback [ frame_id : " + id + "]";
		console.log(msg);
		*/
	}
});

</script>
{/literal}
