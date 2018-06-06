let registerMember = {

    doAjaxVerify:function(formId, el_id){

        let formUrl  = $(formId).attr('action');
        let id = $(el_id).attr('id');
        let value = $(el_id).val();

        let ajaxRes = {
            message:null,
            status:null,
            el:null,
        }
        return $.ajax({
            crossOrigin: true,
            url:formUrl,
            data:{'id':id,'value':value },
            method:'GET',
            cache:false,
            crossDomain : true,
            xhrFields : {
                withCredentials: true
            }
        });
    },
    verifyInput:function(value,id){
      let el_id = $('#'+id);
        el_id.parent().find('.fast-right-spinner').show();
      let errorMessage = ""
        if(id === "username"){
            errorMessage = "Can not be empty and 6 letters minimum";
        }else if(id === "emal"){
          errorMessage = "Bad email address";
        }else if(id === "password"){
          errorMessage = "Can not be empty and 7 letters minimum"
        }
      if(value === "" || value.length < 5){
        this.failed(el_id, errorMessage);

      }else if(id != "password"){
          //ajax verify
          let formId = '#'+el_id.parent().parent().attr('id');
          //pass to ajax call
          let res = $.when(this.doAjaxVerify(formId, el_id));
         res.done(function (response) {
             //current parsing method
             //server side no returning valid JSON
             let res = response.replace(/[()]/g, '');
             res = JSON.stringify(eval('(' + res + ')'));
             let obj = JSON.parse(res);
             // new new method ????

             let _id = '#'+obj.id
             let _isValid = obj.is_valid;
             let message = obj.message

             if(_isValid){
                 registerMember.success(_id, message)
             }else{
                 registerMember.failed(_id, message)
             }
         })
      }else if(id === "password" && value.length > 5){
          registerMember.success('#'+id, "Password is valid!")
      }
    },
    submitForm : function(formId){
        console.log(formId)
    },
    success:function(_id, message){
        $(_id).parent().removeClass('has-error').addClass('has-success');
        $(_id).parent().find('.fast-right-spinner').hide()
        $(_id).next('span').removeClass('glyphicon-remove').addClass('glyphicon-ok');
        $(_id).parent().find('.help-block').addClass('hide');
    },
    failed:function(id, message){
        $(id).parent().removeClass('has-success').addClass('has-error');
        $(id).parent().find('.fast-right-spinner').hide()
        $(id).next('span').removeClass('glyphicon-ok').addClass('glyphicon-remove');
        $(id).parent().find('.help-block').removeClass('hide').text(message);
    }
}