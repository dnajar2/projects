<!-- jQuery 3 -->
{if $smarty.session.__logged_in}
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>

<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
{if $smarty.const.__LOCAL_DEBUG}
<script type='text/javascript' src='https://unpkg.com/vue'></script>
{else}
<script src="{$CDN_SCHEMA}/js/models/v2/vue.min.js{$CacheBuster->getFileRevision()}"></script>
{/if}
<script src="{$CDN_SCHEMA}/js/models/v2/vm.js{$CacheBuster->getFileRevision()}"></script>

<!-- FastClick -->
<script src="{$CDN_SCHEMA}/js/models/v2/fastclick.js{$CacheBuster->getFileRevision()}"></script>
<!-- AdminLTE App -->
<script src="{$CDN_SCHEMA}/js/models/v2/adminlte.min.js{$CacheBuster->getFileRevision()}"></script>
    {if $show eq 'home'}
    <!-- Sparkline -->
    <script src="{$CDN_SCHEMA}/js/models/v2/jquery.sparkline.min.js{$CacheBuster->getFileRevision()}"></script>
    <!-- jvectormap  -->
    <script src="{$CDN_SCHEMA}/js/models/v2/jquery-jvectormap-1.2.2.min.js{$CacheBuster->getFileRevision()}"></script>
    <script src="{$CDN_SCHEMA}/js/models/v2/jquery-jvectormap-world-mill-en.js{$CacheBuster->getFileRevision()}"></script>
    <!-- SlimScroll -->
    <script src="{$CDN_SCHEMA}/js/models/v2/jquery.slimscroll.min.js{$CacheBuster->getFileRevision()}"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="{$CDN_SCHEMA}/js/models/v2/dashboard2.js{$CacheBuster->getFileRevision()}"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="{$CDN_SCHEMA}/js/models/v2/demo.js{$CacheBuster->getFileRevision()}"></script>
    <script src="{$CDN_SCHEMA}/js/models/v2/isotope.pkgd.min.js"></script>
    <script src="{$CDN_SCHEMA}/js/models/v2/packery-mode.pkgd.min.js"></script>
    {literal}
        <script>
            $(function(){
                setTimeout(function () {
                    $('#grid').isotope(
                        {
                            layoutMode: 'packery',
                            itemSelector: '.info-card'
                        }
                    );
                },300);

                $('.sidebar-toggle').on('click', function(){
                    setTimeout(function () {
                        $('#grid').isotope(
                            {
                                layoutMode: 'packery',
                                itemSelector: '.info-card'
                            }
                        );
                    },300)
                });
            });
        </script>
    {/literal}
    {/if}

    {if $show eq 'myphotos'}
        {*needed scripts to be loaded on this page only*}
        <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/blueimp-gallery.min.js{$CacheBuster->getFileRevision()}"></script>
        <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/models/v2/croppie.min.js{$CacheBuster->getFileRevision()}"></script>
        <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/models/v2/myphotos.js{$CacheBuster->getFileRevision()}"></script>
    {/if}
    {if $show eq "siteMail"}
        <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/models/v2/siteMail.js{$CacheBuster->getFileRevision()}"></script>
        <script>
            siteMail.show = '{$mailShowAction}';
            siteMail.activeTab = '{$activeTab}';
            {if $smarty.request.from_model_swf}
            siteMail.from_swf = true;
            window.resizeTo(680,600);
            let size = [680,600];
            {literal}
            $(function () {
                $(window).resize(function(){
                    window.resizeTo(size[0],size[1]);
                });

            });
            {/literal}
            {/if}
        </script>
    {/if}
    {if $show eq "myphones"}
    <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/models/v2/myphones.js{$CacheBuster->getFileRevision()}"></script>
    {/if}
    {if $smarty.get.section eq 'docRev'}
        <script src="{$CDN_SCHEMA}/js/models/v2/applicationStatus.js{$CacheBuster->getFileRevision()}"></script>
    {/if}
{/if}
<!-- Bootstrap 3.3.7 -->
<script src="{$CDN_SCHEMA}/js/models/v2/bootstrap.min.js{$CacheBuster->getFileRevision()}"></script>
<script src="{$CDN_SCHEMA}/js/models/v2/utils.js{$CacheBuster->getFileRevision()}"></script>
<script src="{$CDN_SCHEMA}/js/models/nude_freechat_notice.js{$CacheBuster->getFileRevision()}"></script>
{if $show eq "members_notes"}
    <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/models/v2/members_notes.js{$CacheBuster->getFileRevision()}"></script>
    <script>
        members_notes.saveUrl = '{$save_url}';
        members_notes.addUrl = '{$add_url}';

        {literal}

        $(function(){
            $('.newnote').on('click', function (e) {
                e.preventDefault();

                let el = e.target;

                if($(el).hasClass('edit')){

                    let dataSet = e.target.dataset, member_username = dataSet.username, member_id = dataSet.userid;
                    $('#newMemberNote .modal-title').text("Edit Member Note");
                    $('#editLabel').hide();
                    $('#saveBtn').prop('disabled',false);
                    let updateArgs = {
                        show:'members_notes',
                        edit:true,
                        member_username:member_username,
                        member_id:member_id,
                        models_id:wcc.model_id
                    };
                    members_notes.getNote(updateArgs)

                }else{
                    $('#newMemberNote .modal-title').text("Add New Member Note");
                    $('#editLabel').show();
                    $('#userID').val("-1");
                    $('#mailSubject').val("")
                }

                $('#newMemberNote').modal('show');
            });
            //create or edit note
            $('.member').on('click',function(e){
                let userID = e.target.dataset.memberid, username = e.target.dataset.username;
                console.log("userID: "+userID + " username: " + username);
                $('#username').val(username);
                $('#userID').val(userID);
                $('#memberTabs').toggle();

            });
            let keyCounter = 0;
            $('#mailSubject').on('keyup', function(e){
                keyCounter++;
                if(e.which === 8){
                    keyCounter = $('#mailSubject').val().length
                }
                $('#mailSubject_txt_count').text(keyCounter);
                if(keyCounter > 5){
                    $('#saveBtn').prop('disabled',false);
                }else{
                    $('#saveBtn').prop('disabled',true);
                }
            });
            $('textarea').on('change',function (e) {
                members_notes.stripHtmlTags(e);
            });
        });
        {/literal}
    </script>
{/if}
<script>
    //checking model's FCS status
    {if $smarty.session.__logged_in}
    let modelOnlineStatus = false;
        {if $modelInfo.fcs_status}
            modelOnlineStatus = true;
        {/if}
        {if $modelCantGoOnline}
        utils.modelCantGoOnline = true;
        {/if}
    {/if}
    {literal}

    // $ Doc ready!
    $(function(){
        //toggle W9 modal
        if(ui_alerts.w9input != null){
            $('#modal-w9').modal('toggle');
        }

        if(!wcc.is_logged_in){
            $(document).keypress(function(event){
                let keyPressed = event.which || event.keyCode;
                if(keyPressed === 13){
                    $('#login-button').submit()
                }
            });
        }else if(wcc.is_logged_in){
            //assign status to Vue instance
            utils.fcsStatusCheck(modelOnlineStatus);
        }
            //    enable visibility to main content
        setTimeout(function(){
            $('section.content').css('visibility','');
        },450);
        {/literal}

        utils.modelName = '{$modelInfo.Firstname}';
        utils.modelEmail = '{$modelInfo.Email}';
        utils.modelUsername = '{$modelInfo.Username}';
        {literal}
        //menu toggle cookie
        if(utils.getCookie('menuToggle') === 'yes'){
            $('body').addClass('sidebar-collapse')
        }else{
            $('body').removeClass('sidebar-collapse')
        }

        $(document).on('collapsed.pushMenu', function () {
            document.cookie = 'menuToggle=yes';
        })
        .on('expanded.pushMenu', function () {
            document.cookie = 'menuToggle=no';
        })
    });
    // end Doc ready
    {/literal}
    {* assignments *}
    {if $w9input}
        ui_alerts.w9input = {$w9input};
    {/if}

