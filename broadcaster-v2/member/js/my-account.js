// JavaScript Document
"use strict";

$(document).ready(function(){
    $('#table_dropdown_menu li').last().addClass('logOutBtn');
    $('#MyAccount div').last().addClass('logOutBtn')

    if($('.grid').length >= 1){
        $('.grid').isotope({
            layoutMode: 'fitRows',
            itemSelector: '.grid-item'
        });
    }
    $('section').css('visibility','');

    // tool-bar
    if ($('#top-tool-icons .col-xs-3').length == 1){
        $('#top-tool-icons .col-xs-3').css("border","none");
        $('#top-tool-icons .col-xs-3').addClass('col-xs-offset-9');
    }

    else if( $('#top-tool-icons .col-xs-3').length == 2 ){
        $('#top-tool-icons .col-xs-3').addClass('col-xs-offset-6')
    }

    $('.accout-actions').on('mouseover',function(){
        $(this).find('i').css({'opacity':'1','top':'0px'});
    });

    $('.accout-actions').on('mouseout', function(){
        $(this).find('i').css({'opacity':'0.5','top':'5px'});
    });

    //open section panel
    $('div','#maf').on('click', function(){
        //fix isotop issue for my favorites
        //load isotope only if class show is present.
        if($('#my-favorites, #mycontents, #my-tickets, #my-clubs').hasClass('show')){
            var container = $('.grid');
            container.isotope({
                layoutMode: 'fitRows',
                itemSelector: '.grid-item',
                percentPosition: true,
            });
        }
    });

    //credits section
    $('#ecf button,#apm button').on('click', function(){

        if($('.selected').parent().hasClass('credit-package-selected')){

            var credits =  $('.credit-package-selected .credit-amount').text();
            var creditValue =  $('.credit-package-selected .credit-value').text();
            var mostPopular = $('.credit-package-selected .popular-title').text();
            var creditAamountSubtitle = $('.credit-package-selected .credit-amount-subtitle').html();
            var test = creditAamountSubtitle;
            var newArray = test.split("<br>");

            $('.credit-amount-modal').text(credits);
            $('.credit-value-modal').text(creditValue);
            $('.credits-text-modal').text(newArray[0]);
            $('#processed span').text(credits);
            $('.free-credits').html(newArray[1]);

            if(mostPopular === ""){

                $('.useMyCredits').css('margin-top','15px');
                $('.free-credits').addClass('freecreditsModal');
            }

            Merchant.buyModal.packageTitle()
        }
    });

    //credit cells selected events
    $('#credits .package-box , #memberships .package-box').each(function(){
        $('#credits .package-box, #memberships .package-box').on('click','.package-box', function(){
            if($('#credits .package-box, #memberships .package-box').hasClass('credit-package-selected')){
                $('#credits .package-box, #memberships .package-box').removeClass('credit-package-selected').addClass('credit-package');
            }
            if($('.package-box').hasClass('credit-package')){
                $('.package-box').find('.selected').text('SELECT');
                $(this).find('.selected').text('SELECTED');
                $(this).addClass('credit-package-selected');
                $(this).removeClass('credit-package');
            }else{
                $(this).removeClass('credit-package');
                $(this).addClass('credit-package-selected');
            }
            if($('#popular').hasClass('credit-package')){
                $('.credit-disclaimer').css('margin','0px 0 5px 0');
            }
            if($('#popular').hasClass('credit-package-selected')){
                $('.credit-disclaimer').css('margin','0px 0 30px 0');
            }

            var package_id = $(this).find('.package-id').text();
            $('.bp-package-id').val( package_id );

            $('.credit-free-tickets-msg, .membership-free-tickets-msg').addClass('hide').text('');
            // var package_type = $(this).find('.package-type').text();
            // var num_free_tickets = $(this).find('.num-free-tickets').text();
            // var free_tickets_value = $(this).find('.free-tickets-value').text();

            // if( num_free_tickets != '0' ) {
            // 	$('.'+package_type+'-free-tickets-msg').text('Get ' + num_free_tickets + ' feature show tickets a month, a ' + free_tickets_value + ' value!');
            // }
        });
    });


    //calling isoptfunction on child element click
    $('.fav-model-icons').find('.heart.fa-heart').on('click',function(){

        var parentId = '#'+$(this).parents(':eq(1)').attr('id');

        $(parentId+' .remove-div img').attr('src', wcc.wait_gif.src )
        $(parentId+' .remove-div').slideDown()
        $(parentId).find('input').prop('checked', true)
        var url = $('#rem-favorites').attr('action');
        var data = $('#rem-favorites').serialize();

        Members.removeFavoriteModel(url, data)

    });

    if (window.matchMedia('(max-width: 767px)').matches){
        //flip cc processing divs on mobile
        $('.processing:parent').each(function(){
            $(this).insertBefore($(this).prev('.cardOnFile'));
        });
        $('#mobile').on('click',function(){
            if($('.package-box').hasClass('credit-package-selected')){
                $('.package-box').siblings().removeClass('credit-package-selected').addClass('credit-package');
            }
        });
        $('#my-favorites').parent().css('padding','0');
    }

    //my tickets
    $('.upcoming-shows').find('button').on('click',function(){
        var name = $(this).parent().parent().find('.model-name').text();
        var showDescription = $(this).parent().parent().find('.show-description').text();
        var modelName = $.trim(name);
        var image = $(this).parent().parent().find('img').attr('src');

        var dateTime = $.trim($('.upcoming-shows .show-time-date').text());
        var splitDate = dateTime.split("  ");
        var monthDay = splitDate[0].trim();
        var time = splitDate[1].trim();
        var show_dt = '<i class="icon ion-ios-clock-outline"></i> '+monthDay+', 2016 @ '+time;

        var img = '<img src="'+image+'">';

        $('.model-image').html(img);
        $('.show-model-name').text(modelName);
        $('.show-description-modal').text(showDescription);
        $('#get-show-ticket').modal('toggle');
        $('.show-time-modal').html(show_dt);
    });

    //message
    if (window.matchMedia("(max-width: 767px)").matches) {

        $('#inbox-messages, #new_items').on('taphold', '.message-line', function(){
            if($(this).css('background-color') == 'rgb(232, 233, 237)'){
                $(this).removeAttr('style');
                $(this).find('input').click()
            }else{
                $(this).css('background-color', '#E8E9ED');
                var checkBox = $(this).find('input').val()
                $(this).find('input').click()
            }
            // find check box and enable delete, save or block functionality
        });
        $('#inbox-folders button , .mobile-compose').on('click', function(){
            setTimeout(function(){window.scrollTo(0, 180);}, 100);
        })
    }
    if (window.matchMedia("(max-width: 1366px)").matches) {
        $('#inbox-folders button , .mobile-compose').on('click', function(){
            setTimeout(function(){window.scrollTo(0, 60);}, 100);
        })
    }
    var matchVal ;

    $('.reloadBox').on('click', function(){
        $('#message_id').val('')
        $("input[name='request_type']").val('inbox');
        $('.folder-labels').removeClass('selected');
        $('#inbox-label').addClass('selected')
        inboxFolderItems()
        $(this).find('.fa-repeat').removeClass('fa-rotate-right').addClass('fa-rotate-360');
        $(this).delay(3000).queue(function(reload){
            $(this).find('.fa-repeat').addClass('fa-rotate-right').removeClass('fa-rotate-360');
            reload()
        });
    });
    $('#replyMsg').on('click', function(){
        $('#reply-input-txt').slideDown()
        $('#reply-message textarea').css({
            'border-color': '#9ecaed',
            'box-shadow': '0 0 10px #9ecaed'
        }).focus()
    });

    $('.folder-labels').on('click', function(){

        $('#message_id').val('');
        var parent = '#'+$(this).attr('id');
        var folder = $(parent+' input').val()
        $("input[name='request_type']").val(folder)
        inboxFolderItems( parent )

    })
    $('#inbox-folders button , .mobile-compose').on('click', function(){
        $('#composer').slideToggle('slow');
        if($('#composer').attr('style') == "display: block;"){
            $('#sitemail input[type="text"]').focus();
        }
    })
    $('#picture').on('click', function(){
        $('#qqfile').trigger('click');

    });// active input field
    //take snap shot
    $('#web-cam').on('click', function(){
        $('#webCam').modal('toggle');
    });
    //opening folder sections
    $('#inbox-folders .folder-labels').on('click',function(){
        var thisID = $(this).attr('data-target');
        var target = $(this);

        //look for active label
        if ( ! target.hasClass('selected') ) {
            $(this).addClass('selected').siblings('.selected').removeClass('selected');
        }
        //add the delete all message button
        if (thisID == "#deleted-messages" ){
            $('#inbox-tools .delete').addClass('disableClick');
        }else{
            $('#inbox-tools .delete').removeClass('disableClick');
        }
        //add the archive messages button
        if (thisID == "#archived-messages" ){
            $('#inbox-tools .archive').addClass('disableClick');
        }else{
            $('#inbox-tools .archive').removeClass('disableClick');
        }

        //$(thisID).removeClass('hide').addClass('show');
        //$(thisID).siblings().not('#inbox-tools').removeClass('show').addClass('hide');
    });
    //checking unchecking messages functions
    $("#check-all").on('change', function(){

        if($(this).prop('checked')){
            $("input[name='request_type']").val('move_folder')
            $('.reloadBox').removeClass('unchecked').addClass('checked');
            $('.archive, .delete, .block').removeClass('checked').addClass('unchecked');

            $('input').prop('checked', true);
            var input = "";
            $('.msg-checkbox input:checkbox').each(function(){
                input += $(this).val()+",";
            });
            if($("#inbox-tools").siblings('#archived-messages').hasClass('show')){
                $('.bti').removeClass('checked');
            }
            if($("#trash-label").hasClass('selected')){
                $('.df').removeClass('checked');
            }
            if( !$('#view-message').hasClass('hide') ){
                var messageId = $('#rp_message_id').val()

                if( $('#session input[name="model_id[]"]').val() != messageId ){
                    $('#session').append('<input type="hidden" name="model_id[]" value="'+ messageId +'">');
                }

            }else{

                $('#inbox-messages input').each(function(){
                    var messageId = $(this).val()
                    $('#session').append('<input type="hidden" name="model_id[]" value="'+ messageId +'">');
                });
            }

        }
        else{
            $("input[name='request_type']").val('')
            $('input').prop('checked', false);
            $('.reloadBox').removeClass('checked').addClass('unchecked');
            $('.archive, .delete, .block').removeClass('unchecked').addClass('checked');

            if($("#inbox-tools").siblings('#archived-messages').hasClass('show')){
                $('.bti').addClass('checked');
            }
            if($("#trash-label").hasClass('selected')){
                $('.df').addClass('checked');
            }
            if( !$('#view-message').hasClass('hide') ){
                matchVal = $('#rp_message_id').val(); //Get model ID from check box
                $('#session input').each(function() {
                    if ( $(this).val() === matchVal ) {
                        $(this).remove();
                    }
                });
            }else{
                $('#inbox-messages input').each(function(){
                    var matchVal = $(this).val()
                    $('#session input').each(function() {
                        if ( $(this).val() === matchVal ) {
                            $(this).remove();
                        }
                    });
                });
            }

        }


    });

    $('#inbox-messages').on('click', '.from, .subject, .message-intr', function(){
        var id = $(this).parent().attr('id');
        var value = id.split("_")[1];
        $('#message_id').val(value);

        if( $('.from, .subject').hasClass('yes') ){
            $('#read').val('Read')
        }
        var section_id = '#view-message'
        var data = $('#session').serialize();
        var url = $('#session').attr('action');
        Members.getMessageById( data, url, section_id );
    })
    $('#message-txt').on('click', '.msg-collapse', function(){
        var clicks = $(this).data('clicks');
        if (clicks) {
            $(this).removeAttr('style')
        } else {
            $(this).css({
                'background-color': 'transparent',
                'height': 'initial',
                'border': 'none',
                'border-bottom': '1px solid #ccc',
                'border-top': '1px solid #ccc'
            })
        }
        $(this).data("clicks", !clicks);
    });
    $('#discardMsg').on('click', function(){
        $('#reply-input-txt').slideUp();
        $('#msg_reply').val('')
    });
    //open mobile menu
    if (window.matchMedia('(max-width: 767px)').matches){
        $('.mobile-menu-toggle').click(function() {
            var clicks = $(this).data('clicks');
            if (clicks) {
                $('#inbox-folders').addClass('animated slideOutLeft');
                $('#inbox-folders').delay(900).queue(function(removeClass){
                    $('#inbox-folders').removeClass('animated slideOutLeft');
                    $('#inbox-folders').toggleClass('hidden-menu-xs show-menu-xs');
                    removeClass()
                });

            } else {
                $('#inbox-folders').toggleClass('hidden-menu-xs show-menu-xs').addClass('animated slideInLeft');
                $('#inbox-folders').delay(900).queue(function(removeClass){
                    $('#inbox-folders').removeClass('animated slideInLeft');
                    removeClass();
                });
            }
            $(this).data("clicks", !clicks);
        });

        $('.folder-labels').on('click',function(){
            $('#nav-icon1').removeClass('open')
            $('#inbox-folders').addClass('animated slideOutLeft');
            $('#inbox-folders').delay(900).queue(function(removeClass){
                $('#inbox-folders').removeClass('animated slideOutLeft');
                $('#inbox-folders').toggleClass('hidden-menu-xs show-menu-xs');
                removeClass();
            });
        })

        $('.btn-user-tools').on('click', function(){
            var thisParent = $(this).parent().toggleClass('close open')
        })
        //function
        $('#nav-icon1').click(function(){
            $(this).addClass('closed')
            $(this).toggleClass('closed open');
        });


    }
    //send new message
    $("#sendNewMessage").on("click", function(){
        $("#post_type").val("new_message")
    })
    $('#sendNewMessage, #sendMsg').on('click', function(e){

        var data = $(this).closest('form').serialize();
        var url = $(this).closest('form').attr('action');


        Members.inboxAcctions(data, url)
        $(this).addClass('disabled')
        e.preventDefault()
    });

    $('#inbox-messages').on('change','.message-line input',function(){
        var section = $(this).closest('.section').attr('id');
        var section_Id = '#'+section;

        $(section_Id).find('input');
        if($(this).prop('checked')){
            $('.reloadBox').removeClass('unchecked').addClass('checked');
            $('.archive, .delete, .block').removeClass('checked');

            if( $('#trash-label').hasClass('folder-labels selected') ){
                $('.df').removeClass('checked').addClass('unchecked');

            }
            if(section_Id == '#archived-messages'){
                $('.bti').removeClass('checked');

            }
            var msgId = $(this).parents(':eq(2)').attr('id')

            if( $('#'+msgId+ ' input').val() != "" && $('#session input[name="model_id[]"]').val() != $(this).val() ) {
                $('#session').append('<input type="hidden" name="model_id[]" value="'+ $(this).val() +'">')
            }

        }else if($(section_Id).find('input').is(":checked") === false){
            $('.reloadBox').removeClass('checked').addClass('unchecked');
            $('.archive, .delete, .block').addClass('checked').removeClass('unchecked');
            // remove input from Form where value == $(this).val()
            matchVal = $(this).val(); //Get model ID from check box
            $('#session input').each(function() {
                if ( $(this).val() == matchVal ) {
                    $(this).remove();
                }
            });

            if( $('#trash-label').hasClass('folder-labels selected') ){
                $('.df').addClass('checked');

            }
            if(section_Id == '#archived-messages'){
                $('.bti').addClass('checked');

            }
        }
        $("input[name='request_type']").val('move_folder');


    });
    $('#addressbook-label').on('click', function(){
        $('#address_book').modal({
            toggle: true,
            backdrop: 'static',
            keyboard: false
        });
    });
    $('.delete, .archive, .block, .df').on('click', function(){
        if($(this).hasClass('delete') && $('input[name="model_id[]"]')){
            $('#message_id').val('');
        }
        var textVal = $(this).attr('data-text')
        $('#mailbox_action').val(textVal)
        var data = $('#session').serialize();
        var url = $('#session').attr('action');

        Members.inboxAcctions(data, url)
    });

    $('.ab_model_grid').on('click', function(){
        var modelInfo = new Array();
        $(this).find('span').each(function(){
            modelInfo.push($(this).attr('data-text'));
        });
        $('#to_model').val(modelInfo[0]);
        $('#model_id').val(modelInfo[1])
        $('#address_book').modal('toggle');
        if( $('#composer').attr('style') == "display: none;" ){
            $('#composer').slideToggle('slow');
        }
        $('.email-subject input').focus();
        $('.email-subject').css('border-bottom', 'solid 1px rgba(33, 150, 243, 0.62)')
    });
    $('#composer-btns .btn-delete').on('click', function(e){
        $('#model_id, #to_model, #mail_subject, #mail_message').val('')
        $('#composer').slideToggle('slow');
        e.preventDefault()
    });
    $('#model_list li').on('click', function(){
        var modelName = $(this).find('.model_name').text();
        var mdlId = $(this).find('.hidden').text();
        $('#to_model').val(modelName);
        $('#model_id').val(mdlId);
        $('#sitemail_address_filter').slideUp('slow')
        $('.email-subject input').focus()
        $('.email-subject').css('border-bottom', 'solid 1px rgba(33, 150, 243, 0.62)')

    })
    $('.email-subject').on('focus', function(){
        $(this).css('border-bottom', 'solid 1px rgba(33, 150, 243, 0.62)')
    })
    $('.email-subject').on('focusout', function(){
        $(this).removeAttr('style')
    })
    //get the file name from the input filed
    $('#qqfile').on('change', function(){
        $('#post_type').val('attachment')
        var fileName = $('#qqfile').val().replace(/C:\\fakepath\\/i, '');
        $('#message_attachment').empty()
        $('#message_attachment').append(
            '<div class="attachment_holder"><i class="fa fa-paperclip"></i> '+ fileName  +' &nbsp; <i class="fa fa-times disabled"></i>'
            +'<div class="progress" style="width:50%">'
            +'<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:0%">'
            +'</div>'
            +'</div>'
            +'</div>'
        ).delay(300).queue(function(start){
            $('.progress-bar').css('width', '50%');
            start()
        });
        var url = $('#new_message').attr('action');
        var id = '#new_message';
        Members.sendMemberAttachment(url, id);
    })
    //remove attachment from message
    $('#message_attachment').on('click', '.fa-times', function(){
        $('#qqfile').val('')
        $(this).parent().remove();
        $('#post_type').val('remove_attachment');

        var url = $('#new_message').attr('action');
        var id = '#new_message';
        Members.sendMemberAttachment(url, id);
    })


//notification settings
    $('.notifications-panel, #notifications').removeAttr('style');
    //alert notification stop confirmation
    $('.req_warning .btn-success').on('click', function(){
        var parent = $(this).attr('data-target');
        var newInput = new MakeInput('model_id','model_id', parent)
        $("input[name='request_type']").val('delete')
        var data = $('#notifications form').serialize();
        var url  = $('#notifications form').attr('action');
        Members.deleteModelAlerts('#'+parent);
        Members.submitSMS(data, url)
    });
    $('.req_warning .btn-danger').on('click', function(){
        var parent = $(this).attr('data-target');
        $(parent + ' .request').slideUp()
    });

    if( $('#member_cellphone').val() != "" ){
        $('#member_cellphone').attr('readonly', true)
    }

    $('#notifications button, #setup_model_notification button, button#verify_btn').on('click', function(){
        var btnVal = $(this).val();
        $("input[name='request_type']").val( btnVal );

        if($(this).attr('name') == 'sms_resend_verify_code'){
            var thisId = $('#member_id').val();
            var newInput = new MakeInput('new_code','new_code', thisId);
        }
        var data = $('#notifications form, #setup_model_notification form').serialize();
        var url  = $('#notifications form, #setup_model_notification form').attr('action')
        Members.submitSMS(data, url)
    });

    $('#clear_mobile').on('click', function(){
        $("#warning").slideDown( "slow")
    });

    $('#clear_yes').on('click', function(){
        $("#warning").slideUp( "slow")
        $("#warning2").fadeIn('slow');

        $('#clearPhone').val('clear');
        var data = $('#notifications form').serialize();
        var url  = $('#notifications form').attr('action')
        Members.clearMobilePhone(data, url)

    })

    $('#clear_no').on('click', function(){
        $("#warning").slideUp( "slow");

    });
    $('.stop-alerts').on('click', function(){
        var parent = $(this).parent().attr('id');
        $('#'+parent +' .request').slideDown();

    });
    //favorites
    $('#my-favorites .fa.fa-envelope, #videos-grid').on('click', '.fa.fa-envelope', function(e){
        var parentId = '#'+$(this).parents(':eq(1)').attr('id');
        var inputVal = $(parentId).find('input').val();
        var modelName = $.trim($(parentId).find('.fav-model-name').text())
        $('#model_id').val('MDL'+inputVal);
        $('#composer').slideToggle('slow')
        $('#to_model').prop('readonly', true).val( modelName );

    });
    $('#composer .fa-times').on('click', function(){
        if( $('#cover-all').length ){
            $('#cover-all').hide() // hide the back drop if it exist
        }
    });
    //subscriptions
    var subsciptionPass = $.trim( $('#pass').val() ); // grab the password
//	$('#pass').remove() // remove the password container
    $('#subscription_password').on('mouseover', function(){
        $(this).val(subsciptionPass).prop('readonly',false)
    }).on('mouseout',function(){
        $(this).val('********').prop('readonly',true)
    });
    //subscriptions open warning window
    $('#my-subscriptions .button-3, #my-subscriptions .btn-danger').on('click', function(){
        var id = '#'+$(this).closest('.grid-item').attr('id')
        $(id).find('.aler-slideup').slideToggle();
        $(id).find('.btn-success img').attr('src', wcc.wait_gif.src);
    })
    //subscriptions initiate Ajax call
    $('#my-subscriptions .btn-success').on('click', function(){
        var id = $(this).closest('.grid-item').attr('id');

        $('#'+id).find('.acttion-yes').hide()
        $('#'+id).find('.btn-success img').show()
        $('#membership_id').val(id)

        var data = $('#memberships').serialize();
        var url = $('#memberships').attr('action');

        Members.membershipSubscriptions(url, data)

    });
    $('#wcc3_modal').on('click','li.tip_am', function(){
        var tip_am = $(this).attr('data-tip');
        $('#wcc3_modal').find("input[name='request_type']").val('preset')
        $('#wcc3_modal').find('#tip_amount').val(tip_am);
        sendModelTip()
    })
    $('.modal-body').on('click', '.call-error', function(){
        console.log('click')
        if( $('.modal-body input').val() != ""){
            var custom_tip =  $('.modal-body input').val();

            if( /^\d+$/.test(custom_tip) ){
                $('#wcc3_modal').find("input[name='request_type']").val('custom')
                $('#wcc3_modal').find('#tip_amount').val(custom_tip);
                sendModelTip()
            }else{
                $('#wcc3_modal_messages').slideToggle().addClass('has-error').html('Please enter whole amounts between 1 and ' + Math.round(Members.balance, 0) + ' only!');
                $('#wcc3_modal_messages').delay(4000).queue(function(closeMsg){
                    $('#wcc3_modal_messages').slideToggle();
                    $('.modal-body input').focus()
                    closeMsg()
                })
            }
        }else{
            $('#wcc3_modal_messages').slideToggle().addClass('has-error').html('Please select tip amount or enter a custom tip.')
            $('#wcc3_modal_messages').delay(4000).queue(function(closeMsg){
                $('#wcc3_modal_messages').slideToggle();
                $('.modal-body input').focus()
                closeMsg()
            })
        }

    });
    //reset wcc3 modal
    var original_modal = $('#wcc3_modal').html()
    $("#wcc3_modal").on('hidden.bs.modal', function(){
        $(this).empty();
        $(this).html(original_modal)
        console.log('wcc_3 modal reseted');
    });
    //model rating handle the selected stars
    $('#wcc3_modal').on('mouseover', '#rate_model .fa', function(){
        $(this).toggleClass('fa-star-o fa-star selected');
        $(this).nextAll().removeClass('fa-star selected').addClass('fa-star-o');
        $(this).prevAll().addClass('fa-star selected').removeClass('fa-star-o')
        console.log('mouse over')
    });
    $('#credits_width, #memberships').on('click','.package-box', function(){
        console.log('click modal credits')
        if($('#credits_width .package-box, #memberships .package-box').hasClass('credit-package-selected')){
            $('#credits_width .package-box, #memberships .package-box').removeClass('credit-package-selected').addClass('credit-package');
        }
        if($('.package-box').hasClass('credit-package')){
            $('.package-box').find('.selected').text('SELECT');
            $(this).find('.selected').text('SELECTED');
            $(this).addClass('credit-package-selected');
            $(this).removeClass('credit-package');
        }else{
            $(this).removeClass('credit-package');
            $(this).addClass('credit-package-selected');
        }
        if($('#popular').hasClass('credit-package')){
            $('.credit-disclaimer').css('margin','0px 0 5px 0');
        }
        if($('#popular').hasClass('credit-package-selected')){
            $('.credit-disclaimer').css('margin','0px 0 30px 0');
        }

        var package_id = $(this).find('.package-id').text();
        $('.bp-package-id').val( package_id );

        $('.credit-free-tickets-msg, .membership-free-tickets-msg').addClass('hide').text('');
        var package_type = $(this).find('.package-type').text();
        var num_free_tickets = $(this).find('.num-free-tickets').text();
        var free_tickets_value = $(this).find('.free-tickets-value').text();

        // if( num_free_tickets != '0' ) {
        // 	$('.'+package_type+'-free-tickets-msg').text('Get ' + num_free_tickets + ' feature show tickets a month, a ' + free_tickets_value + ' value!');
        // }
    });


});
/////////////////////
// end of doc ready
////////////////////
$(document).on('mouseup', function(e){
    var container = $('#composer');
    if (container.attr('style') != 'display: none;'){
        if (!container.is(e.target) && container.has(e.target).length === 0 ){
            container.slideUp('slow');
            container.find('input').val('');
            if($('#cover-all').length){
                $('#cover-all').hide() // hide the back drop if it exist
            }
        }
    }
    var model_list = $('#sitemail_address_filter');
    if (model_list.attr('style') != 'display:none;'){
        //console.log('Model list do hide')
        if (!model_list.is(e.target) && model_list.has(e.target).length === 0 ){
            model_list.hide();

        }
    }
});

