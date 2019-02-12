<div id="myAccount" class="col-lg-12">
    <div class="box box-primary">
        <div class="box-body box-profile col-md-6 col-md-offset-3">
            <form id="frmAccountInfo" name="frmAccountInfo" action="../includes/mpepost.php" method="POST">
                <input type="hidden" name="show" value="mpe">
                <input type="hidden" name="mpeUser" value={$mpeUser}>
                <input type="hidden" name="Action" value="frmAccountInfo">
                <input type="hidden" id="mpeSessionName" name="mpeSessionName" value="{$smarty.session.session_name}">
                <input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.SessionID}">
                <input type="hidden" name="mpeAction" value={$mpeAction}>
                <input type="hidden" name="ModelID" value={$form.ModelID}>
                <input type="hidden" name="Username" value="{$modelInfo.Username}">
                <input type="hidden" name="Email" id="CurrentEmail" value="{$form.email}">
                <input type="hidden" name="Password" id="CurrentPass" value="{$form.password}">
                <div id="link">
                    <a href="{$photoURL}">
                        <img class="profile-user-img img-responsive" src="{$photoURL}" alt="User profile picture" style="width: 215px">
                    </a>
                </div>

                <h3 class="profile-username text-center">{$modelInfo.Username}</h3>
                <p class="text-muted text-center">{$modelInfo.StudioShortName}</p>

                <ul class="list-group list-group-unbordered">
                    <li id="email" class="list-group-item">
                        <b>e-mail address</b> <span class="pull-right">{$form.email} <i class="fa fa-pencil" style="cursor: pointer" title="Change email"></i></span>
                    </li>
                    <li class="list-group-item" style="display: none">
                    <span class="FieldEdit col-sm-6" style="padding-left: 0; padding-right: 5px">
                        <span class="EditLabelRequired" id="LabelEMail"><label for="Email">*New e-mail address:</label></span>
                        <input class="EditBox form-control" type="text" name="newEmail" id="newEmail" value="" placeholder="Type new email address" onfocus='this.value = "";'>
                    </span>
                        <span class="FieldEdit col-sm-6" style="padding-right: 0; padding-left: 5px">
                        <span class="EditLabelRequired" id="LabelConfirmEmail"><label for="ConfirmEmail">*Confirm e-mail address:</label></span>
                        <input class="EditBox form-control" type="text" name="ConfirmEmail" id="ConfirmEmail" value="" placeholder="confirm email" onchange="myprofile.checkInput(event)" onfocus='this.value = "";'>
                        <button type="button" class="btn button-1 pull-right"
                            style="margin-top: 10px;"
                            disabled
                            onclick="myprofile.ajaxCall('#frmAccountInfo',true,event)"> <i class="fa fa-save"></i> Update <i class="fa fa-refresh fa-spin" style="display: none"></i></button>
                    </span>

                        <span class="clearfix"></span>
                    </li>
                    <li id="password" class="list-group-item">
                        <b>Password</b>
                        <span class="pull-right">
                        <span id="mask">**********</span>
                        <span id="unmask" style="display: none">{$form.password}</span>
                        &nbsp; <i class="fa fa-eye show-pass" style="cursor: pointer" title="Show/Hide password"></i>
                        &nbsp; <i class="fa fa-pencil" style="cursor: pointer" title="Change password"></i>
                    </span>
                    </li>
                    <li class="list-group-item" style="display: none">
                    <span class="FieldEdit col-sm-6" style="padding-left: 0; padding-right: 5px">
                        <span class="EditLabelRequired" id="LabelPassword"><label for="Password">* Password:</label></span>
                        <input class="EditBox form-control" type="text" name="password" id="Password" placeholder="Type new password">
                    </span>
                        <span class="FieldEdit col-sm-6" style="padding-right: 0; padding-left: 0">
                        <span class="EditLabelRequired" id="LabelConfirmPassword"><label for="ConfirmPassword">* Confirm:</label></span>
                        <input class="EditBox form-control" type="text" name="ConfirmPassword" id="ConfirmPassword"  placeholder="confirm password" onchange="myprofile.checkPassword(event)">
                        <button type="button" class="btn button-1 pull-right"
                            style="margin-top: 10px;"
                            disabled
                            onclick="myprofile.ajaxCall('#frmAccountInfo',true, event)"> <i class="fa fa-save"></i> Update <i class="fa fa-refresh fa-spin" style="display: none"></i></button>
                    </span>
                        <div class="clearfix"></div>
                    </li>
                    <li class="list-group-item">
                        <b>Hide/Show Offline Profile:</b>  {if $form.visible_offline}Visible {else}Not Visible{/if} offline
                        <span class="pull-right">
                        {if $form.visible_offline}
                            <button type="button" class="btn button-2" onclick="toggleVisibility('{$form.ModelID}', true)"><i class="fa fa-eye-slash"></i>  Hide Offline Profile</button>
                        {else}
                            <button type="button" class="btn button-2" onclick="toggleVisibility('{$form.ModelID}', false)"><i class="fa fa-eye"></i> Show Offline Profile</button>
                        {/if}
                        </span>
                        <span class="clearfix"></span>
                    </li>
                </ul>
                <span class="pull-right">
                    {*<button type="button" id="btnAccountInfoSubmit" class="btn button-1" onclick="vAccountInfo() &amp;&amp; postFormData('frmAccountInfo', 'AccountInfoErrorMessage');">Submit</button>*}
                    {*<button type="reset" id="btnAccountInfoReset" class="btn button-2">Reset</button>*}
                </span>
            </form>
        </div>
        <!-- /.box-body -->
        <div class="clearfix"></div>
    </div>
</div>
<div class="clearfix"></div>

