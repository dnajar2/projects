let siteMail = {
    show:'mailCompose',
    msgSent: 1,
    toID:"",
    button:"",
    reply:"",
    delete:"",
    save:"",
    ml_formAction:"",
    requestType:"",
    activeTab:"",
    from_swf:null,
    visibility:false,
    close:function(parent, form){
        $(parent).slideUp();
        if(form !== null){
            $('#textarea').val("");
        }
        if(siteMail.reply.length){
            siteMail.reply.show();
            siteMail.delete.show();
        }
    },
    submitForm:function(postType){
        vmBody.postType = postType;
        setTimeout(function () {
            let _form = $('#mainForm');
            let data = _form.serialize();
            $.post({
                url:'/api/models/messages.php',
                data: data,
                cache:false
            })
            .done(function (r) {
                let res = JSON.parse(r);
                console.log(res);
                $('.fa.fa-refresh.fa-spin').hide();
                if(res.status){
                    ui_alerts.alerts_text.text(res.message);
                    ui_alerts.successAlert();
                    if(siteMail.show === "mailReader"){
                        $('#reply').slideUp();
                        siteMail.reply.show();
                        siteMail.delete.show();
                        vmBody.postType = null;
                        if(postType === 'reply'){
                            vmBody.modelsFolderCount();
                        }

                    }
                    else if(siteMail.show === "mailCompose"){
                        // let _input = _form.find('input.form-control');
                        // $.each(_input, function(idx, item){
                        //     console.log(item);
                        //     item.value = "";
                        // });
                        // $('#fileNameInfo').hide();
                        // $('#imgPreview').hide();
                        setTimeout(function () {
                            let uri = window.location.origin + '/models/index.php?c2hvdz1tYWlsbGlzdCZhY3RpdmVUYWI9SW5ib3g=';
                            if(siteMail.from_swf){
                                uri += '&from_model_swf=1';
                            }
                            window.location.href = uri;
                        },500);

                    }
                    $('textarea').val("");
                }else{
                    ui_alerts.alerts_text.text(res.message);
                    ui_alerts.failedAlert()
                }
            })
        },300)
    },
    uploadImage:function(img){
        console.log($(img)[0]);
        let _img = $(img)[0];
        let _form = new FormData();
        let response;
        _form.append('show','mailCompose');
        _form.append('ajax','file');
        _form.append('cache','yes');
        _form.append('qqfile', _img.files[0], _img.files[0].name);

        return $.post({
            url:'/models/',
            data:_form,
            contentType: false,
            processData:false,
        });
    },
    messageAction:function(formId,actionNo,act){
        siteMail.ml_formAction.val(actionNo);
        siteMail.requestType.val(act);
        let _url;
        if(siteMail.show !== "mailReader"){
            _url = $(formId).attr('action');
        }else{
            _url = '/models/?show='+siteMail.show;
            $('input[name=reply_to]').attr('name','viewMessageID');
        }

        let _data = $(formId).serialize();
        $.post({
            url:_url,
            data:_data
        }).done(function (data) {
            let res = JSON.parse(data);
            console.log(res);
            if(res.status){
                let text;
                if(res.requestType === "delete"){
                    text = "Messages Moved to Trash"
                }else if(res.requestType === "deleted"){
                    text = "Messages Deleted Permanently";
                }else if(res.requestType === "save"){
                    text = "Messages Save Successfully";
                }else if(res.requestType === "redirect"){

                    window.location.href = window.location.origin+res.redirect;
                }

                if(res.requestType !== "redirect"){
                    siteMail.mailBoxUiUpdate(text,res);
                }

                if( $('input[type="checkbox"]:checked')){
                    $('input[type="checkbox"]').prop('checked', false);
                }
            }
        })
    },
    mailBoxUiUpdate:function(text,res){
        vm.getMailList();
        vmBody.modelsFolderCount();
        $('.table input[type=checkbox]:checked')
            .closest('.mailItemRow')
            .remove();
        let display = "";
        if(siteMail.activeTab === 'Inbox' && res.inboxCount == "0"){
            display = "show"
        }else if(siteMail.activeTab === 'Saved' && res.saveCount == "0"){
            display = "show"
        }else if(siteMail.activeTab === 'Sent' && res.sentCount == "0"){
            display = "show"
        }else if(siteMail.activeTab === 'Trash' && res.trashCount == "0"){
            display = "show"
        }
        if(display === "show"){
            $('#noMessages').show()
        }
        siteMail.delete.prop('disabled',true);
        siteMail.save.prop('disabled',true);
        ui_alerts.alerts_text.text(text);
        ui_alerts.successAlert()
    },
    toggleMailMenu:function(){
    //on smaller screens
    let inboxList = $('#inbox-list');
    let inboxFolders = $('#inbox-folders');
        if( siteMail.visibility  ){
            inboxList.animate({'width':'100%'});
            inboxFolders.animate({'left':'-200px','display':'block'});
            siteMail.visibility = false;
        }else{
            inboxList.animate({'width':'70%'});
            inboxFolders.animate({'left':'0','display':'none'});
            siteMail.visibility = true;
        }
    }
};