function sendModelTip(){
    var data = $('#wcc3_modal form').serialize();
    var url = $('#wcc3_modal form').attr('action');
    Members.doModelTips(url, data)

}
function inboxFolderItems( parent ){
    var data = $('#session').serialize();
    var url = $('#session').attr('action');
    Members.getFolder( data, url, parent )
}
function MakeInput(id,name,value){
    $('<input>').attr({
        type: 'hidden',
        id: this.id = id,
        name: this.name = name,
        value: this.value = value,
    }).appendTo('form:nth(0)')
}
//filter model names
function modelNameFilter() {
    // Declare variables
    var input, filter, ul, li, a, i;
    input = document.getElementById('to_model');
    filter = input.value.toUpperCase();
    ul = document.getElementById("model_list");
    li = ul.getElementsByTagName('li');
    $('#sitemail_address_filter').slideDown('slow')
    // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}

//function to remove isotop item with parent class 'grid'
function removeItem(id){
    var $grid = $('.grid');
    // remove clicked element
    $grid.isotope( 'remove', $(id) )
    // layout remaining item elements
        .isotope('layout');
}

function refreshGrid(){
    var $grid = $('.grid');
    $grid.isotope('layout');
}


/*
 * Add model to favorites
 * pass model id in this format "model_58398"
 */
function favoriteMe(id){
    var modelId = id.slice(7);
    $('#model_id, #wall_model_id').val(modelId)
    var url = $('#add-favorites').attr('action');
    var data = $('#add-favorites').serialize();
    Members.addFavoriteModel(url, data)
}

/*
 * Add model to favorites
 * pass model id in this format "model_58398"
 */
function unFavoriteMe(id){
    var modelId = id.slice(7);

    console.log( 'modelId : ' + modelId );

    $('#model_id, #wall_model_id').val(modelId)
    var url = $('#add-favorites').attr('action');
    var data = $('#add-favorites').serialize()

    console.log( 'url : ' + url );
    console.log( 'data : ' + data );

    Members.removeFavoriteModel(url, data)
}


var siteModals = {
    /*
    * Pop modal to become a fan
    */
    joinFanClubModal:function( modelId, modelName ){
        var title, body, footer;
        var modalTitle = "Fan Club";
        var heading = "<strong>Join my fan club and save!</strong><br>Start saving on your private shows with this model along with other great savings.";
        var imageSrc = "/images/wcc3/assets/fanclub_icon.png";
        var save10 = "Save 10% on private shows";
        var save20 = "Save 20% on purchased Videos";
        var save40 = "Save 40% on Voyeur shows";
        var disclaimer = "*Fan club memberships are $9.95 monthly per model";
        var btnText = "Join My Fan Club";

        title = modalTitle
        body =
            heading+
            '<hr><div class="col-sm-6"><img src="'+imageSrc+'"></div>'+
            '<div class="col-sm-6">'+
            '<i class="fa fa-check"></i> '+ save10+'<br>'+
            '<i class="fa fa-check"></i> '+ save20+'<br>'+
            '<i class="fa fa-check"></i> '+ save40+'<br>'+
            '</div><div class="clearfix"></div>'+
            '<div class="text-center"><button type="button" class="btn button-2 button-lg" onclick="addMeToFanClub('+$("#fan_club_form").attr("id")+');">'+btnText+'</button></div>'+
            '<div class="text-left">'+disclaimer+'</div>';

        footer = {enable:true, buttons:1 };
        $('#fan_club_form').append('<input type="hidden" name="request_type" value="add_fan">'+
            '<input type="hidden"  name="type" value="membership">'+
            '<input type="hidden"  name="subscribe" value="WccFanClub">'+
            '<input type="hidden"  name="model_name" value="'+ modelName +'">'+
            '<input type="hidden"  name="offer_name" value="'+modelName+'&quots fan club">'+
            '<input type="hidden" name="model_id" value="'+modelId+'">');
        wcc3_build_modal(title, body, footer);
    },
}

// is member in fan club
function isClubMember( ){
    var title, body, footer;
    title = "Fan Club";
    body = "<h2 class='text-center'>You already belong to <strong>"+ $('.modelName').text()+"'s</strong> fan club";
    footer = {enable:true, buttons:1 };
    wcc3_build_modal(title, body, footer);
}

//add member to models fan club
function addMeToFanClub(id){
    var modalId = '#'+$(id).attr('id')
    var data = $(modalId).serialize();
    var url = $(modalId).attr('action');
    Members.addMembertoFanclub(url, data)

}
// resend email confirmation
function resend_email_conf(){
    var data = $('#resend_email_conf').serialize();
    var url = $('#resend_email_conf').attr('action');

    Members.resendWelcomeEmail(data, url)
}
// open email conposer on other pages
var message = {
    newMessagetoModel:function(modelId, modelName){ // get for data ready
        if ( $('#add-favorites').find('#model_id').length ){
            $("#model_id").remove()
        }
        $('#model_id').val('MDL'+modelId);
        $('#composer').slideToggle('slow')
        $('#to_model').prop('readonly', true).val( modelName )
    },
    sendMessagToModel:function(){ // send message
        $("#post_type").val("new_message");
        console.log( $("#post_type").val() )
        var data = $("#new_message").serialize();
        var url = $("#new_message").attr('action');
        console.log(data, url)
        Members.inboxAcctions(data, url)
        $(this).addClass('disabled')
    },
    closeDialog:function(){
        $('#composer').slideToggle();
        $('#form_output').slideUp();
        $('#model_id, #to_model, #mail_subject, #mail_message').val('')
    }
}

var mobileAlerts = {
    addModelAlerts:function( modal_id ){
        var model_id = modal_id;
        $('#setup_model_notification').find("input[name='request_type']").val('mobile_notification');
        $('#setup_model_notification form').prepend('<input type="hidden" id="notification_model_id" name="notification_model_id" value="'+model_id+'"> ');
        var data = $('#setup_model_notification form').serialize();
        var url = $('#setup_model_notification form').attr('action');

        Members.addModelNotifications(data, url);

    },
    setupMobleNotifications:function(){
        $('#form_output').removeClass('inverted-color').addClass('alert alert-danger').slideToggle().text('You are not set up to receive mobile alerts, add your phone number and try again.');
        setTimeout(function(){
            $('#setup_model_notification').slideToggle()
        },1500);
        setTimeout(function(){
            $('#form_output').slideToggle().text('').addClass('inverted-color').removeClass('alert alert-danger')
        },5500)
    },
    closeDialog:function(){
        $('#setup_model_notification').slideToggle()
    }
}
function tipModel(modelId, modelName){
    var action = $('#wcc3_modal form').attr('action');
    var newAction = action.replace("notifications", "tips");
    $('#wcc3_modal form').attr('action', newAction);
    $('#wcc3_modal form').prepend('<input type="hidden" id="tip_to_model_id" name="tip_to_model_id" value="'+modelId+'" >');
    $('#wcc3_modal form').prepend('<input type="hidden" id="tip_amount" name="tip_amount" value="" >');

    var title, body, footer;
    title = "Send Tip To "+modelName;

    body  = '<div class="col-xs-12">Select Tip Amount</div>';
    body += '<div id="tip_amounts" class="col-xs-12">'+
        '<ul></ul>'+
        '</div>'+
        '<div class="clearfix"></div>';
    body += '<hr><div class="col-xs-12">Or, enter any custom tip you would like to send to '+ modelName +'</div>' +
        '<div class="clearfix"></div>'+
        '<hr ><div class="col-xs-3" style="line-height: 40px; padding:0;">Custom Tip:</div>'+
        '<div class="col-xs-6"><input type="text" id="custom_tip" class="form-control" name="cutom_tip" value="" ></div>'+
        '<div class="col-xs-3" style="padding:0;"><button type="button" class="btn button-2 call-error" style="width:100% !important">Send Tip</button></div>'+
        '<div class="clearfix"s></div>';
    $('#wcc3_modal .modal-dialog').addClass('sm_modal');

    footer = {enable:true, buttons:1 };

    wcc3_build_modal(title, body, footer);

    //small tips
    var element = document.getElementById("tip_amounts");
    var listElem = element.querySelector("ul");
    var tipAmount = [1,5,10,20,30,40];
    var p = '';
    for(var i = 0; i < tipAmount.length; i++){

        if( tipAmount[i] < Members.balance ) {

            listElem.innerHTML += '<li class="tip_am" data-tip="'+tipAmount[i]+'"><span><i class="fa '+(Members.is_auth_billing?'fa-money':'fa-database')+'"></i></span> '+(Members.is_auth_billing?'$':'')+tipAmount[i]+(Members.is_auth_billing?' Dollar':' Credit')+p + '</li>';
            p='s';
        }
    }
}
var model_raitings = {
    vote: function(model_id, model_name){

        //replace action url
        var action = $('#wcc3_modal form').attr('action');
        var newAction = action.replace("notifications", "favorites");
        $('#wcc3_modal form').attr('action', newAction)
        //
        console.log(newAction);
        var title, body, footer;

        title = "Vote for " + model_name;

        body = '<div class="text-center">Let <em><strong>'+model_name +'</strong></em> know you care!</div>'+
            '<div id="rate_model" class="text-center"></div>'+
            '<div id="stat_message" class="text-center"><button type="button" class="btn button-2" onclick="model_raitings.submit_vote('+model_id+')">Vote</button></div>'

        footer = {enable:true, buttons:1 };
        $('#wcc3_modal .modal-dialog').addClass('sm_modal');
        wcc3_build_modal(title, body, footer);
        for(var i = 0; i < 10; i++){
            $('#rate_model').append('<i class="fa fa-star-o"></i>');
        }
    },
    submit_vote:function(model_id){
        var vote_count = $('.fa-star.selected').length;

        if(vote_count){
            $('#rate_model').html('You Voted '+vote_count);
            $('#stat_message').html('<img src="'+ wcc.wait_gif.src+'" height="20" width="20">');
            $('#wcc3_modal form').find("input[name='request_type']").val('vote')
            $('#wcc3_modal form').prepend('<input type="hidden" name="model_id" value="'+model_id+'" >');
            $('#wcc3_modal form').prepend('<input type="hidden" name="vote_count" value="'+vote_count+'" >');
            var url = $('#wcc3_modal form').attr('action');
            var data = $('#wcc3_modal form').serialize();
            Members.doVote(url, data)
        }else{
            $('#stat_message').html('No vote detected please try again!');
            setTimeout(function(){
                $('#stat_message').html('<button type="button" class="btn button-2" onclick="model_raitings.submit_vote('+model_id+')">Vote</button>');
            },2200)
        }

    }
}
var member_registration = {
    change_email : function(){
        //replace action url
        var action = $('#wcc3_modal form').attr('action');
        var newAction = action.replace("notifications", "settings");
        $('#wcc3_modal form').attr('action', newAction)
        //
        $('#wcc3_modal form').find("input[name='request_type']").remove()
        var title, body, footer;

        title = "Change your email address";

        body = '<div class="col-xs-12">If you did not receive your confirmation email or the email address you supplied is incorrect please update your email address below. A new confirmation email will be sent after you update your email address.</div>'+
            '<div class="clearfix"></div><hr><div class="form-group"><div class="col-sm-4 no-right-padding">New Email Address: </div>'+
            '<div class="col-sm-8"><input type="email" class="form-control" name="new_email value="" autofocus></div><div class="clearfix"></div></div>'+
            '<div class="col-sm-4 no-right-padding">Account Password: </div>'+
            '<div class="col-sm-8"><input type="password" class="form-control" name="password value=""></div>'+
            '<div class="clearfix"></div><hr><div class="col-xs-12 res_stats"><button class="btn button-2 pull-right" onclick="member_registration.submit_email_change()">Submit</button></div>'+
            '<div class="clearfix"></div>';
        footer = {enable:false, };
        $('#wcc3_modal .modal-dialog').addClass('sm_modal');
        wcc3_build_modal(title, body, footer);
    },
    submit_email_change: function(){
        var newEmailAddress = $("#wcc3_modal .modal-body").find("input:nth(0)").val()
        var acc_pass = $.md5($.trim($("#wcc3_modal .modal-body").find("input:nth(1)").val() ) )
        if( newEmailAddress !="" || acc_pass !=""){
            $('#wcc3_modal form').prepend('<input type="hidden" name="setting" value="email" >');

            $('#wcc3_modal form').prepend('<input type="hidden" id="wcc3_modal_email" name="email" value="'+newEmailAddress+'" >');
            $('#wcc3_modal form').prepend('<input type="hidden" id="wcc3_modal_pass" name="password" value="'+acc_pass+'" >');

            var url = $('#wcc3_modal form').attr('action');
            var data = $('#wcc3_modal form').serialize();
            Members.nagChangeEmailAddress(data, url)
            console.log("email  ["+newEmailAddress+"]")
            console.log(url, data)
        }else{
            $('#wcc3_modal .res_stats').addClass('has-error').html('<div class="text-center" style="padding-top:10px;">Both fields are required!</div>');
            setTimeout(function(){
                $('#wcc3_modal .res_stats').removeClass('has-error').html('<button class="btn button-2 pull-right" onclick="member_registration.submit_email_change()">Submit</button>')
            }, 3000)
        }

    }
}