</script>
{literal}
<script language="JavaScript" type="text/javascript">
    let windowTimer;
    let popupWin = null,
        winurl = "/models/free_chat.php",
        width = 988,
        height = 650,
        x,
        y,
        param;
    function checkPopWindow() {
        if(popupWin.closed){
            utils.fcsStatusCheck(false);
            clearInterval(windowTimer);
            clearInterval(vmSideBar.TimeOut);
        }
    }
    function openChatPopUp( url ) {

            let w = this;

            if(w){
                w.onload = function() {
                    console.log('popupWin',this);
                };
            }


        try {
            /* temp force to model_unload for beta testing new chat */
            //winurl = "/models/model_unload.php";

            url = winurl;

            width = 988;
            height = 650;

            x = ( screen.width - width ) / 2;
            y = ( screen.height - height ) / 2;
            param = "left="+x+",top="+y+",width="+width+",height="+height+",scrollbars=yes,resizable=yes";
            popupWin = window.open( url,'modelspopup', param );
            windowTimer = setInterval(checkPopWindow, 1000);
            //window.open(url, '_blank');
            if(popupWin){
                popupWin.onload = function() {
                    console.log('popupWin', popupWin);
                };
            }
            window.onunload = function(){
                console.log('window was closed')
            };

            return false;
        }
        catch( e ) {
            window.location = url;
        }
    }

    function close_models_popup() {
        try {
            if ( popupWin ) {
                popupWin.close();
            }
            else {
                width = 988;
                height = 650;
                x = ( screen.width - width ) / 2;
                y = ( screen.height - height ) / 2;
                param = "left="+x+",top="+y+",width="+width+",height="+height+",scrollbars=yes,resizable=yes";
                popupWin = window.open( winurl,'modelspopup', param );
                popupWin.close();
            }
        }
        catch( e ) {
            console.log( "close_models_popup catch e " + e );
        }
    }

    var logObj = {},
        sessionUsername   = "{/literal}{$smarty.session.username}{literal}",
        modelID           = "{/literal}{$smarty.session.idSession}{literal}",
        sessionName       = "{/literal}{$smarty.session.session_name}{literal}",
        session_id        = "{/literal}{$smarty.session.SessionID}{literal}",
        lastaccessSession = "{/literal}{$smarty.session.lastaccessSession}{literal}",
        domain            = "{/literal}{$smarty.session.HTTP_HOST}{literal}",
        usertype          = "{/literal}{$smarty.session.usertype}{literal}",
        logged_in         = "{/literal}{$smarty.session.__logged_in}{literal}",
        useUnload         = false,
        handleUnload      = true;

    $( document ).ready(function() {
        try {
            if ( logged_in && modelID != null ) {
                console.log("modelID = " + modelID + " session id = " + session_id );
            }

            if ( $('a') != null ) {
                $('a').on('click', function() {
                    handleUnload = false;
                });
            }

            if ( $('form') != null ) {
                $('form').on('submit', function() {
                    handleUnload = false;
                });
            }
        }
        catch( e ) {
            console.log( "ready catch e = " + e );
        }
    });

    window.onbeforeunload = function (e) {

        try {
            /* added useUnload to disable this for now */
            if ( logged_in == 1 && usertype == "Models" && useUnload ) {
                if ( handleUnload ) {
                    /* Manually update models cookie */
                    document.cookie = "" + sessionName + " = ''; domain = " + domain + "; expires = 0; path = / ";
                    /* Close chat popup window */
                    close_models_popup();
                    /* Call to update models login data*/
                    try {
                        var c = {};
                        c.args = [ modelID , session_id, lastaccessSession ];
                        c.method = 'CamGirlService.doLogout';

                        {/literal}
                        {if $chef.general.env eq 'dev'}
                        /*
                         * if this creates a problem then we'll look at the new navigator function "navigator.sendBeacon"
                         */
                        {/if}
                        {literal}
                        $.ajax({
                            type: 'POST',
                            method: 'POST',
                            async: false,
                            dataType: "json",

                            url: '../flashservices/gateway2.php?m=doLogout&' + sessionName + '=' + session_id,
                            data: JSON.stringify(c),

                            //contentType: "application/json; charset=utf-8",
                            traditional: true,

                            contentType: 'text/plain',

                            xhrFields: {
                                withCredentials: false
                            },

                            headers: {
                                //
                            },

                            success: function( result ) {
                                console.log( "doLogout success result = " + result );
                            },

                            error: function() {
                                console.log( "doLogout catch e = " + e );
                            }
                        });
                    }
                    catch( e ) {
                        console.log( "doLogout catch e = " + e );
                    }
                }
            }
        }
        catch( e ) {
            console.log( "onbeforeunload catch e = " + e );
        }
    };

    function doLogout() {

    }