$(function () {
    //populate defaults
    siteMail.reply = $('[data-reply]');
    siteMail.delete = $('[data-delete]');
    siteMail.save = $('[data-save]');
    siteMail.requestType = $('#requestType');
    siteMail.ml_formAction = $('#mailListFormAction');

    // open reply panel and hide reply button
    siteMail.reply.on('click', function(){
       $('#reply').slideDown('slow',function(){
           $('#mailMessage').focus()
       });
        siteMail.reply.hide();
        siteMail.delete.hide();
        $('#show').val('mailCompose');
        siteMail.toID = $('#userID').val();
   });
   //track submit button
   $('[data-trigger]').on('click', function () {
       $(this).attr('disabled', true);
       siteMail.button = $(this);
       let postType = $(this).attr('data-posttype');
       setTimeout(function () {
           siteMail.submitForm(postType);
       },500);

   });
   // run on 'Compose' only
    $('#qqfile').on('change', function (evt) {
        let attachment = $(this);
        let name = attachment[0].files[0].name;
        let size = (attachment[0].files[0].size * 0.0009765625);
        size = size.toFixed(2);

        $('#fileName').text(name);
        $('#fileSize').text(size+" Kb");

        let tgt = evt.target || window.event.srcElement,
            files = tgt.files;

        // FileReader support
        if (FileReader && files && files.length) {
            let fr = new FileReader();
            fr.onload = function () {
                if(size > 32000){
                    $('#kbReached').text('Image too large');
                }else{
                    $.when(siteMail.uploadImage(attachment))
                        .then(function(data){
                            let res = JSON.parse(data);
                            if(res.success){
                                $('#imgPreview').attr('src',fr.result)
                                    .slideDown();
                                $('.help-block').addClass('text-green');
                                $('#fileNameInfo').slideDown('slow');
                                ui_alerts.alerts_text.text("File attached successfully");
                                ui_alerts.successAlert();
                            }else{
                                console.log('some error');
                                ui_alerts.alerts_text.text(res.error);
                                ui_alerts.failedAlert()
                            }
                            console.log("ajax res", res);
                        })
                    ;
                }
            };
            fr.readAsDataURL(files[0]);
        }

    });

    $('#mainForm input[type=checkbox]').on('change', function(){

        if(this.id === "all_messages" || this.id === "all_messages_sub"){
            let cb = $('#mainForm').find('input[type=checkbox]');

            if(this.checked){
                $.each(cb, function(idx,item){
                    if(!item.checked)
                        item.checked = "checked";
                });
            }else{
                $.each(cb, function(idx,item){
                    if(item.checked)
                        item.checked = "";
                })
            }
        }
        siteMail.delete.prop('disabled',false);
        siteMail.save.prop('disabled',false);

    });
    //set action to delete
    siteMail.delete.on('click', function(){
        //call a method here
        let attr = $(this).attr('data-delete');
        console.log(attr);
        if(attr !== ""){
           $('#show').val(attr);
            let moveToFolder = '<input type="hidden" name="moveToFolder" value="Move to folder ...">';
            $('#mainForm').prepend(moveToFolder);
            $('input[name=userID]').val("")
        }
        siteMail.messageAction('#mainForm',2,"delete")
    });

    siteMail.save.on('click', function(){
        $('input[name=activeTab]').val('save');
        let moveToFolder = '<input type="hidden" name="moveToFolder" value="Saved">';
        $('#mainForm').prepend(moveToFolder);
        siteMail.messageAction('#mainForm',0,"save")
    });
    if(siteMail.from_swf){
        setTimeout(function () {
            $('#body').css({
                'minHeight': '100vh',
                'overflowY': 'scroll'
            })
        },600);

    }
    $(document).keydown(function (e) {
        if(e.keyCode === 27 && vmBody.showSearch){
            vmBody.showSearch = false
        }
    });
});
