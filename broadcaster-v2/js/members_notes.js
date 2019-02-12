let members_notes = {
    saveUrl:'',
    addUrl:'',
    getNote:function(params){
        console.log(params);
        $.ajax({
            url:'/models/',
            type:'GET',
            data:params
        })
            .done(function (response) {
                let res = JSON.parse(response);

                console.log(res);
                if(res[0] === true){
                   $('#mailSubject').val(res[1])
                    $('#userID').val(params.member_id);
                }
            })
    },
    post_update:function(formId){
        $('#saveBtn i').show();
        let user_id = $('#userID').val();
        let form = $(formId);

        if(user_id !== "-1"){
            console.log("update");
            $('#userID').attr('name','member_id');
            form.attr('action', members_notes.saveUrl);
        }else {

            $('#userID').attr('name','userID');
            form.attr('action', members_notes.addUrl);
            form.prepend(add);
            console.log("add")
        }
        $.ajax({
            url:form.attr('action'),
            type:'POST',
            data: form.serialize()
        })
            .done(function (response) {
                $('#saveBtn i').hide();
                let res = JSON.parse(response);
                if(res[0]){
                    ui_alerts.alerts_text.text(res[1]);
                    ui_alerts.successAlert();
                    $('#newMemberNote').modal('hide');
                }
            })
    },
    stripHtmlTags:function ( e ) {

        let tmp = e.target.value;
        e.target.value = tmp.replace(/<([^>]+)>/g,'');
        console.log(e);
    }

};
