"use strict";
/**
 * WebCamClub site class; for member specific functionality
 */
var Members = (function() {

    var _Members = function() {

        /**
         *  instance copy for internal use
         */
        var self = this;
        /**
         * url for updating the top bar
         */
        this.AJAX_TB_URL = "/xml/tb.php";
        /**
         * frequency to update the top bar
         */
        this.AJAX_TB_IVL = 6,
            /**
             * top bar cache flag
             */
            this.tbNoCache = false;
        /**
         * member balance
         */
        this.balance = 0;
        /**
         * flag for loading
         */
        this.loading = false;
        /**
         * updates the Members top bar data
         */
        this.updateTopBar = function () {

            if(typeof window.wccClientIO !== "object" || !window.wccClientIO.connected) {

                self.topbar_timer = null;
                var params = "ajax=1";
                if( self.tbNoCache )
                    params = "&nocache=1";

                if( self.sid_name != null && self.sid != null )
                    params += "&" + self.sid_name + "=" + self.sid;

                params += "&sttb=" + self.site_version;

                $.ajax({
                    url : self.AJAX_TB_URL,
                    type : 'POST',
                    cache : false,
                    crossDomain : true,
                    xhrFields : {
                        withCredentials: true
                    },
                    data : params,
                    success : function (data, status, jqXHR) {

                        self.updateTopBarHandler(data, 200);
                    },
                    error : function (jqXHR, status, error) {

                    }
                });
            }
        };

        /**
         * updates the top bar values
         */
        this.updateTopBarHandler = function (r,s) {

            if(s==200) {

                try {

                    var ret = JSON.parse(r);
                    if(ret.mail != $(".tb_mail").html) {

                        $(".tb_mail").html( ret.mail );
                    }
                    if(ret.favorites != $(".tb_favorites").html()) {

                        $(".tb_favorites").html( ret.favorites );
                    }
                    if(ret.tickets != $(".tb_tickets").html()) {

                        $(".tb_tickets").html(ret.tickets);
                    }
                    if(ret.credits != $(".tb_credits").html()) {

                        $(".tb_credits").html(ret.credits);
                        this.balance = parseFloat(ret.credits);
                    }

                    if(typeof window.wccClientIO !== "object" || window.wccClientIO.connected == false ) {
                        if( ! ret.disabled ) {
                            self.topbar_timer = setTimeout( "Members.updateTopBar();", self.AJAX_TB_IVL*1000 );
                        }
                    }
                }
                catch(e)
                {}
            }
        };

        /**
         * sends a change to the server to change a member setting
         */
        this.changeSetting = function ( parent, setting ) {
            var inputVal = $.trim($('#'+parent + ' input:checked').val());
            var postUrl = $('#settingsForm').attr('action');

            if(inputVal == 'on'){
                setting.status = 1;
            }
            else if(inputVal == 'off'){
                setting.status = 0;
            }

            setting.member_id = $('#member_id').val();
            setting[ $('#session_name').val() ] = $('#session_id').val();

            var sectionId = '#'+parent;
            $('.field-message').html('');
            $(sectionId).find('.save, .cancel').removeClass('show').addClass('hide');
            $.ajax({
                url : postUrl,
                type : 'POST',
                cache : false,
                crossDomain : true,
                xhrFields : {
                    withCredentials: true
                },
                data : setting,
                success : function (data, status, jqXHR) {

                    var res = $.parseJSON( data );

                    $(sectionId).find('.field-message').removeClass('hide').removeClass('has-error').removeClass('has-success').addClass('has-'+res.status).text( res.message );
                    if(res.cargo_id != null && res.cargo != null) {
                        $('#'+res.cargo_id).text(res.cargo);
                    }

                    $(sectionId).delay(3000).queue(function(savedSecction){
                        $(sectionId).find('.field-mask, .edit-text').removeClass('hide').addClass('show');
                        $(sectionId).find('.field').removeClass('show').addClass('hide');
                        $(sectionId).find('.field-message').addClass('hide');
                        $(sectionId).find('.input_text').val('');
                        savedSecction();
                    });
                },
                error : function (jqXHR, status, error) {

                    $('.field-message').removeClass('hide').removeClass('has-error').removeClass('has-error').addClass('has-error').text( error );
                    $(sectionId).delay(3000).queue(function(savedSecction){
                        $(sectionId).find('.field-mask, .edit-text').removeClass('hide').addClass('show');
                        $(sectionId).find('.field').removeClass('show').addClass('hide');
                        $(sectionId).find('.field-message').addClass('hide');
                        $(sectionId).find('.field-message:input').val('');
                        savedSecction()
                    });
                }
            });

            return false;
        };

        /*
         * request to resend welcome email
         */
        this.resendWelcomeEmail = function (data, url){
            $.ajax({
                url:url,
                type:'POST',
                cache: false,
                crossDomain: true,
                xhrFields:{
                    withCredentials: true,
                },
                data: data,

                success: function(data, status, jqXHR){

                    var res = $.parseJSON(data)

                    $('#form_output').slideToggle().text(res.message);
                    $('.close.fa.fa-times-circle').click();

                    setTimeout(function(){
                        $('#form_output').slideToggle().text('')
                    },2500);
                },
            })
        }
        /*
         * Change email address from Nagbar or nag modal
         */
        this.nagChangeEmailAddress = function(data, url){
            $('#wcc3_modal .res_stats').find('button').html('<img src="'+wcc.wait_gif.src+'" style="height:20px; width:20px;">')
            $.ajax({
                url:url,
                type: "POST",
                cache: false,
                corssDomain: true,
                xhrFields:{
                    withCredentials: true,
                },
                data:data,
                success:function(data, status, jqXHR){
                    var res = $.parseJSON(data)
                    console.log(res)
                    if(res.status == "success"){
                        $('#wcc3_modal .res_stats').removeClass('has-error').html('<div class="text-center" style="padding-top:10px;">'+res.message+' to '+res.cargo+'</div>');
                        setTimeout(function(){
                            $('#wcc3_modal').modal('hide')
                        }, 3000);

                    }else{
                        $('#wcc3_modal .res_stats').addClass('has-error').html('<div class="text-center" style="padding-top:10px;">'+res.message+'</div>');

                        setTimeout(function(){
                            $("#wcc3_modal .modal-body").find("input:nth(0)").val('');
                            $("#wcc3_modal .modal-body").find("input:nth(1)").val('');
                            $('#wcc3_modal_pass, #wcc3_modal_email').remove()
                            $('#wcc3_modal .res_stats').removeClass('has-error').html('<button class="btn button-2 pull-right" onclick="member_registration.submit_email_change()">Submit</button>');
                        }, 3500);
                    }

                },
            })
        }
        /**
         * unblocks a model from sending email
         */
        this.unblockModel = function (parent, setting){

            var postUrl = $('#settingsForm').attr('action');
            setting.member_id = $('#member_id').val();
            setting[ $('#session_name').val() ] = $('#session_id').val();

            var sectionId = '#'+parent;
            $(sectionId).find('.cancel').removeClass('show').addClass('hide');
            $.ajax({
                url : postUrl,
                type : 'POST',
                cache : false,
                crossDomain : true,
                xhrFields : {
                    withCredentials: true
                },
                data : setting,
                success : function (data, status, jqXHR) {

                    var res = $.parseJSON( data );

                    $(sectionId).find('.field-message').removeClass('hide').addClass('show');
                    $(sectionId).find('p').removeClass('has-error').removeClass('has-success').addClass('has-'+res.status).text( res.message );

                    var lineheight = $(sectionId).height()
                    $(sectionId).find('.field-message').removeClass('hide')
                    var pHeight = $(sectionId).find('p').height()
                    var margin = (lineheight / 2) - (pHeight / 2)
                    $(sectionId).find('p').css("margin-top",  margin+"px")

                    if( res.status == 'success' ) {
                        setTimeout( function () {
                            // remove clicked element
                            $('.grid').isotope( 'remove', $(sectionId) ).isotope('layout');

                            var gridCount = $('.grid-item').length - 1;
                            if(gridCount == 0){
                                $('#blocked-model-txt').text('No Blocked Models');
                                $('.notifications h3').removeClass('hide');
                                $('#blocked-models').find('.edit').html('')
                                $(sectionId).find('.edit').html('');
                                setTimeout( function() {
                                    $('#unblock').removeClass('show').addClass('hide');
                                }, 3000 );
                            }
                            else {
                                var txt = gridCount + " Blocked Models";
                                $('#blocked-model-txt').text(txt);
                            }
                        }, 3000 );
                    }
                    else {
                        setTimeout( function () {
                            $(sectionId).find('.field-message').removeClass('show').addClass('hide');
                            $(sectionId).find('p').removeClass('has-error').removeClass('has-success').text('');
                        }, 5000 );
                    }

                    if(res.cargo_id != null && res.cargo != null) {
                        $('#'+res.cargo_id).text(res.cargo);
                    }
                },
                error : function (jqXHR, status, error) {

                    $('.field-message').removeClass('hide').removeClass('has-error').removeClass('has-error').addClass('has-error').text( error );
                }
            });

            return false;
        };
        //member profile post
        this.sendProfile = function(formId){

            var postUrl = $('#'+formId).attr('action');
            var formData = $('#'+formId).serialize();
            wcc.pushWaiting('sub-btn');

            $.ajax({
                url : postUrl,
                type : 'POST',
                cache : false,
                crossDomain : true,
                xhrFields : {
                    withCredentials: true
                },
                data : formData,
                success : function (data, status, jqXHR) {

                    var res = $.parseJSON( data );
                    $('#'+formId).find('.field-message').fadeIn( "slow", "linear" ).removeClass('has-error has-success').addClass('has-'+res.status).text( res.message );
                    if(res.status == 'success'){
                        $('#us_zip input').focus().css('border-color','');
                        $('#'+formId).delay(3000).queue(function(closeMsg){
                            $('#'+formId).find('.field-message').fadeOut( "slow", "linear" )
                            closeMsg()
                        });
                    }

                    wcc.popWaiting('sub-btn');
                },
                error : function (jqXHR, status, error) {
                    wcc.popWaiting('sub-btn');
                    console.log(error, status)
                }
            });
            return false;
        };

        //member profile post image
        this.sendProfileImg = function(inputId){

            var postUrl = $('#'+inputId).attr('action');
            var formVals = $('#'+inputId);
            var profileImgData = new FormData($('#'+inputId)[0]);
            console.log(inputId)
            $('#loading_pro_img').find('img').attr('src', this.wait_gif.src).attr('height', '20px').attr('width', '20px');
            $('#loading_pro_img').fadeIn()
            $.ajax({
                url : postUrl,
                type : 'POST',
                xhr: function() {  // Custom XMLHttpRequest
                    var myXhr = $.ajaxSettings.xhr();
//						}
                    return myXhr;
                },
                data : profileImgData,
                cache : false,
                crossDomain : true,
                contentType: false,
                processData:false,
                xhrFields : {
                    withCredentials: true
                },
                success : function (data, status, jqXHR) {

                    var res = $.parseJSON( data );
                    $('#profile_informtion .field-message').fadeIn().removeClass('has-error has-success').addClass('has-'+res.status).text(res.message)
                    if(res.status == 'success'){
                        $('#img-placeholder').find('.btn-default').fadeIn();
                        var cb = '?z=' + Date.now();
                        if(res.imageUrl.indexOf('?') > 0){
                            cb = '&z=' + Date.now();
                        }
                        $('#main_profile_photo').attr('src', res.imageUrl+cb);
                        $('#loading_pro_img').fadeOut();

                        $('#profile_informtion').delay(3000).queue(function(closeMsg){
                            $('#profile_informtion').find('.field-message').fadeOut( "slow", "linear" );
                            closeMsg()
                        });
                    }else{
                        $('#loading_pro_img').fadeOut();
                    }
                },
                error : function (jqXHR, status, error) {
                    console.log(error, status)
                }
            });
            return false;
        };

        // Delete Profile Photo
        this.deletePhoto = function(){
            var postUrl = $('#profile-image-delete').attr('action');
            var deletePhoto = $('#profile-image-delete').serialize();
            $('#loading_pro_img').find('img').attr('src', this.wait_gif.src).attr('height', '20px').attr('width', '20px');
            $('#loading_pro_img').fadeIn()

            $.ajax({
                url: postUrl,
                type: 'POST',
                data: deletePhoto,
                crossDomain : true,
                xhrFields : {
                    withCredentials: true
                },
                success : function (data, status, jqXHR) {

                    $('#img-placeholder').find('.btn-default').fadeOut();
                    var res = $.parseJSON( data );
                    $('#profile_informtion .field-message').fadeIn().removeClass('has-error has-success').addClass('has-'+res.status).text(res.message);

                    if(res.status == "success" ){
                        $('#loading_pro_img').fadeOut()
                        $('#main_profile_photo').attr('src', res.noPhotoUrl);
                        $('#profile-image').val('')
                        $('#profile_informtion').delay(3000).queue(function(closeMsg){
                            $('#profile_informtion .field-message').fadeOut( "slow", "linear" );
                            closeMsg()
                        })
                    }

                },
                error : function(jqXHR, status, error){
                    console.log(error, status)
                }
            });
        };

        //purchases date filters
        this.past_purchasess_date_filters = function (formData, url) {

            $('#loading img').attr('src', this.wait_gif.src).css({
                'height': '20px',
                'width': '20px',
                'margin-top': '70px',
                'margin-bottom': '70px',
            });
            $.ajax({
                url : url,
                type : 'POST',
                cache : false,
                crossDomain : true,
                xhrFields : {
                    withCredentials: true
                },
                data : formData,
                success : function (data, status, jqXHR) {
                    var res = $.parseJSON( data );

                    $('.tr.origina_rows, #more_purchases').hide();
                    $('#loading').css('margin-top', '70px').show();
                    var grand_total = '$'+res.total;
                    $('#trans_from_date').text(res.date_from);
                    $('#trans_to_date').text(res.date_to);
                    if(res.total != 0 ){
                        $('#no_past_purchases').hide()
                        $('.td.total').hide()
                        $.each(res.purchases, function(index, item){
                            var newRow = '<div class="tr">';
                            newRow += '<div class="td col-md-2 col-sm-2 col-xs-2 ">'+ item.date + '</div>';
                            newRow += '<div class="td col-md-2 col-sm-3 col-xs-4 ">'+ item.txnID + '</div>';
                            newRow += '<div class="td col-md-2 col-sm-2 col-xs-2 hidden-sm hidden-xs">'+ item.billed_as +'</div>';
                            newRow += '<div class="td col-md-2 col-sm-2 col-xs-2 hidden-xs">' + item.cc_card + '</div>';
                            newRow += '<div class="td col-md-2 col-sm-3 col-xs-4 ">'+ item.cart_item + '</div>';
                            newRow += '<div class="td col-md-2 col-sm-2 col-xs-2 text-right">'+ item.amount +'</div>';
                            newRow += '<div class="clearfix"></div>';
                            newRow += '</div>';

                            $('#more_purchases').each(function(){
                                $(this).empty()
                                $(this).delay(10).queue(function(addNew){
                                    $(this).append(newRow);
                                    addNew()
                                })
                            })
                        })
                        $('#more_purchases').delay(1300).queue(function(getMore){
                            $('#loading').fadeOut()
                            $('#more_purchases').fadeIn('slow','linear');
                            getMore()
                        })
                        $('#more_purchases').delay(1900).queue(function(loadTotal){
                            $('.td.total').show();
                            $('#grand_total').text(grand_total);
                            loadTotal()
                        })
                    }
                    else{
                        $('#more_purchases').delay(1000).queue(function(getMore){
                            $('#loading').fadeOut()
                            //$('#more_purchases').html('<div class="td text-center">No transactions found for this date period</div>').fadeIn();
                            $('#no_past_purchases').show()
                            $('#grand_total').text(grand_total)
                            getMore()
                        })
                    }
                },
                error : function (jqXHR, status, error) {

                }
            });
        };

        /*
         * Sort Date ASC/DESC
         * */
        this.sort = function (data, url){
            console.log(data);
            console.log(url);
            $.ajax({
                url : url,
                type : 'POST',
                cache : false,
                crossDomain : true,
                xhrFields : {
                    withCredentials: true
                },
                data : data,
                success : function (data, status, jqXHR) {
                    var res = $.parseJSON( data );
                    $('#sort_asc').val(res.sort_date_desc)
                    $.each(res.purchases, function(index, item){
                        var newRow = '<div class="tr">';
                        newRow += '<div class="td col-md-2 col-sm-2 col-xs-2 ">'+ item.date + '</div>';
                        newRow += '<div class="td col-md-2 col-sm-3 col-xs-4 ">'+ item.txnID + '</div>';
                        newRow += '<div class="td col-md-2 col-sm-2 col-xs-2 hidden-sm hidden-xs">'+ item.billed_as +'</div>';
                        newRow += '<div class="td col-md-2 col-sm-2 col-xs-2 hidden-xs">' + item.cc_card + '</div>';
                        newRow += '<div class="td col-md-2 col-sm-3 col-xs-4 ">'+ item.cart_item + '</div>';
                        newRow += '<div class="td col-md-2 col-sm-2 col-xs-2 text-right">$'+ item.amount +'</div>';
                        newRow += '<div class="clearfix"></div>';
                        newRow += '</div>';

                        $('#more_purchases').each(function(){
                            $(this).empty()
                            $(this).delay(10).queue(function(addNew){
                                $(this).append(newRow);
                                addNew()
                            })

                        })
                    })
                },error: function (jqXHR, status, error){

                }
            });
            return false;
        };
        /*
         * more results
         *
         *
         */this.get_more_results = function(data, url, sectionId){
            $(sectionId+' .loader-img  img').attr('src', this.wait_gif.src).css({
                'height': '20px',
                'width': '20px',
                'margin-top': '100px',
                'margin-bottom': '100px',
            });
            var ID = sectionId.slice(1)
            //$('#more_purchases_' + ID).hide();
            //$('#'+ID+' .origina_rows').hide()
            $('#'+ID+' .td.total').hide()
            $('#loading_' + ID).show()
            $.ajax({
                url : url,
                type : 'POST',
                cache : false,
                crossDomain : true,
                xhrFields : {
                    withCredentials: true
                },
                data : data,
                success : function (data, status, jqXHR) {

                    var res = $.parseJSON( data )

                    $(res.section).find('input:eq(1)').val(res.new_limit)

                    var sectionID = $(res.section).attr('id');

                    $.each(res.Items_array, function(index, item){

                        var newRow = '<div class="tr">';
                        newRow += '<div class="td col-sm-2 col-xs-3 ">'+ (typeof item.show_date == 'undefined' ? '' : item.show_date ) + '</div>';
                        newRow += '<div class="td col-sm-2 col-xs-3 ">'+ ( item.model_username == null ? "" : item.model_username ) + '</div>';
                        if (window.matchMedia('(max-width: 767px)').matches){
                            if ( item.col_3 != null ){
                                newRow += '<div class="td col-sm-3 col-xs-3' + ( item.col_3 == undefined ? " hidden-xs" : "" ) + ' ">' + ( item.col_3 == undefined ? "" : item.col_3 ) + '</div>';
                                console.log('if ran')
                            }
                            else if( item.col_4 != null ){
                                newRow += '<div class="td col-sm-3 col-xs-3' + ( item.col_4 == undefined ? " hidden-xs" : "" ) + '  ">'+  ( item.col_4 == undefined ? "" : item.col_4 ) + '</div>';
                                console.log('else if ran')
                            }
                            else{
                                newRow += '<div class="td col-sm-3 col-xs-3"></div>';
                                console.log('else ran')
                            }
                        }else{
                            newRow += '<div class="td col-sm-3 col-xs-3' + ( item.col_3 == undefined ? " hidden-xs" : "" ) + ' ">' + ( item.col_3 == undefined ? "" : item.col_3 ) + '</div>';
                            newRow += '<div class="td col-sm-3 col-xs-3' + ( item.col_4 == undefined ? " hidden-xs" : "" ) + '  ">'+  ( item.col_4 == undefined ? "" : item.col_4 ) + '</div>';
                        }

                        newRow += '<div class="td col-sm-2 col-xs-3 text-right">' + item.credits_used +'</div>';
                        newRow += '<div class="clearfix"></div>';
                        newRow += '</div>';

                        $('#more_purchases_'+sectionID).each(function(){

                            $(this).delay(10).queue(function(addNew){
                                $(this).append(newRow);
                                addNew()
                            })
                        });
                    })
                    $( '#more_purchases_' + sectionID ).delay(400).queue(function(getMore){
                        $('#more_purchases_' + sectionID).show();
                        $('#loading_'+sectionID).hide()
                        getMore()
                    });
                    var totalSpent = res.totalSpent
                    //totalSpent = parseFloat( totalSpent.replace(/,/g, '') )
                    $(res.section).find('input:eq(2)').val(totalSpent);
                    $( '#more_purchases_' + sectionID ).delay(300).queue(function(loadTotal){
                        $(res.section +' .td.total').show();
                        $(res.section +' .total span:eq(1)').find('span').html((self.is_auth_billing?self.cur_sym:'') + res.totalSpent)

                        if( res.section == "#last_five_phone2phone"){
                            $(res.section +' .total span:eq(2)').text(res.totalMinutes)
                            $(res.section +' .total span:eq(3)').html((self.is_auth_billing?self.cur_sym:'') + res.totalSpent)
                            console.log(res.totalMinutes)
                        }
                        else if( res.section == "#last_five_featured_show"){
                            $(res.section).find('input:eq(2)').val(res.nonMinutes);
                        }

                        loadTotal()
                    })

                    if( res.limitReached == true ){
                        $(res.section +' button').hide();
                        console.log(res.section  +" limit reached" )
                    }
                },error:function(jqXHR, status, error){

                }
            });
            return false;
        }
        this.deleteModelAlerts = function(id){
            $(id +' .req_warning').slideUp();
            $(id +' .proc_req').slideDown();
        }
        /**
         * Mobile notification settings
         */
        this.submitSMS = function(data, url){

            $.ajax({
                url: url,
                type: "POST",
                data: data,
                crossDomain:true,
                xhrFields:{
                    withCredentials: true
                },
                success: function(data, status, jqXHR){
                    var res = $.parseJSON(data);
                    if(res.resType == 'sms_setup'){
                        if(res.status == 'error' ||res.status == null ){
                            $('#initial_errors').text(res.message).removeClass('has-success').addClass('has-'+res.status).slideDown()
                        }else{
                            $('#initial_errors').text(res.message).removeClass('has-error').addClass('has-'+res.status).slideDown()
                            $('#initial_errors').delay(6200).queue(function(closeMsgBox){
                                $('#initial_errors').slideUp().text('');
                                closeMsgBox()
                            })
                        }

                        if(res.do_verify == true){
                            $('#verification_code').slideDown();
                            $('#notifications button:nth(1), #setup_model_notification  button:nth(1)').attr('name', 'sms_resend_verify_code').val('Resend Verify Code').text('Resend Verify Code')
                        }
                        if(res.is_verified == true){
                            $('#member_cellphone').prop('readonly', true);
                            $('#verification_code').slideUp();
                            $('#if_cellphone_verified').slideDown();
                            $('#notifications button:nth(1), #setup_model_notification  button:nth(1)').attr('name', 'submit_sms').val('Submit').text('Submit');
                            //if slide up is used go to the below flow
                            if($('#setup_model_notification').length){

                                $('#member_cellphone').prop('readonly', true);
                                setTimeout(function(){
                                    $('#setup_model_notification').slideToggle('slow');
                                    location.reload();
                                },6300)
                            }
                            else{
                                console.log("$('#setup_model_notification').length - false")
                            }
                            if( $('#body').length ){
                                location.reload();
                                console.log('home page')
                            }
                        }
                    }

                    if( res.resType == 'model_delete' ){

                        if(res.do_delete == true){
//						$('#'+res.sectionId + ' .request').slideDown();
                            $('#'+res.sectionId).delay(3000).queue(function(closeMSG){
                                removeItem('#'+res.sectionId )
                                if($('.grid .grid-item').length == 1){
                                    $('<h3>YOU HAVE NOT SELECTED ANY MODEL ALERTS YET</h3>').appendTo('.notifications');
                                }

                            });
                        }else{
                            $('#'+res.sectionId+' .proc_req').text(res.message)
                        }
                    }
                },error: function(jqXHR, status, error){
                    console.log(error)
                }

            });

        }

        this.clearMobilePhone = function(data, url){
            console.log(data)
            $.ajax({
                url: url,
                type: "POST",
                data: data,
                crossDomain:true,
                xhrFields:{
                    withCredentials: true
                },
                success: function(data, status, jqXHR){
                    console.log(jqXHR)
                    var res = $.parseJSON(data)
                    if(res.status = 'success'){
                        $("#warning2").delay(1900).queue(function(closethis) {
                            $('#nrsp input').val('')
                            $('#notifications input').prop('readonly', false);
                            $('.bfh-selectbox-option:nth(0)').text('(select dial prefix)')
                            $("#if_cellphone_verified").fadeOut('slow','linear')
                            $('#warning2').hide()
                            closethis();
                        });
                    }

                },error: function(jqXHR, status, error){
                    console.log(error)
                }

            });
        }

        //add model to mobile notifications

        this.addModelNotifications = function(data, url){
            $('#form_output').empty().slideToggle('slow').append('<img src="'+wcc.wait_gif.src+'" style="height:20px; width:20px;">').addClass('modal-alternate-bg')

            $.ajax({
                url: url,
                type: "POST",
                data: data,
                crossDomain:true,
                xhrFields:{
                    withCredentials: true
                },
                success: function(data, status, jqXHR){

                    var res = $.parseJSON(data)
                    var message = res.message.replace("&gt;", ">" ).replace("&lt;", "<");
                    $('#form_output').html( message );
                    $('#form_output').delay(2500).queue(function(closeMsg){
                        $('#notification_model_id').remove();
                        closeMsg()
                    })
                    setTimeout(function(){
                        $('#form_output').slideToggle('slow').removeClass('modal-alternate-bg');
                    },4500)
                },error: function(jqXHR, status, error){
                    console.log(error)
                }

            });
        }
        //get message folder and count of messages in each folder
        this.getFolder = function(data, url, id){
            if( id != '#addressbook-label'){
//				$('#form_output').slideDown().text('Processing Request');
                $('#inbox-messages .dom_rendered, #no_messages_found').remove()
                $('#inbox-messages').removeClass('hide');
                $('#view-message').addClass('hide');
                $(id).append('<img id="pre_loading_img" src="'+wcc.wait_gif.src+'" style="height:20px; width:20px;">')
            }
            $.ajax({
                url: url,
                type: "POST",
                data: data,
                crossDomain:true,
                xhrFields:{
                    withCredentials: true
                },
                success: function(data, status, jqXHR){
                    var res = $.parseJSON(data)
                    //console.log(res);

                    if( res.status === "success" && res.mail_list != null ){

                        $.each(res.mail_list, function(index, item){
                            var body_text = null;
                            $.each(item.body, function(index, body){
                                body_text = body.text
                            });
                            var status = item.status.toLowerCase()
                            var newRow  = '<div id="topMsg_'+ item.id +'" class="message-line"><!-- messages container row-->';
                            newRow += '<div class="msg-status ' + ( status == 'unread' ? " unread-label" : "") + ' "><!-- message status color code label-->';
                            newRow += '&nbsp;';
                            newRow += '</div>';
                            newRow += '<div id="msg_'+ item.id +'" class="message-div ' + ( status == 'unread' ? " msg-unread" : "msg-read")+' ">';
                            newRow += '<!-- messages list -->';
                            newRow += '<div class="msg-checkbox"><!-- check box container -->';
                            newRow += '<!--  /* label, input name and ipnput id must all much and be unique */ -->';
                            newRow += '<label for="select-msg-'+ item.id +'">';
                            newRow += '<input type="checkbox" name="select-msg-'+ item.id +'" id="select-msg-'+ item.id +'" value="'+ item.id +'">';
                            newRow += '<span></span>';
                            newRow += '</label>';
                            newRow += '</div><!-- end of check box container -->';
                            newRow += '<div class="from  unread-msg ' + ( status == 'unread' ? " yes" : "no")+ ' "><!-- message from -->';
                            newRow += item.name;
                            newRow += '</div><!-- end of from -->';
                            newRow += '<div class="subject unread-msg ' + ( status == 'unread' ? " yes" : "no")+ '"><!-- message subject -->';
                            newRow += item.subject;
                            newRow += '</div><!-- end of subject -->';
                            newRow += '<div class="message-intr"> <!-- message intro preview -->';
                            newRow +=  body_text;
                            newRow += '</div>';
                            newRow += '<!-- if message has attachment -->';
                            newRow += '<div class="attachement">';
                            newRow += ( item.has_attachment  ? '<i class="fa fa-paperclip" aria-hidden="true"></i>' : "&nbsp;");
                            newRow += '</div>';
                            newRow += '<div class="message-time text-right">';
                            newRow +=  item.send_recv_date ;
                            newRow += '</div>';
                            newRow += '</div><!-- end of message list -->';
                            newRow += '</div><!-- end of message row -->';

                            $('#new_items').each(function(){
                                $(this).empty()
                                $(this).delay(10).queue(function(addNew){
                                    $(this).append(newRow);
                                    $('#pre_loading_img').remove();
                                    addNew()
                                })
                            });

                            $('input').prop('checked', false);
                        });
                        // get new folder counts
                        if(res.folderCount){
                            self.folderCounts(res)
                        }
                    }else if( res.mail_list == null  && res.status === "success"){
                        $('#inbox-messages .dom_rendered').remove()
                        $('#inbox-messages').removeClass('hide')
                        $('#no_messages_found').remove()
                        $('#view-message').addClass('hide')
                        $('#new_items').empty();
                        $('#pre_loading_img').remove();
                        $('#new_items').append('<div id="no_messages_found" class="message-line text-center">No messages found</div>')
                    }
                },error: function(jqXHR, status, error){
                    console.log(error)
                }
            });
        }
        /**
         * Get message by message id
         *
         *
         */

        this.getMessageById = function( data, url, id ){
            $('#message-txt').empty();
            $(id).removeClass('hide');
            $('#view-message').css('visibility', 'hidden')
            $('#inbox-messages').removeClass('show').addClass('hide');
            $('<div id="preloading_img" class="text-center"><img src="'+wcc.wait_gif.src+'" style="height:20px; width:20px;"></div>').insertBefore('#inbox-messages');

            $.ajax({
                url: url,
                type: "POST",
                data: data,
                crossDomain:true,
                xhrFields:{
                    withCredentials: true
                },
                success: function(data, status, jqXHR){
                    var res = $.parseJSON(data)
                    if (res.status == 'success'){
                        var modelPhotoUrl = res.modelPhoto;
                        var memberPhotoUrl = res.memberphoto;
                        var message = res.messages.threads.text
                        $('#view-message h2').text( res.messages.subject );
                        $('#message-from').html(res.messages.from_username + '<br><span>to ' + res.messages.owner_username +'</span>');
                        $('#message-time').text(res.messages.sendRecvDateFmt);
                        $('.senderImg img').attr('src', modelPhotoUrl)
                        $('.userThumb img').attr('src', memberPhotoUrl)
                        $('#rp_message_id').val(res.messages.id)

                        $.each(res.messages.threads, function(index, item){

                            var rowCount = res.messages.threads.length
                            var str = item.text;
                            var newStr = str.replace('r&lt;',' <').replace('/&gt;', '> ').replace('r&lt;br /&gt;', ' ')
                            $('#message-txt').each(function(){
                                console.log('lenght: '+rowCount)
                                var newMessageRow = '<div class="row">'
                                newMessageRow += '<div class="col-xs-1 userNameReply"><img src="'+ item.user_photo_url + '" alt="' + item.username + '"><span class="hidden-xs">' + item.username + '</span></div>';
                                newMessageRow += '<div class="col-xs-9 messageBody">' +  newStr + '</div>';
                                newMessageRow += '<div class="col-xs-2 text-right received">'+ item.header.sendRecvDateFmt + '</div>';
                                newMessageRow += "</div>";
                                if(rowCount < 1 ){
                                    $(this).append( newMessageRow)

                                }else{
                                    $(this).append(newMessageRow )
                                    $('#message-txt .row').not(':last').addClass('msg-collapse')
                                }
                            })
                        });
                        if( res.messages.hasAttachment ){
                            var uri = document.origin+res.messages.attachmentURL;
                            $('#has_attachment').append('<i class="fa fa-paperclip"></i> &nbsp; '+ res.messages.fileName +' &nbsp; <a href="' + uri + '" class="btn btn-success"><i class="fa fa-download" aria-hidden="true"></i></a>')
                        }else{
                            console.log('no attachment')
                        }
                        $('#message-txt').append('<div class="clearfix"></div>')
                        $('#view-message').delay(400).queue(function(showDiv){
                            $('#pre_loader').remove()
                            $('#view-message').removeAttr('style');
                            $('#preloading_img').remove()
                            if( $('#read').val() != "" ){
                                $('#read').val("")
                            }
                            showDiv()
                        })
                    }

                }

            });

        }
        //Message actions, send, reply and move messages
        this.inboxAcctions = function(data, url){
            $.ajax({
                url: url,
                type: "POST",
                data: data,
                crossDomain:true,
                xhrFields:{
                    withCredentials: true
                },
                success: function(data, status, jqXHR){
                    var res = $.parseJSON(data);
                    var res = $.parseJSON( data )
                    //move messages
                    if(res.folderCount){
                        self.folderCounts(res)
                    }
                    if( res.action == "trash" || res.action == "saved" || res.action == "delete"  ){
                        $.each(res.sectionId, function(index, item){
                            $('#inbox-messages').on('remove', '#topMsg_'+item, function(){
                                $(this).remove()
                            })
                            $('#topMsg_'+item).remove();

                        });

                        $('.archive, .block, .delete, .df').removeClass('unchecked').addClass('checked');
                        $('.reloadBox').removeClass('checked').addClass('unchecked');
                        $('input').prop('checked', false);
                        $('input[name="model_id[]"]').each(function(){
                            $(this).remove()
                        })
                        $('#inbox-label').click()
                        self.folderCounts(res)
                    }
                    else if( res.action == "block" ){
                        console.log('response '+ res.action);

                    }
                    //sent message response
                    else if(res.action == 'sent mail'){
                        if(res.status == "success"){
                            if($('#cover-all').length){
                                $('#cover-all').hide() // hide the back drop if it exist
                            }
                            $('#form_output').removeClass('has-error').addClass('has-success').slideDown().text(res.message);

                            $('#model_id, #to_model, #mail_subject, #mail_message').val('')
                            $('#composer').slideToggle('slow');
                            $('#message_attachment').empty();
                            $('#composer-btns .btn-primary').removeClass('disabled');
                            $('#form_output').delay(3000).queue(function(closeMsg){
                                $('#form_output').slideUp().removeClass('has-succeess');
                                closeMsg()
                            });
                            if( $('#add-favorites').length ){
                                $('#add-favorites').append('<input type="hidden" name="model_id" id="model_id" value="">')
                            }
                        }
                        else{
                            $('#form_output').addClass('has-error').slideDown().text(res.message);
                            $('#composer-btns .btn-primary').removeClass('disabled')
                        }
                    }//sent reply response
                    else if( res.action == 'message reply' ){
                        if(res.status == "success"){
                            $('#reply-input-txt').slideUp();
                            $('#reply-input-txt').find('textarea').val('');
                            $('#sendMsg').removeClass('disabled')

                        }

                    }

                }
            })
        }
        /*
         *
         * private function to render new folder counts in messages page
         */
        this.folderCounts = function(res){
            $('.inboxCount').text("("+ res.folderCount.f_inboxCount +")");
            $('.sentCount').text("("+ res.folderCount.f_sentCount +")");
            $('.savedCount').text("("+ res.folderCount.f_savedCount +")");
            $('.trashCount').text("("+ res.folderCount.f_trashCount +")");
        }
        /*
         * send message attachment
         */
        this.sendMemberAttachment = function(url, id){
            var attachmentData = new FormData($(id)[0])
            $.ajax({
                url : url,
                type : 'POST',
                xhr: function() {  // Custom XMLHttpRequest
                    var myXhr = $.ajaxSettings.xhr();
//						}
                    return myXhr;
                },
                data : attachmentData,
                cache : false,
                crossDomain : true,
                contentType: false,
                processData:false,
                xhrFields : {
                    withCredentials: true
                },
                success : function (data, status, jqXHR) {
                    var res = $.parseJSON( data );
                    if(res.action = 'attachment'){
                        $('.progress-bar').css('width', '100%');
                        $('.progress').delay(500).queue(function(removeBar){
                            $(this).remove();
                            $('.attachment_holder i').removeClass('disabled')
                            $('.attachment_holder').addClass('active-attachment')
                            removeBar();
                            $('.qqfile').val('')
                        })
                    }

                }
            })
        };

        /*
         * Remove fav model
         *
         */
        this.removeFavoriteModel = function(url, data){
            $.ajax({
                url:url,
                type:"POST",
                data:data,
                cache:false,
                crossDomain:true,
                xhrFields:{
                    withCredentials:true
                },
                success: function(data, status, jqXHR){
                    var res = $.parseJSON(data)
                    $.each(res.sectionId, function(index, item){
                        $('#fav-'+item+' .remove-div').css('background-color', 'rgba(204, 204, 204, 0.3)')
                        $('#fav-'+item+' .sts-message').text(res.message)
                        $('#fav-'+item).addClass('has-'+res.status)
                        console.log( $('#fav-'+item+' .sts-message') )
                        setTimeout(function(){
                            removeItem( '#fav-'+item ); //calls my-account.js
                        }, 500)
                    })
                    setTimeout(function(){
                        var divCount = $('.grid-item').length
                        console.log(" $('.grid-item').length " + divCount)
                        if( divCount == 1 ){
                            console.log('You have not selected any favorite models yet')
                            $('.section-light').append('<div class="text-center">You have not selected any favorite models yet</div>')
                        }
                    },850)
                }
            })
        }
        /**
         *  add model to favorites
         */
        this.addFavoriteModel = function(url, data){
            $('.model-menu-open').hide()
            $('#form_output').html('<img src="'+wcc.wait_gif.src+'" style="height:20px; width:20px;">').slideToggle('slow');
            $.ajax({
                url:url,
                type:"POST",
                data:data,
                cache:false,
                crossDomain:true,
                xhrFields:{
                    withCredentials:true
                },
                success: function(data, status, jqXHR){

                    var res = $.parseJSON(data)
                    if( $('.stat_counts .fa-heart').length ){
                        $('#fav_count').text(res.favCount)
                    }
                    $('#form_output').html( res.message );
                    setTimeout(function(){
                        $('#form_output').html( "" ).slideToggle('slow');
                    },3000);
                }
            });
        }
        /**
         * Load more favorite models
         * @param url
         * @param data
         */
        this.loadMoreFavorites = function(url, data){
            $.ajax({
                url:url,
                method:'POST',
                data:data,
                cache : false,
                crossDomain : true,
                xhrFields : {
                    withCredentials: true
                },
                success:function(req){
                    var res = JSON.parse(req);
                    $('#get_more_favs i').toggleClass('hide')
                    if(res.status == "success"){
                        params.offset = res.offset;
                        $(res.moreData).each(function(index, item){

                            var imgUrl = item.photo_large_url;
                            var profileUrl;
                            var onlineStatus;
                            var gender;

                            if(item.online == 0){
                                profileUrl = '/?'+item.model_profile_url;
                                onlineStatus = "offline"
                            }else{
                                profileUrl = '/members/?'+item.model_chat_url;
                                onlineStatus = 'available'
                            }
                            switch(item.gender){
                                case "Single - Female":
                                    gender = 'fa-female';
                                    break;
                                case "Single - Male":
                                    gender = "fa-male";
                                    break;
                                default:
                                    gender = 'fa-venus'
                            }
                            var rating = "";

                            if(item.rating){
                                for(var mr = 0; mr < item.rating_full_stars.length; mr++){
                                    rating += '<i class="fa fa-star"></i>'
                                }
                                if( item.rating_half_star ) {
                                    rating += '<i class="fa fa-star-half-o"></i>';
                                }
                            }else{
                                rating = '<i class="fa fa-star-o"></i>'
                            }

                            var newCell = '<div id="fav-'+item.model_id+'" class="grid-item">'
                            newCell += '<div class="remove-div text-center" style="display: none">\n' +
                                '\t\t<img alt="loading" src=""><br>\n' +
                                '\t\t<span class="sts-message">Removing model from Favorites!</span>\n' +
                                '\t</div>\n' +
                                '\t<span class="hide">\n' +
                                '\t\t<input type="checkbox" name="model_id[]" value="'+item.model_id+'">\n' +
                                '\t</span>'
                            newCell += '<a href="'+profileUrl+'" alt="'+item.username+'">'
                            newCell += '<img src="'+imgUrl+'">'
                            newCell += '</a>'
                            newCell += '<div class="model-stats-label fav-sts-'+onlineStatus+'">\n' +
                                '\t\t<div class="fav-model-satus col-xs-8">\n' +
                                '\t\t\t<i class="fa fa-comments"></i>\n' +
                                '\t\t\t'+onlineStatus+'</div>\n' +
                                '\t\t<div class="fav-model-features col-xs-4 text-right">\n' +
                                '\t\t\t<i class="fa fa-volume-up"></i>\n' +
                                '\t\t\t<span class="hd">HD</span>\n' +
                                '\t\t\t<i class="fa fa-mobile"></i>\n' +
                                '\t\t</div>\n' +
                                '\t</div>'
                            newCell += '<div class="model-information">\n' +
                                '\t\t<div class="fav-model-name col-xs-6">\n' +
                                '\t\t\t'+item.username +
                                '\t\t</div>\n' +
                                '\t\t<div class="fav-model-ratings col-xs-6">\n' +
                                '\t\t\t<span>\n' +
                                rating+
                                '\t\t\t</span>\n' +
                                '\t\t</div>\n' +
                                '\t</div>'
                            newCell += '<div class="fav-model-icons">\n' +
                                '\t\t<a href="'+profileUrl+'">\n' +
                                '<i class="fa '+gender+'" title="View Profile"></i>\n' +
                                '\t\t\t</a>\n' +
                                '\t\t<i class="fa fa-money" title="Send Tip" onclick="tipModel(\''+item.id+'\', \''+item.username+'\')"></i>\n' +
                                '\t\t<i class="fa fa-star" title="Vote" onclick="model_raitings.vote(\''+item.id+'\', \''+item.username+'\')"></i>\n' +
                                '\t\t<i class="fa fa-envelope" title="Message" onclick="message.newMessagetoModel(\''+item.id+'\', \''+item.username+'\' )"></i>\n' +
                                '\t\t<i class="fa fa-bell"></i>\n' +
                                '\t\t<i class="heart fa fa-heart after" title="Unfavorite"></i>\n' +
                                '\t\t<!--<i class="fa fa-times-circle"></i>-->\n' +
                                '\t</div>'
                            newCell +=	'</div>';
                            $('.grid').append( newCell ).isotope('reloadItems').isotope({sortBy: 'original-order'});
                        });


                        document.querySelector('#get_more_favs').scrollIntoView({
                            behavior: 'smooth'
                        });
                    }
                    if(res.message == "Last Models"){
                        $('#get_more_favs').attr('disabled',true).text("No more models to load")
                    }
                }

            })
        }


        /**
         * membership subscriptions
         */
        this.membershipSubscriptions = function(url, data){
            $.ajax({
                url:url,
                type:"POST",
                data:data,
                cache:false,
                crossDomain:true,
                xhrFields:{
                    withCredentials:true
                },
                success: function(data, status, jqXHR){
                    var res = $.parseJSON(data)

                    var id = '#'+res.mesmbership_id
                    $(id).find('.message').text( res.results.message )



                }
            });
        };
        /*
         * add member to models fan club
         */
        this.addMembertoFanclub = function(url, data){
            $('#wcc3_modal button:nth(1)').html('<img height="20" width="20">');
            $('#wcc3_modal button:nth(1) img').attr("src", wcc.wait_gif.src).attr('height', '20px').attr('width', '20px');
            $.ajax({
                url:url,
                type:"POST",
                data:data,
                dataType: 'json',
                cache:false,
                crossDomain:true,
                xhrFields:{
                    withCredentials:true
                },
                success:function(data, status, jqXHR){
                    var res = data;
                    $('#fan_count').text(res.fanCount)
                    var message = res.message;
                    var title = "Thank you!";
                    var body = "<h2 class='text-center'>"+message+"</h2>";
                    footer = {enable:true, buttons:1 };
                    wcc3_build_modal(title, body, footer);



                }
            })

        };
        /*
         * model tips
         */
        this.doModelTips = function(url, data){
            $('#wcc3_modal_messages').empty()
            $('#wcc3_modal_messages').slideToggle();
            $('#wcc3_modal_messages').append('<img height="20" width="20">');
            $('#wcc3_modal_messages img').attr("src", wcc.wait_gif.src).attr('height', '20px').attr('width', '20px');
            $('#wcc3_modal_messages').removeClass('has-error')
            $.ajax({
                url: url,
                type: "POST",
                data: data,
//			dataType: 'jsonp',
                cache: false,
                crossDomain: true,
                xhrFields:{
                    withCredentials:true,
                },
                success: function(data, status, jqXHR){
                    var res = $.parseJSON(data);
                    if(res.status == "success"){
                        $('#wcc3_modal_messages').html(res.message);
                        var oldCresits = $('#creditsSpan span.greenText.tb_credits').text();
                        var creditsUsed = res.tip_am;
                        var newCredits = Number(oldCresits - creditsUsed);
                        $('#creditsSpan span.greenText.tb_credits').text(newCredits)
                    }else{

                        $('#wcc3_modal_messages').html(res.message).addClass('has-error');
                    }
                    setTimeout(function(){
                        $('#wcc3_modal_messages').slideToggle()
                        $('#custom_tip').val('');
                    },4000)
                },
            });
        }
        /*
         * votes for a models or rates a model
         */
        this.doVote = function(url, data){
            $.ajax({
                url:url,
                type:"POST",
                cache:false,
                crossDomain: true,
                xhrFields :{
                    withCredentials: true,
                },
                data: data,
                success: function(data, status, jqXHR){
                    var res = $.parseJSON(data);
                    if(res.status == "success"){
                        setTimeout(function(){
                            $('#stat_message').html(res.message);
                        }, 3000);
                        setTimeout(function(){
                            $("#wcc3_modal").modal('hide')
                        }, 5500);
                    }else{
                        setTimeout(function(){
                            $('#stat_message').html(res.message);
                        }, 3000);
                    }

                },

            })

        }
        /**
         * redeems a members clubcode
         */
        this.redeemClubCode = function(ci, cc) {

            if($('#clubcode-'+ci).parent().attr('id') == 'used-codes'){
                return false;
            }

            $('#clubcode-redeem-btn-'+ci).removeClass('show').addClass('hide');
            $('#clubcode-working-'+ci).removeClass('hide').addClass('show').find('img').attr('src', wcc.wait_gif.src).css({'height':'20px', 'width':'20px'});

            var postUrl = $('#redeem-clubcode').attr('action');
            var formData = $('#redeem-clubcode').serialize();
            formData += '&clubcode='+cc;

            $.ajax({
                url : postUrl,
                type : 'POST',
                cache : false,
                crossDomain : true,
                xhrFields : {
                    withCredentials: true
                },
                data : formData,
                success : function (data, status, jqXHR) {

                    var res = $.parseJSON( data );
                    $('#form_output').fadeIn( "slow", "linear" ).removeClass('has-error has-success').addClass('has-'+res.status).text( res.message );
                    if(res.status == 'success'){

                        $('#form_output').delay(3000).queue(function(resetGrid){
                            $('#clubcode-expires-'+ci).remove();
                            $('#clubcode-btn-'+ci).html(res.btn_text);
                            $('#clubcode-btn-'+ci).unbind('click');
                            $('#clubcode-btn-'+ci).off('click');
                            $('#no-used-codes').addClass('hide').html('');
                            var cc_html = $('<div id="clubcode-' + ci + '" class="grid-item">' + $('#clubcode-'+ci).html() + '</div>');
                            $('#unused_codes').isotope('remove', $('#clubcode-'+ci)).isotope('layout');
                            $('#used-codes').prepend(cc_html).isotope('reloadItems').isotope({sortBy: 'original-order'});

                            $('#no-unused-clubcodes').delay(500).queue(function(checkUnused) {
                                if( $('#unused_codes .grid-item').size() == 0 ) {
                                    $('#no-unused-clubcodes').removeClass('hide').addClass('show');
                                }
                                checkUnused();
                            });

                            $('#form_output').removeClass('show').fadeOut( "slow", "linear" );
                            resetGrid();
                        });
                    }
                    else {

                        $('#clubcode-redeem-btn-'+ci).removeClass('hide').addClass('show');
                        $('#clubcode-working-'+ci).removeClass('show').addClass('hide');
                    }
                },
                error : function (jqXHR, status, error) {
                    console.log(error, status)
                }
            });
            return false;
        };


        /**
         * request more videos
         */
        this.loadMoreVideos = function( type ) {

            if( self.loading ) {

                return false;
            }

            self.loading = true;
            var postUrl = $('#video-'+type+'-form').attr('action');
            var formData = $('#video-'+type+'-form').serialize();

            $('#btn_load_more_'+type+'>i').removeClass('hidden');

            $.ajax({
                url : postUrl,
                type : 'POST',
                cache : false,
                crossDomain : true,
                xhrFields : {
                    withCredentials: true
                },
                data : formData,
                success : function (data, status, jqXHR) {

                    var res = $.parseJSON( data );
                    self.loading = false;


                    if( res.videos != null ){

                        if( res.type == 'purchased' ) {

                            $.each( res.videos, function(index, video) {

                                self.renderPurchasedVideo(video);

                            });
                        }
                        else if( res.type == 'available' ) {

                            $.each( res.videos, function(index, video) {

                                self.renderAvailableVideo( video );
                            });
                        }
                    }

                    if( res.more ) {

                        $('#btn_load_more_'+type+'>i').addClass('hidden');
                    }
                    else {

                        $('#btn_load_more_'+type+'').addClass('hidden');
                    }
                },
                error : function (jqXHR, status, error) {

                    console.log(error, status);
                    self.loading = false;
                }
            });

            return false;
        };

        this.filterVideosByModel = function(args){
            if(args.data !== '' && args.url !== undefined){
                $.ajax({
                    url: args.url,
                    type: 'POST',
                    cache: false,
                    crossDomain: true,
                    xhrFields: {
                        withCredentials: true
                    },
                    data: args.data,
                    success: function (data, status, jqXHR) {
                        var res = JSON.parse(data);

                        if(res.status == "success"){
                            //remove old grid items from content's grid page.
                            $('#videos-grid').find('.grid-item').remove();
                            $('#mbr_available_videos').find('.grid-item').remove();

                            //make sure all owl-item have been removed
                            if($('.owl-item').length){
                                var itemLength = $('.owl-item').length;
                                var v = 0;
                                while (v < itemLength) {
                                    $('#video-list')
                                        .trigger('remove.owl.carousel', [v])
                                        .trigger('refresh.owl.carousel');
                                    v++;
                                }
                            }

                            setTimeout(function () {
                                var isAvailable = 0;

                                $.each(res.data, function(index, video){

                                    if(video.purchase_type != undefined){
                                        self.renderPurchasedVideo(video);
                                    }else{
                                        self.renderAvailableVideo( video );
                                        isAvailable++
                                    }
                                })
                                if(isAvailable < 1){
                                    $('#available_videos').hide()
                                }else{
                                    $('#available_videos').show()
                                }
                            },1000)
                            setTimeout(function () {
                                $('#contentOverLay').fadeToggle(300,'linear');
                            },2500)
                        }
                    }
                })
            }

        };
        /**
         * renders purchased videos
         *
         * @param video
         */
        this.renderPurchasedVideo = function (video) {

            var newRow = '';
            newRow += '<div id="mbr_video_' + video.video_id + '" class="grid-item">';
            newRow += '<div class="video-holder">';
            newRow += '<div class="mbr_video_item_info">';
            newRow += '<div class="txt mbr_video_info_type" style="float:left;">';
            newRow += '<span style="font-weight:bold;">Type:</span>';
            newRow += '<span style="font-weight:normal;">';
            newRow += '<span style="font-weight:normal;">' + video.purchase_type_fmt + '</span>';
            newRow += '</div>';
            newRow += '<div class="txt mbr_video_info_type" style="float:right;">';
            if(video.purchase_type == 'expires') {
                newRow += '<span style="font-weight:normal;">' + video.time_left_fmt + '</span>';
            }
            else{
                newRow += '<span style="font-weight:bold;">Date:</span>';
                newRow += '<span style="font-weight:normal;">' + video.date_fmt + '</span>';
            }
            newRow += '</div>'
            newRow += '</div>';
            newRow += '<div class="poster-play staged-videos">';
            newRow += '<i class="poster-play-btn material-icons" onclick="h5player.openPoster(\'' + video.video_id + '\'); return false;">play_circle_outline</i>';
            newRow += '</div>';
            newRow += '<img src="' + video.snapshot_url + '" alt="' + video.model_username + '" class="poster-image">';
            newRow += '</div>';

            if( typeof video.msg !== 'undefined' ) {

                newRow += '<div class="model-stats-label fav-sts-msg">';
                newRow += '<div class="fav-model-status col-xs-12">';
                newRow += video.msg;
                newRow += '</div>';
                newRow += '</div>';
            }

            newRow += '<div class="model-stats-label fav-sts-' + (video.online ? 'available' : 'offline') + ( typeof video.msg !== 'undefined' ? ' hidden' : '') + '">';
            newRow += '<div class="fav-model-satus col-xs-8">';
            newRow += '<i class="fa fa-comments"></i>' + (video.online ? 'Available' : 'Offline' );
            newRow += '</div>';
            newRow += '<div class="fav-model-features col-xs-4 text-right">';
            newRow += '<i class="fa fa-volume-up"></i>';
            newRow += '<span class="hd">HD</span>';
            newRow += '<i class="fa fa-mobile"></i>';
            newRow += '</div>';
            newRow += '</div>';


            newRow += '<div class="model-information">';
            newRow += '<div class="fav-model-name col-xs-6">' + video.model_username + '</div>';
            newRow += '<div class="fav-model-ratings col-xs-6">';
            newRow += '<span>';
            if( video.rating ) {
                for( var r=0; r < video.rating_full_stars.length; r++) {
                    newRow += '<i class="fa fa-star"></i>';
                }
                if( video.rating_half_star ) {
                    newRow += '<i class="fa fa-star-half-o"></i>';
                }
            }
            else {
                newRow += '<i class="fa fa-star-o"></i>';
            }
            newRow += '</span>';
            newRow += '</div>';
            newRow += '</div>';
            newRow += '<div class="fav-model-icons">';
            newRow += '<a href="' + video.profile_url + '">';
            if( video.gender == 'Female' ) {
                newRow += '<i class="fa fa-female" title="View Profile"></i>';
            }
            else if( video.gender == 'Male' ) {
                newRow += '<i class="fa fa-male" title="View Profile"></i>';
            }
            else {
                newRow += '<i class="fa fa-venus-mars" title="View Profile"></i>';
            }
            newRow += '</a>';
            newRow += '<i class="fa fa-money" title="Send Tip" onclick="tipModel(\'' + video.model_id + '\', \'' + video.model_username + '\')"></i>';
            newRow += '<i class="fa fa-star" title="Vote" onclick="model_raitings.vote(\'' + video.model_id + '\', \'' + video.model_username + '\')"></i>';
            newRow += '<i class="fa fa-envelope"  title="Message"></i>';
            newRow += '<i class="fa fa-bell"  title="Notifications" onclick="mobileAlerts.addModelAlerts(' + video.model_id + ')"></i>';
            if( video.favorite ) {
                newRow += '<i class="heart fa fa-heart" title="Favorite Model"></i>';
            }
            else {
                newRow += '<i id="fav_model_' + video.model_id + '" class="heart fa fa-heart-o" title="Add to favorites" onclick="favoriteMe( \"#model_' + video.model_id + '\" )"></i>';
            }
            newRow += '</div>';
            newRow += '</div>';

            if( typeof video.msg === 'undefined') {
                $('#videos-grid').append(newRow).isotope('reloadItems').isotope({sortBy: 'original-order'});
            }
            else {
                $('#videos-grid').prepend(newRow).isotope('reloadItems').isotope({sortBy: 'original-order'});
            }

            // video player carousel
            newRow = '';
            newRow += '<div class="video-item">';
            newRow += '<input type="hidden" name="vid-id" value="' + video.video_id + '">';
            newRow += '<div style="width: 100%; position: relative">';
            newRow += '<div class="mbr_video_item_info">';
            newRow += '<strong>Type:</strong> ' + video.purchase_type;
            if( video.purchase_type == 'expires' ) {
                newRow += '<span class="pull-right">' + video.time_left_fmt + '</span>';
            }
            newRow += '</div>';
            newRow += '</div>';
            newRow += '<div class="poster-play">';
            newRow += '<i class="poster-play-btn material-icons" onclick="h5player.loadAndPlay(\'' + video.video_id + '\');">play_circle_outline</i>';
            newRow += '</div>';
            newRow += '<img src="' + video.snapshot_url + '" alt="' + video.model_username + '">';
            if( typeof msg !== 'undefined' ) {
                newRow += '<span>' + msg + '</span>'
            }
            newRow += '<div class="fav-model-name">' + video.model_username + '</div>';
            newRow += '</div>';

            // $('#video-list').trigger('add.owl.carousel', [newRow]).trigger('refresh.owl.carousel');
            $('#video-list').trigger('add.owl.carousel', [$(newRow),0]).trigger('refresh.owl.carousel');
        };

        /**
         * renders available videos
         *
         * @param video
         */
        this.renderAvailableVideo = function ( video ) {

            var newRow = '';
            newRow += '<div id="mbr_video_available_' + video.show_id + '" class="mbr_video_available grid-item">';
            newRow += '<div class="img-loader-overlay" style="display: none">';
            newRow += '<img src="/images/wcc3/spinner.svg" >';
            newRow += '</div>';
            newRow += '<div class="mbr_video_available_show_info">';
            newRow += '<div class="video-holder">';
            newRow += '<div class="video-show-date">Show Date:<br> ' + video.show_date + '</div>';
            newRow += '<div class="video-show-length">Show Length:<br> ' + video.show_length_fmt + '</div>';
            newRow += '<div class="txt2">' + video.model_username + '</div>';
            newRow += '<div class="clearfix"></div>';
            newRow += '</div>';
            newRow += '<div class="clear_both"></div>';
            if( video.fanclub_discount_amt ) {
                newRow += '<div class="clear_both"></div>';
                newRow += '<div>';
                newRow += '<div>' + video.fanclub_discount_amt + '% Fan Club Membership discount applied</div>';
                newRow += '</div>'
                newRow += '<div class="clear_both"></div>';
            }
            newRow += '<div class="mbr_video_available_show_photo">';
            newRow += '<img class="mphoto_no_hover" src="' + video.snapshot_url + '" />';
            newRow += '</div>';
            newRow += '<div id="purchase_show_buttons">';
            newRow += '<div style="padding-bottom: 5px;">';
            newRow += '<button type="button" name="rent_show" id="rent_show" class="form_submit_button btn full-width-btn" onclick="this.blur(); purchaseOrRentVideo.process(\'' + video.video_id + '\',\'mbr_video_available_' + video.show_id + '\', \'' + video.show_id + '\', \'expires\', null, \''+ video.show_type_expires_label + '\' ); return false;">Rent for ' + video.member_video_keep_days + ' days - ' + video.video_cost_fmt + '</button>';
            newRow += '</div>';
            newRow += '<div>';
            newRow += '<button type="button" name="buy_show" id="buy_show" class="form_submit_button btn full-width-btn" onclick="this.blur(); purchaseOrRentVideo.process(\'' + video.video_id + '\', \'mbr_video_available_' + video.show_id + '\', \'' + video.show_id + '\', \'' + video.show_type_lifetime_label + '\', null, \'my_videos\' ); return false;">Buy and Keep - ' + video.video_cost_lifetime_fmt + '</button>';
            newRow += '</div>';
            newRow += '</div>';
            newRow += '</div>';
            newRow += '</div>';

            $('#mbr_available_videos').append(newRow).isotope('reloadItems').isotope({sortBy: 'original-order'});
        }

        this.ajaxCall = function(obj, cb){
            var ajaxRes = null
            // console.log(obj.data);
            $.ajax({
                url:obj.url,
                type:'POST',
                cache : false,
                crossDomain : true,
                xhrFields : {
                    withCredentials: true
                },
                data: obj.data,
                success:function(req){
                    var res = JSON.parse(req);
                    ajaxRes = res.options;
                    cb(ajaxRes);
                }
            })
        }
    };


    return _Members;

})();

var Members = new Members();
$.extend(Members, wcc);

$(window).ready(function() {


});
