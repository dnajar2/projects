let myphones = {
    formId:'#validatePhone',
    submit:(action,type,e)=>{
        if(action !== "" || action != null ){
            let _el = null;
            if(e !== null){
                _el = $(e.target);
                _el.attr('disabled', true);
                _el.find('.fa-save').addClass('hide');
                _el.find('.fa-refresh').removeClass('hide');
            }

            let _formId = $(myphones.formId);
            let actionInput = "<input type='hidden' name='action' value='"+action+"'>";

            if(!$('input[name=action]').length){
                _formId.prepend(actionInput);
            }else{
                $('input[name=action]').val(action);
            }
            if(type === "request"){
                let status = "<input type='hidden' name='status' value='1'>";
                if(!$('input[name=status]').length){
                    _formId.prepend(status);
                }
            }

             let _data = _formId.serialize();

            $.ajax({
                url:"/models/ajax/validate_phone.php",
                type:"GET",
                data:_data
            })
            .done(function (r) {
                console.log(r);
                if ( r === "validating" ){
                    setTimeout("myphones.submit('validate','status',null);", 5000 );
                }else{
                    if(r == "1"){
                        ui_alerts.alerts_text.text("Update was Successful!");
                        ui_alerts.successAlert();
                    }else {
                        ui_alerts.alerts_text.text("Verification Timed out!");
                        ui_alerts.failedAlert();
                    }
                    if(_el !== null){
                        _el.attr('disabled', false);
                        _el.find('.fa-refresh').addClass('hide');
                        _el.find('.fa-save').removeClass('hide');
                        setTimeout(function(){location.reload()},3000)
                    }
                }
            })
        }
    }
};
