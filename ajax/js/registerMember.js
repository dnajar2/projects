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
      console.log(value, id);
      let el_id = $('#'+id);
      if(value === ""){

        this.failed(el_id)
      }else{
          //ajax verify
          let formId = '#'+el_id.parent().parent().attr('id');
          console.log("Parent: ", formId);
          let res = $.when(this.doAjaxVerify(formId, el_id));
             res.done(function (response) {

                 let res = JSON.parse(response);
                 console.log(res);
                 let _id = '#'+res.id
                 let _isValid = res.is_valid;
                 let message = res.message

                 if(_isValid){
                     registerMember.success(_id, message)
                 }else{
                     registerMember.failed(_id, message)
                 }
             })


      }
    },
    submitForm : function(formId){
        console.log(formId)
    },
    success:function(_id, message){
        console.log("passed", _id);
        $(_id).parent().removeClass('has-error').addClass('has-success');
        $(_id).next('span').removeClass('glyphicon-remove').addClass('glyphicon-ok');
        $(_id).parent().find('.help-block').addClass('hide');
    },
    failed:function(id, message){
        $(id).parent().removeClass('has-success').addClass('has-error');
        $(id).next('span').removeClass('glyphicon-ok').addClass('glyphicon-remove');
        $(id).parent().find('.help-block').removeClass('hide').text(message);
    }
}