</script>
{/literal}

{if $show eq 'myearnings'}
    <!-- ChartJS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="{$CDN_SCHEMA}/js/stats.js{$CacheBuster->getFileRevision()}" type="text/javascript"></script>
    <script src="{$CDN_SCHEMA}/js/customer_returns_details.js{$CacheBuster->getFileRevision()}"></script>
    <script language="JavaScript" type="text/javascript" src="{$CDN_SCHEMA}/js/tooltips/wz_tooltip.js{$CacheBuster->getFileRevision()}"></script>
    <script language="JavaScript" type="text/javascript" src="{$CDN_SCHEMA}/js/models/v2/myearnings.js{$CacheBuster->getFileRevision()}"></script>
    {if $statsRunError}
        <script type="text/javascript">AlertStatsRunError( '{$stats_run_wait_time_min}' );</script>
    {/if}
    {if $formPosted && !$statsRunError}
        {literal}
            <script>
                $(function () {
                    console.log("formPosted");
                    utils.scrollToTop("#earningsRendered");
                });
            </script>
        {/literal}
    {/if}
{/if}

{if $show eq 'myprofile'}
    <script type="text/javascript">

        {if !$form.method || $methods_sorted[$form.method.id].signupStatus == $smarty.const.PAYOUT_METHOD_SIGNUP_STATUS_INACTIVE}
        var currentMethodID = {$paymentMethods[0].id};
        {else}
        var currentMethodID = {$form.method.id};
        {/if}
        {literal}
        let myprofile = {
            appVersion: "v2",
        };
        function ChangeMethod(ele) {
            // show the selected layer
            selectedMethodID = ele.value;
            ShowMethod(selectedMethodID);

            // hide the current layer
            HideMethod(currentMethodID);
            currentMethodID = selectedMethodID;
            writeMessage("", "PaymentInfoErrorMessage", vErrorColor);
        }

        function ShowMethod(methodID) {
            eleToShow = document.getElementById("layer_" + methodID);
            eleToShow.className = "show";
        }

        function HideMethod(methodID) {
            eleToShow = document.getElementById("layer_" + methodID);
            eleToShow.className = "hide";
        }

    </script>
        {/literal}

    {if $prl_section eq "accInfo"}
    <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/blueimp-gallery.min.js{$CacheBuster->getFileRevision()}"></script>
    {/if}
    <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/models/wcc_ajax.js{$CacheBuster->getFileRevision()}"></script>
    <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/mpe.js{$CacheBuster->getFileRevision()}"></script>
    <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/models/v2/myprofile.js{$CacheBuster->getFileRevision()}"></script>
    {if $prl_section eq "about"}
        <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/datepicker/datepicker.js{$CacheBuster->getFileRevision()}"></script>
        {literal}
            <script>
                let bd_holder = $('#Birthday');
                let age_holder =  $('#Age');


                bd_holder.on('change', function () {
                    calAge(bd_holder, age_holder)
                });

                function calAge(bd_holder, age_holder){
                    var dob = bd_holder.val();
                    dob = dob.split("-");
                    var year = Number(dob[0]);
                    var month = Number(dob[1]) - 1;
                    var day = Number(dob[2]);
                    var today = new Date();
                    var age = today.getFullYear() - year;
                    if (today.getMonth() < month || (today.getMonth() == month && today.getDate() < day)) {
                        age--;
                    }
                    age_holder.val(age);
                }
                calAge(bd_holder, age_holder)
            </script>
        {/literal}
    {/if}
    {if $prl_section eq "mailSettings"}
    {literal}
        <script>
            $(function(){
                $('input[type=checkbox]').on('change', function (e) {
                    if($(this).prop("checked")){
                        $(this).val('1')
                    }else{
                        $(this).val('0');
                        let formName = $(this).attr('name');
                        let newInput = `<input type="hidden" name="${formName}" value="0">`;
                        $('#frmMailSettings').prepend(newInput)
                    }
                })
            })
        </script>
    {/literal}
    {/if}
    {if $prl_section eq "ctBlocking"}
    {literal}
        <script>
            function check_blockregion_country_group() {
                var group_name = document.getElementById("id_regionblock_country_groups_list").value;

                if (group_name != "no") {
                    check_boxes = document.getElementsByTagName("input");

                    for (x = 0; x < check_boxes.length; x++) {
                        if (check_boxes[x].type == "checkbox") {
                            check_box_id_parts = check_boxes[x].id.split("_");

                            if (check_box_id_parts.length == 2 &&
                                check_box_id_parts[0].substring(0, 9) == "rbCountry" &&
                                check_box_id_parts[1] == group_name) {
                                check_boxes[x].checked = true;
                                ui_alerts.alerts_text.text('Eastern European Countries checked!, to clear this click the rest button, or click Update to submit your changes.');
                                ui_alerts.successAlert();
                                setTimeout(function(){
                                    $('#btnStateBlockingReset').focus()
                                },600)
                            }
                        }
                    }
                }
            }
        </script>
    {/literal}

    {/if}

    {literal}
    <script type="text/javascript">
        mpe_max_fetishes = {/literal}{$mpe_max_fetishes}{literal};
        mpe_max_favorite_positions = {/literal}{$mpe_max_favorite_positions}{literal};

        eleToShow = document.getElementById("layer_" + currentMethodID);
        if (eleToShow)
            ShowMethod(currentMethodID);

    {/literal}
        {if !$form.timezone}
            {literal}
            tzInfo = GetBrowserTimeZoneInfo();
            tzCheckStr = tzInfo["stdHourOffset"] + "," + tzInfo["dst"];

            for (i = 0; i < document.frmPersonalInfo.timezone.options.length; ++i) {
                // remove timezone location from value since we don't know that
                temp = document.frmPersonalInfo.timezone.options[i].value.split(",");
                tempCheck = temp[1] + "," + temp[2];

                if (tempCheck == tzCheckStr) {
                    document.frmPersonalInfo.timezone.selectedIndex = i;
                    break;
                }
            }
            {/literal}
        {/if}
    {literal}
    </script>
{/literal}
{/if}

