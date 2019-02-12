//Model utils holds main utilities for model's
let utils = {
    appName:'model',
    modelName:null,
    modelUsername:null,
    modelEmail:null,
    letAjax:false,
    alertClass:'.alert',
    loginContainer: document.getElementById('login-register'),
    delete_confirmed:false,
    date_date:[],
    mailCount:0,
    modelCantGoOnline:null,
    toggle:function (current,next) {
        if($(utils.alertClass).is(":visible")){
            $('.alert').slideUp();
        }

        let current_el = document.getElementById(current);
        let next_el = document.getElementById(next);
        // current_el.style.display = 'none';
        $(current_el).slideUp(function(){
            $(next_el).slideDown();
            if(utils.loginContainer.style.height === "auto"){
                utils.loginContainer.style.height = ""
            }else{
                utils.loginContainer.style.height = "auto"
            }
        });
    },

    login:function(formId){

        let inputs = $(formId).find('input').not('input[type="checkbox"]');

        let notEmptyInputs = utils.checkInputs(inputs);
        console.log('notEmptyInputs', notEmptyInputs);
        if( notEmptyInputs ){
        // inputs has value - ajax call
            $('#model-login').find('button').attr('disabled', true);
            utils.sendData(formId);
            //animate button
            if($(formId).find('.fa-sign-in').length){
                $(formId).find('.fa-sign-in').hide();
                $(formId).find('.fa-refresh').show()
            }
        }else{
        //  Inputs are empty
            let err = "User or password missing";
            $(formId).find(utils.alertClass).text(err).slideDown();

        }
    },
    signUp:function(formId){
        $('#register-error').text("").slideUp('slow');

        let inputs = $(formId).find('input');
        let isValidEmail = this.validateEmail(inputs[0].value);
        let notEmptyInputs = utils.checkInputs(inputs);

        if(notEmptyInputs && isValidEmail){
            let message_text = "An email has be sent to " + inputs[0].value;
            console.log( $(formId +' '+utils.alertClass) );
            $('#register-error').text(message_text).slideDown('slow').toggleClass('alert-danger alert-success');
        }else{
            var error = "email is invalid or empty";
           if( $('#register-error').hasClass('alert-success') ){
               $('#register-error').toggleClass('alert-danger alert-success')
           }
            $('#register-error').text(error).slideDown('slow');
        }
    },
    recoverPassword:function(formId){
        console.log('recoverPassword: clicked');
        let inputs = $(formId).find('input');
        let email_address = $(inputs).val();
        $('#btnResetPass').prop('disabled', true);
        let notEmptyInputs = utils.checkInputs(inputs);
        let isEmailValid = this.validateEmail(email_address);
        if(notEmptyInputs){
            if(isEmailValid){
                utils.letAjax = true;
                this.sendData(formId);
            }else{
                $(formId).find('.alert').text('email address not valid').slideDown().delay(3000).queue(function () {
                    $(this).slideUp()
                })
            }
        }
    },

    checkInputs:function(inputs){
        let empty = 0;
        let isEmpty = false;
        $(inputs).each(function(index,item){
            if(item.value === ""){
                empty++
            }
        });

        if(empty === 0) {
            isEmpty = true;
        }
        return isEmpty;
    },
    validateEmail:function (email) {
        let re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    },

    sendData:function(formId){
        //handling data coming from wcc.login
        if(!utils.letAjax){
            let res = formId;
            ui_alerts.alerts_text.text(res.message);
            res.status ? ui_alerts.successAlert():ui_alerts.failedAlert();

            return
        }

        let _url = $(formId).attr('action');
        let _data = $(formId).serialize();
        $('#passRecover').prop('disabled', true);
        $.ajax({
            url:_url,
            data:_data,
            type:'POST',
            cache : false,
            crossDomain : true,
            xhrFields : {
                withCredentials: true
            },
        })
        .always(function () {
            utils.letAjax = false;
        })
        .done(function (data) {
            console.log(data);
            let res = JSON.parse(data);
            ui_alerts.alerts_text.text(res.message);
            if(res.status){
                ui_alerts.successAlert();
                $('#passRecover').val('');
                utils.toggle('reset-form','login-form')
            }else{
                ui_alerts.failedAlert();
                $('#btnResetPass').prop('disabled', false);
            }
            $('#passRecover').prop('disabled', false);
            $('button').find('.fa').hide()
        })
    },
    copyText:function (id, tipId) {
        let el = $(id);
        let tip = $(tipId);
        $(el).select();
        document.execCommand("copy");
        let name = $(el).attr('data-name');
        let valueType = $(el).attr('data-type');
        let tipMessage = name  + " " + valueType + " copied";
        $(tip).text(tipMessage);
    },
    clearToolTip:function(tipId){
        $(tipId).text('Click to Copy to Clipboard');
    },
    setPrimePhoto:function(photoId){
        data = $('#photoGrid').serialize();
        $.ajax({
            url: "/models/",
            type: "POST",
            data: data
        })
        .done(function(data){

            let res = JSON.parse(data);
            let divHtml = $('input[name="photo[]"][value="'+photoId+'"]').parent();

            divHtml.find('.fa.fa-star-o').toggleClass('fa-star fa-star-o');
            divHtml.find('.fa-trash').hide();
            divHtml.find('.corner-ribbon').show();
            $('#photoGrid').prepend(divHtml);
            ui_alerts.alerts_text.text(res[1]);
            ui_alerts.successAlert();

            let nextDiv = $('#myPhotos .box-body .image-row')[1];
            $(nextDiv).find('.fa.fa-star').toggleClass('fa-star fa-star-o');
            $(nextDiv).find('.fa-trash').show();
            $(nextDiv).find('.corner-ribbon').hide();
            myPhotos.fullPageOverlay.hide();
            $("html, body").animate({ scrollTop: 0 }, "slow");
        })
        .fail(function(data){
            console.log("fail")
        });
    },
    cropPhoto:function(photoId,srcUrl){
        myPhotos.photoSrc = srcUrl;
        myPhotos.photoID = photoId;
        $('#cropPhotos').modal('toggle');
    },
    deleteMdPhoto:function(photoId, parentId){
        let imgSrc = $(parentId).find('img').attr('src');
        $('#image2delete').attr('src',imgSrc);
        $('#deletePhoto')
            .modal()
            .on('hidden.bs.modal', function(){
                let delete_confirmed = utils.delete_confirmed ? 1:0;
                if(delete_confirmed){
                    let data = {
                        'action':'delete',
                        'delete_confirmed': delete_confirmed,
                        'pid':photoId,
                        'show':'myphotos'
                    };
                    $.ajax({
                        url:"/models/",
                        type:'POST',
                        data:data
                    }).always(function(data){
                        // console.log('always', data);
                        console.log('always');
                    }).done(function (data) {

                        let res = JSON.parse(data);
                        if(res.status){
                            if(parentId !== 'gallery'){
                                $(parentId).remove();
                                ui_alerts.alerts_text.text(res.message);
                                ui_alerts.successAlert()
                            }else{
                                myPhotos.removeGalleryImage(myPhotos.index)
                            }
                        }

                    }).fail(function (e,data) {
                        let res = JSON.parse(data);
                        ui_alerts.alerts_text.text(res.message);
                    })
                }else{
                    $(parentId).find(myPhotos.overLay)
                        .slideUp();
                }
                utils.delete_confirmed = false;
            });
    },
    /**
     * pops message modal
     * @param username
     * @param user_id
     * @param e
     */
    popNewMessage:function (username,user_id,e) {
        e.preventDefault();
        vmBody.mbr.name = username;
        vmBody.mbr.id = user_id;

        $('#composerModal').modal({
            show:true,
            backdrop:'static',
            keyboard:false
        });
    },
    /**
     * sends message from modal
     * @param formId
     * @param el
     */
    sendNewMessage:function(formId, el) {
        let _data = $(formId).serialize();
        let _fa = $(el).find('.fa-spin');
        $.post({
            url:'/api/models/messages.php',
            data:_data,
        }).done(function (data) {
           let res = JSON.parse(data);
            ui_alerts.alerts_text.text(res.message);
           if(res.status){
               vmBody.mbr.name = "";
               vmBody.mbr.id = "";
               vmBody.msg.subject = "";
               vmBody.msg.textarea = "";
               ui_alerts.successAlert();
               $('#composerModal').modal('hide')
           }else{
               ui_alerts.failedAlert();
           }
            _fa.hide();
           $(el).prop('disabled', false);
        });
    },
    fcsStatusCheck:function(bool){
        vmSideBar.fcs_status = bool;
        vmBody.fcs_status = bool;
    },
    scrollToTop:function(id){
        $('html, body').animate({
            scrollTop: $(id).offset().top
        }, 500, 'linear');
    },
    getCookie:function (name) {
        let value = "; " + document.cookie;
        let parts = value.split("; " + name + "=");
        if (parts.length === 2) return parts.pop().split(";").shift();
    },
    toggleFcsStatus:function () {
        if(vmSideBar.TimeOut !== null){
            clearTimeout(vmSideBar.TimeOut);
        }
        vmSideBar.modelStatus()
    },
    cantGoOnline:function(e){
        e.preventDefault();
        ui_alerts.alerts_text.html('<i class="fa fa-exclamation-triangle"></i> <strong>You are <u>Not Approved</u> to broadcast online!</strong>');
        ui_alerts.failedAlert();
    },
    backdrop:function(e){
        console.log(e);
        $('<div id="fake-modal" class="modal-backdrop"><i class="fa fa-refresh fa-spin"></i></div>').prependTo(document.body)
    }
};
//alerts
let ui_alerts = {
    alerts_container: $('#alerts_container'),
    alerts_text: $('#alerts_text'),
    successClass: 'alert-success',
    failClass: 'alert-danger',
    delay:4000,
    successAlert: function(){
        $(this.alerts_container)
            .removeClass(this.failClass)
            .addClass(this.successClass)
            .show()
            .delay(this.delay)
            .slideUp()
    },
    failedAlert: function(){
        $(this.alerts_container)
            .addClass(this.failClass)
            .removeClass(this.successClass)
            .show()
            .delay(this.delay)
            .slideUp()
    },
    w9input:null,
};
//Document ready
$(function () {
    $(window).on('unload', function() {
        if(popupWin){
            popupWin.close()
        }
    });
    $('.button-3.btn-flat').on('click', function () {
        if(popupWin){
            popupWin.close()
        }
    });
    //  model can't go online
    if(utils.modelCantGoOnline){
        $('#modelCantGoOnline').delay(1000).show(0);
    }
    //    Get mail list
    $('body').css('visibility',"");
    if(wcc.is_logged_in){
        setTimeout(function () {
            vm.getMailList()
        },300);
    }

    //enable submit button after textarea has value
    $('#mailMessage').on('keyup', function () {
        let charVal = this.value.length;
        if(charVal >= 2){
            $('[data-trigger],[data-modaltrigger]').attr('disabled',false)
        }else{
            $('[data-trigger],[data-modaltrigger]').attr('disabled',true)
        }
    });
    /**
     * Sends message on modal button click
     */
    $('[data-modaltrigger]').on('click', function (e) {
        e.target.disabled = true;
        console.log(e.target.disabled);
        utils.sendNewMessage('#newMail', this);
    });
    //binds subject and text message to vmBody.msg param
    $('input[name=mailSubject], textarea').on('change', function(){
        if(this.name === 'mailSubject'){
            vmBody.msg.subject = this.value;
        }else{
            vmBody.msg.textarea = this.value;
        }
    });
    //password reset
    $('#passRecover').on('keyup', function(){

        if(this.value.length > 7){
            $('#btnResetPass').prop('disabled', false)
        }else{
            $('#btnResetPass').prop('disabled', true)
        }

        if($('#pass-reset-error').is(':visible')){
            $('#pass-reset-error').hide()
        }
    });
});
