myprofile = {
    checkPassword:function(e){

        let newPass = $('#Password').val();
        let confirmedPass = e.target.value;
        if(newPass === confirmedPass){
            e.target.nextElementSibling.disabled = false;
            ui_alerts.alerts_text.text('passwords match, click update to continue!');
            ui_alerts.successAlert();
            $('#CurrentPass').val(newPass);
        }else{
            console.log("passwords don't match");
            ui_alerts.alerts_text.text("passwords don't match, try again!");
            ui_alerts.failedAlert()
        }
    },
    checkInput:function(e){

        let confVal = e.target.value,
            parent = e.target.parentNode,
            elClass = "."+e.target.parentNode.classList[0],
            elSibling = $(parent).prev(elClass),
            elSiblingVal = $(elSibling).find('input').val();

        if(utils.validateEmail(elSiblingVal) ){
            if(utils.validateEmail(confVal) ){
                if(confVal === elSiblingVal){
                    e.target.nextElementSibling.disabled = false;
                    ui_alerts.alerts_text.text('Emails match, click update to continue!');
                    ui_alerts.successAlert();
                    $('#CurrentEmail').val(elSiblingVal)
                }else{
                    ui_alerts.alerts_text.text("Email address are not a match!");
                    ui_alerts.failedAlert();
                    e.target.focus();
                }
            }else{
                ui_alerts.alerts_text.text("confirmed email address is not valid");
                ui_alerts.failedAlert();
                e.target.focus();
            }
        }else{
            ui_alerts.alerts_text.text("New email address is not valid");
            ui_alerts.failedAlert();
            $(elSibling).find('input').focus();
        }
    },
    /**
     *
     * @param formId
     * @param clearInput - boolean
     * @param e
     */
    ajaxCall:function(formId, clearInput, e){

        ui_alerts.alerts_container.hide();
        $(e.target).find('.fa-spin').show();

        let url = $(formId).attr('action'), data = $(formId).serialize();
        $(e.target).prop('disabled', true);
        $.ajax({
            url:url,
            data:data,
            type:'POST',
            cache:false,
        }).done(function (d) {

            let str = d.split("&"), state = str[1].split('='), message = str[2].split('=');
            $(e.target).find('.fa-spin').hide();
            ui_alerts.alerts_text.text(message[1]);

            if(state[1] === "1"){
                ui_alerts.successAlert();
                if(typeof clearInput == "boolean" && clearInput === true){
                    $('.form-control').val('');
                }
                $(e.target).closest('.list-group-item').slideUp()
            }else{
                ui_alerts.failedAlert();
            }
            $(e.target).prop('disabled', false);
        }).fail(function (d,r,x) {
            console.log(d,r,x)
        })
    },
    fixStateInput:function ( oSi, oCi ){
    if ( ( oCi.options[ oCi.selectedIndex ].text != "United States" ) ||
        ( oCi.options[ oCi.selectedIndex ].text != "Canada" ) )
            {
                for ( i = 0; i < oSi.options.length; i++ )
                {
                    if ( oSi.options[ i ].text == "NON USA/Canada" )
                    {
                        oSi.options[ i ].selected = true;
                    }
                }
            }

        return (true);
    },


    fixCountryInput:function( oSi, oCi ){
        if ( ( oSi.options[ oSi.selectedIndex ].text != "NON USA/Canada" ) ){
            for ( i = 0; i < oCi.options.length; i++ ){
                if ( oCi.options[ i ].text == "United States" )
                {
                    oCi.options[ i ].selected = true;
                }
            }
        }
    return (true);
    },
    applicationStatusPhotoUpload:function(formId, e){
        let appForm = $(formId);
        console.log(appForm, e);
        let appFormData = new FormData($(formId)[0]);
        $.post({
            url:appForm.attr('action'),
            data: appFormData,
            contentType:false,
            processData:false,
        })
        .done(function(r){
            console.log(r);
            let res = JSON.parse(r);
            res = res.split('&');

            let status = res[0].split('=');
            let message = res[1].split('=');

            $('.progress:visible').find('.progress-bar').css('width','100%');

            ui_alerts.alerts_text.text(message[1]);
            console.log(status[1]);
            if(status[1]){
                ui_alerts.successAlert();
            }else{
                ui_alerts.failedAlert();
            }
            let str = "Image Received, Please reload page.";
            setTimeout(function(){
                $('<div>'+str+'</div>').insertAfter('.progress:visible');
                // window.location.reload();
                $('.progress:visible').hide();
            },1500);

        })
        .fail(function(){
            $('.progress:visible').find('.progress-bar').css('width','0').hide();
        })
    },
    displayDocument(model_doc_id, session_name){
        let protocol = window.location.protocol;
        let urlSquema = window.location.host;
        let url = protocol +'//'+urlSquema + '/includes/mpepost.php?Action=DisplayDocument&DocumentID=' +model_doc_id + "&mpeSessionName=" + session_name;
        let imagePreview = $('#imagePreview img');
            $(imagePreview).attr('src', url);
        $('#imagePreview').modal('toggle');
    },
    triggerFileInput:function(e){
        let target = e.target;
        console.log(target);
        $(target).prev('input').click();

        $(target).prev('input').on('change', function () {
            $(target).hide();
            $(target).next('div').show();
            $(target).next('div').find('.progress-bar').css('width','50%');
        })
    },
};
$(function () {
   $('#password .show-pass').on('click', function(){
       $(this).toggleClass('fa-eye fa-eye-slash');
       $('#mask').toggle();
       $('#unmask').toggle();
   });
   $('#email .fa, #password .fa-pencil').on('click', function () {
       $(this)
           .closest('.list-group-item')
           .next('li')
           .slideToggle();
   });
    $('#link').on('click', function(event){
        event = event || window.event;

        let target = event.target || event.srcElement,
            link = target.src ? target.parentNode : target,
            options = {
                index: link,
                event: event,
            },
            links = this.getElementsByTagName('a');
        blueimp.Gallery(links, options);
    });
});