{* referal program*}
{if $show eq "referralprogram"}
<script language="JavaScript" type="text/javascript">
    let links = new Array();
    links[0] = "{$referrer_profile_url}";
    links[1] = "{$referrer_joinpage_url}";

    {literal}

    function switch_tags( oSelect, id, banner_image )
    {
        var oTextArea = document.getElementById( "banner_"+id );
        var oTestArea = document.getElementById( "banner_test_"+id );
        var link = links[ oSelect.value ];

        oTextArea.value = "<a href='"+link+"'><img src='"+banner_image+"' border='0' /></a>";
        oTestArea.innerHTML = oTextArea.value;
        return ( true );
    }

    function changePeriodRadioBtn()
    {
        document.getElementById("periodOption_fromto").checked = false;
        document.getElementById("periodOption_period").checked = true;
    }

    function changeFromToRadioBtn()
    {
        document.getElementById("periodOption_fromto").checked = true;
        document.getElementById("periodOption_period").checked = false;
    }

    {/literal}
</script>
{/if}
{if $prl_section eq 'w9'}
    <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/php_namespaced_mini.js{$CacheBuster->getFileRevision()}"></script>
{literal}
    <script language="JavaScript" type="text/javascript">
        <!--
        $(function () {
            $P = new PHP_JS( window );
        });
        function setW9Type()
        {
            with ( document )
            {
                if ( getElementById( "idW9TypeIndividual" ).checked )
                {
                    setIndividual();
                    hideExemptCheckBox();
                }
                else if ( getElementById( "idW9TypeCorporation" ).checked )
                {
                    setNotIndividual();
                    showExemptCheckBox();
                }
                else if ( getElementById( "idW9TypePartnership" ).checked )
                {
                    setNotIndividual();
                    hideExemptCheckBox();
                }
                else if ( getElementById( "idW9TypeOther" ).checked )
                {
                    setNotIndividual();
                    showExemptCheckBox();
                }
            }
        }

        function
        submitW9()
        {
            if ( w9Validated() )
            {
                document.frmW9Input.submit();
            }
        }

        function resetW9()
        {
            document.frmW9Input.reset();
            setW9Type();
        }

        function adminSubmitW9()
        {
            if ( w9Validated() )
            {
                with ( document )
                {
                    var ajax = new oAjax( getElementById( "ajax_url" ).value, handleSubmit );
                    var params  = "&show="+getElementById( "post_to" ).value;
                    params += "&ajax_request=post";
                    params += "&mpeSessionName="+getElementById( "mpeSessionName" ).value;
                    params += "&Action="+getElementById( "Action" ).value;
                    params += "&w9[id]="+getElementById( "idW9Id" ).value;
                    params += "&w9[user_id]="+getElementById( "idW9User_Id" ).value;
                    params += "&w9[user_type]="+getElementById( "idW9User_Type" ).value;
                    params += "&w9[date_signed]="+getElementById( "idW9Date_Signed" ).value;
                    params += "&w9[ip_signed]="+getElementById( "idW9Ip_Signed" ).value;
                    params += "&w9[tin_type]="+getElementById( "idW9Tin_Type" ).value;
                    params += "&w9[tax_name]="+getElementById( "idTaxName" ).value;
                    params += "&w9[business_name]="+getElementById( "idBusiness_Name" ).value;
                    params += "&w9[address]="+getElementById( "idAddress" ).value;
                    params += "&w9[city]="+getElementById( "idCity" ).value;
                    params += "&w9[state_id]="+getElementById( "idState" ).value;
                    params += "&w9[zipcode]="+getElementById( "idZipcode" ).value;
                    params += "&w9[mail_address]="+getElementById( "idMailAddress" ).value;
                    params += "&w9[mail_city]="+getElementById( "idMailCity" ).value;
                    params += "&w9[mail_state_id]="+getElementById( "idMailState" ).value;
                    params += "&w9[mail_zipcode]="+getElementById( "idMailZipcode" ).value;

                    if ( getElementById( "idW9TypeIndividual" ).checked )
                    {
                        params += "&w9[w9_type]="+getElementById( "idW9TypeIndividual" ).value;
                    }
                    else if ( getElementById( "idW9TypeCorporation" ).checked )
                    {
                        params += "&w9[w9_type]="+getElementById( "idW9TypeCorporation" ).value;
                    }
                    else if ( getElementById( "idW9TypePartnership" ).checked )
                    {
                        params += "&w9[w9_type]="+getElementById( "idW9TypePartnership" ).value;
                    }
                    else if ( getElementById( "idW9TypeOther" ).checked )
                    {
                        params += "&w9[w9_type]="+getElementById( "idW9TypeOther" ).value;
                    }

                    params += "&w9[w9_type_other]="+getElementById( "idW9TypeOtherEdit" ).value;

                    if ( getElementById( "idIsLLC" ).checked )
                    {
                        params += "&w9[is_llc]="+getElementById( "idIsLLC" ).value;
                        params += "&w9[llc_classification]="+getElementById( "idLlcClassification" ).value;
                    }

                    params += "&w9[ein_1_tin]="+getElementById( "idEinTin1" ).value;
                    params += "&w9[ein_2_tin]="+getElementById( "idEinTin2" ).value;
                    params += "&w9[ssn_1_tin]="+getElementById( "idSsnTin1" ).value;
                    params += "&w9[ssn_2_tin]="+getElementById( "idSsnTin2" ).value;
                    params += "&w9[ssn_3_tin]="+getElementById( "idSsnTin3" ).value;

                    if ( getElementById( "idExemptBackupWithholding" ).checked )
                    {
                        params += "&w9[exempt_backup_withholding]="+getElementById( "idExemptBackupWithholding" ).value;
                    }

                    if ( getElementById( "idIrsNotifiedBackWithholding" ).checked )
                    {
                        params += "&w9[irs_notified_back_withholding]="+getElementById( "idIrsNotifiedBackWithholding" ).value;
                    }

                    params += "&w9[signature]="+getElementById( "idSignature" ).value;

                    try
                    {
                        params += "&w9[status]="+getElementById( "idStatus" ).value;
                    }
                    catch (e)
                    {
                        params += "&w9[status]=pending";
                    }

                    ajax.update( params, "POST"  );
                }
            }
        }

        function deleteW9( username )
        {
            if ( confirm( "Are you sure you want to delete " + username + "'s W9?\nThis will permanently remove it ..." ) )
            {
                with ( document )
                {
                    var ajax = new oAjax( getElementById( "ajax_url" ).value, handleSubmit );
                    var params  = "&show="+getElementById( "post_to" ).value;
                    params += "&ajax_request=delete";
                    params += "&w9_id="+getElementById( "idW9Id" ).value;
                    params += "&w9_user_id="+getElementById( "idW9User_Id" ).value;
                    params += "&w9_user_type="+getElementById( "idW9User_Type" ).value;
                    params += "&mpeSessionName="+getElementById( "mpeSessionName" ).value;

                    ajax.update( params, "POST" );
                }
            }
        }

        function handleSubmit( r, s, p )
        {
            if ( s == 200 )
            {
                if ( r == "success" )
                {
                    if ( window.opener == null )
                    {
                        document.getElementById( "ajax_response" ).innerHTML = "<span style=\"color: #008000;\">The W9 Form was successfully posted!</span>";

                        if ( document.getElementById( "idW9Id" ).value == -1 )
                        {
                            document.getElementById( "ajax_response" ).innerHTML = "<span style=\"color: #008000;\">The W9 Form was successfully posted! Reloading in 5 seconds...</span>";
                            setTimeout( "window.location.reload();", 5000 );
                        }
                    }
                    else
                    {
                        window.opener.location.reload();
                        window.close();
                    }
                }
                else
                {
                    if ( document.getElementById( "ajax_response" ) )
                    {
                        document.getElementById( "ajax_response" ).innerHTML = "<span style=\"color: #8B0000;\">There was an error posting the W9 Form!</span>";
                    }
                    else
                    {
                        alert( "There was an error posting the changes to the W9" );
                    }
                }
            }
        }

        function closeW9()
        {
            window.close();
        }

        function viewW9( user_id, user_type )
        {
            var url = {/literal}"{$viewW9Url}";{literal}
            OpenWindow( url + "?" + "show=w9manager&Action=frmW9Input&ajax_request=view&w9_user_id="+user_id+"&w9_user_type="+user_type+"&mpeSessionName="+document.getElementById("mpeSessionName").value, "viewW9", 1024, 768, true );

            return (false);
        }

        function w9Validated()
        {
            var w9_is_valid = true;

            with ( document )
            {
                try
                {
                    if ( getElementById( "idTaxName" ).value == "" )
                    {
                        getElementById( "idTaxName" ).focus();
                        alert( "Name can not be empty or blank!" );
                        w9_is_valid = false;
                    }
                    else if ( getElementById( "idAddress" ).value == "" )
                    {
                        getElementById( "idAddress" ).focus();
                        alert( "Permanent Residence can not be empty or blank!" );
                        w9_is_valid = false;
                    }
                    else if ( hasPOBox( getElementById( "idAddress" ).value ) )
                    {
                        getElementById( "idAddress" ).focus();
                        getElementById( "idAddress" ).select();
                        alert( "Please do not use a P.O. Box for your Permanent Residence" );
                        w9_is_valid = false;
                    }
                    else if ( hasInCareOf( getElementById( "idAddress" ).value ) )
                    {
                        getElementById( "idAddress" ).focus();
                        getElementById( "idAddress" ).select();
                        alert( "Please do not use \"in-care-of\" for your Permanent Residence" );
                        w9_is_valid = false;
                    }
                    else if ( getElementById( "idCity" ).value == "" )
                    {
                        getElementById( "idCity" ).focus();
                        getElementById( "idCity" ).select();
                        alert( "City or Town can not be empty or blank!" );
                        w9_is_valid = false;
                    }
                    else if ( getElementById( "idState" ).value == "-1" )
                    {
                        getElementById( "idState" ).focus();
                        alert( "Please select a state!" );
                        w9_is_valid = false;
                    }
                    else if ( !validateZipcode( getElementById( "idZipcode" ).value ) )
                    {
                        getElementById( "idZipcode" ).focus();
                        getElementById( "idZipcode" ).select();
                        alert( "The zip code does not appear to be valid!" );
                        w9_is_valid = false;
                    }

                    if ( w9_is_valid && getElementById( "idMailAddress" ).value != "" )
                    {
                        if ( hasPOBox( getElementById( "idMailAddress" ).value ) )
                        {
                            getElementById( "idMailAddress" ).focus();
                            getElementById( "idMailAddress" ).select();
                            alert( "Please do not use a P.O. Box for your mailing address!" );
                            w9_is_valid = false;
                        }
                        else if ( hasInCareOf( getElementById( "idMailAddress" ).value ) )
                        {
                            getElementById( "idMailAddress" ).focus();
                            getElementById( "idMailAddress" ).select();
                            alert( "Please do not use \"in-care-of\" for your mailing address!" );
                            w9_is_valid = false;
                        }
                        else if ( getElementById( "idMailCity" ).value == "" )
                        {
                            getElementById( "idMailCity" ).focus();
                            getElementById( "idMailCity" ).select();
                            alert( "Mailing address city or town can not be empty or blank!" );
                            w9_is_valid = false;
                        }
                        else if ( getElementById( "idMailState" ).value == "-1" )
                        {
                            getElementById( "idMailState" ).focus();
                            alert( "Please select a mailing address state!" );
                            w9_is_valid = false;
                        }
                        else if ( !validateZipcode( getElementById( "idMailZipcode" ).value ) )
                        {
                            getElementById( "idMailZipcode" ).focus();
                            getElementById( "idMailZipcode" ).select();
                            alert( "The mailing address zip code does not appear to be valid!" );
                            w9_is_valid = false;
                        }
                    }

                    if ( w9_is_valid && getElementById( "idW9TypeIndividual" ).checked )
                    {
                        if ( getElementById( "idSsnTin1" ).value == "" )
                        {
                            getElementById( "idSsnTin1" ).focus();
                            alert( "Please complete the social security number (SSN)!" );
                            w9_is_valid = false;
                        }
                        else if ( !is_digits( getElementById( "idSsnTin1" ).value, 3 ) )
                        {
                            getElementById( "idSsnTin1" ).focus();
                            getElementById( "idSsnTin1" ).select();
                            alert( "The social security number (SSN) you've entered does not appear to be valid" );
                            w9_is_valid = false;
                        }
                        else if ( getElementById( "idSsnTin2" ).value == "" )
                        {
                            getElementById( "idSsnTin2" ).focus();
                            alert( "Please complete the social security number (SSN)!" );
                            w9_is_valid = false;
                        }
                        else if ( !is_digits( getElementById( "idSsnTin2" ).value, 2 ) )
                        {
                            getElementById( "idSsnTin2" ).focus();
                            getElementById( "idSsnTin2" ).select();
                            alert( "The social security number (SSN) you've entered does not appear to be valid" );
                            w9_is_valid = false;
                        }
                        else if ( getElementById( "idSsnTin3" ).value == "" )
                        {
                            getElementById( "idSsnTin3" ).focus();
                            alert( "Please complete the social security number (SSN)!" );
                            w9_is_valid = false;
                        }
                        else if ( !is_digits( getElementById( "idSsnTin3" ).value, 4 ) )
                        {
                            getElementById( "idSsnTin3" ).focus();
                            getElementById( "idSsnTin3" ).select();
                            alert( "The social security number (SSN) you've entered does not appear to be valid" );
                            w9_is_valid = false;
                        }
                    }
                    else if ( w9_is_valid && getElementById( "idW9TypeCorporation" ).checked || getElementById( "idW9TypePartnership" ).checked || getElementById( "idW9TypeOther" ).checked )
                    {
                        if ( getElementById( "idW9TypeOther" ).checked && getElementById( "idW9TypeOtherEdit" ).value == "" )
                        {
                            getElementById( "idW9TypeOtherEdit" ).focus();
                            alert( "Please specify a reason for Other!" );
                            w9_is_valid = false;
                        }
                        else if ( getElementById( "idIsLLC" ).checked && getElementById( "idLlcClassification" ).value == "" )
                        {
                            getElementById( "idLlcClassification" ).focus();
                            alert( "Please indicate the classification of the Limited Liability Corporation (LLC)!" );
                            w9_is_valid = false;
                        }
                        else if ( getElementById( "idIsLLC" ).checked && getElementById( "idLlcClassification" ).value != "D" && getElementById( "idLlcClassification" ).value != "C" && getElementById( "idLlcClassification" ).value != "P" )
                        {
                            getElementById( "idLlcClassification" ).focus();
                            getElementById( "idLlcClassification" ).select();
                            alert( "In-correct LLC Classification; please only enter \"D\", \"C\", or \"P\"" );
                            w9_is_valid = false;
                        }
                        else if ( getElementById( "idEinTin1" ).value == "" )
                        {
                            getElementById( "idEinTin1" ).focus();
                            alert( "Please complete the employer identification number (EIN)!" );
                            w9_is_valid = false;
                        }
                        else if (!is_digits( getElementById( "idEinTin1" ).value, 2 ) )
                        {
                            getElementById( "idEinTin1" ).focus();
                            getElementById( "idEinTin1" ).select();
                            alert( "The employer identification number (EIN) you've entered does not appear to be valid" );
                            w9_is_valid = false;
                        }
                        else if ( getElementById( "idEinTin2" ).value == "" )
                        {
                            getElementById( "idEinTin2" ).focus();
                            alert( "Please complete the employer identification number (EIN)!" );
                            w9_is_valid = false;
                        }
                        else if (!is_digits( getElementById( "idEinTin2" ).value, 7 ) )
                        {
                            getElementById( "idEinTin2" ).focus();
                            getElementById( "idEinTin2" ).select();
                            alert( "The employer identification number (EIN) you've entered does not appear to be valid" );
                            w9_is_valid = false;
                        }
                    }

                    if ( w9_is_valid == true )
                    {
                        if ( getElementById( "idSignature" ).value == "" || getElementById( "idSignature" ).value.length == 0 )
                        {
                            getElementById( "idSignature" ).focus();
                            alert( "Please sign the form by typing your name!" );
                            w9_is_valid = false;
                        }
                    }
                }
                catch (e)
                {
                    alert( e );
                }
            }

            return ( w9_is_valid );
        }

        function hasPOBox( value )
        {
            value = $P.strtolower( $P.str_replace( " ", "", $P.str_replace( ".", "", value ) ) );

            return ( $P.strpos( value, "pobox" ) !== false );
        }

        function hasInCareOf( value )
        {
            value = $P.strtolower( $P.str_replace( " ", "", $P.str_replace( "-", "", $P.str_replace( ".", "", value ) ) ) );

            return ( $P.strpos( value, "incareof" ) !== false );
        }

        function validateZipcode( value )
        {
            return ( value.match(/\b[0-9]{5}(?:-[0-9]{4})?\b/) );
        }

        function is_digits( value, num_digits )
        {
            var digits = new RegExp( '\\b[0-9]{'+num_digits+'}\\b', "g" );
            return digits.test( value );
        }

        function setIndividual()
        {
            with ( document )
            {
                getElementById( "idExemptBackupWithholding" ).checked = false;
                getElementById( "exempt_backup_holding_check" ).className = "hidden";
                getElementById( "employer_identification_number" ).className = "hidden";
                getElementById( "individual_ssn" ).className = "visible";
            }
        }

        function setNotIndividual()
        {
            with ( document )
            {
                getElementById( "exempt_backup_holding_check" ).className = "visible";
                getElementById( "employer_identification_number" ).className = "visible";
                getElementById( "individual_ssn" ).className = "hidden";
            }
        }

        function showExemptCheckBox()
        {
            document.getElementById( "exempt_from_backup_withholding" ).className = "visible";
        }

        function hideExemptCheckBox()
        {
            document.getElementById( "exempt_from_backup_withholding" ).className = "hidden";
        }

        -->
    </script>

{/literal}
    <script language="JavaScript" type="text/javascript">
        <!--
        setW9Type();
        {if !$admin_edit && $w9_submission_success == null}
        document.getElementById( "idTaxName" ).focus();
        {/if}
        -->
    </script>
{/if}

{if $whitelabel_settings.translate}
    <script type="text/javascript">
        {literal}
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                    pageLanguage: 'en',
                    layout: google.translate.TranslateElement.InlineLayout.SIMPLE
                },
                'google_translate_element');
        };
        {/literal}
    </script>
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
{/if}
{if $whitelabel_settings.live_chat_support}
<!-- BEGIN JIVOSITE CODE  {literal}-->
<script type="text/javascript">
{/literal}
    {if $modelInfo.Username}
    {literal}
    function jivo_onLoadCallback() {
        jivo_api.setContactInfo({
            'name': utils.modelUsername,
            'email': utils.modelEmail,
            'phone': ''
        });
        jivo_api.setCustomData([
            {
                'title': 'Contact',
                'content': utils.modelName,
                {/literal}
                'link': 'https://admin.webcamadmin.com/admin/contacts.php?quick_filter={$modelInfo.Username}'
                {literal}
            },
            {
                {/literal}
                'title': 'Profile',
                'content': '{$modelInfo.Username}',
                'link': 'https://{$whitelabel_data.domain}index.php?show=mpe&Action=ModelID&mpeUser=1&mpeAction=1&ModelID={$modelInfo.ModelID}'
                {literal}
            }
        ]);
    }
    {/literal}
    {/if}
    {literal}
    (function(){
            var widget_id = 'FU3Hf2aVq2';
            var d=document;
            var w=window;
            function l(){
                var s = document.createElement('script');
                s.type = 'text/javascript'; s.async = true;
                s.src = '//code.jivosite.com/script/widget/'+widget_id;
                var ss = document.getElementsByTagName('script')[0];
                ss.parentNode.insertBefore(s, ss);
            }
            if(d.readyState=='complete'){
                l();
            }else{
                if(w.attachEvent){w.attachEvent('onload',l);
                }else{
                    w.addEventListener('load',l,false);
                }
            }
        }
    )();
    {/literal}
</script>
    {literal}
<!-- {/literal} END JIVOSITE CODE -->
{/if}
