<!DOCTYPE html>
<html lang="en">
{include file="models/v2/components/html_header.tpl"}
<body class="sidebar-mini skin-blue sidebar-collapse" style="visibility: hidden">
<!-- wrapper -->
<div class="wrapper" {if $smarty.request.from_model_swf}style="overflow: hidden"{/if}>
{include file="models/v2/components/header.tpl"}

{if $smarty.session.__logged_in}
    {if in_array($prl_section,array('accInfo','info','docRev','payment','w9','rates'))}
        {assign var='my_account' value=1}
    {else}
        {assign var='my_account' value=0}
    {/if}

    {if in_array($prl_section,array('about','tellUsAbout','ctBlocking','usBlocking','mailSettings'))}
        {assign var='my_profile' value=1}
    {else}
        {assign var='my_profile' value=0}
    {/if}

    {include file="models/v2/components/main_side_nav.tpl" my_profile=$my_profile my_account=$my_account}
    <div id="body" class="content-wrapper">
        <!-- Content Header (Page header) -->
        {include file="models/v2/components/content_header.tpl" my_profile=$my_profile my_account=$my_account}

        <!-- Main content -->
        {include file="models/v2/components/main_content.tpl" fromModal=true}
        <!-- /.content -->

        <!-- Control Sidebar -->
        {if 1 eq 2 and $smarty.const.__LOCAL_DEBUG and $show eq 'home'}
        {include file="models/v2/components/sidebar-controler.tpl"}
        {/if}

    </div>
{else}
    {* logged out page *}
    {include file="models/v2/components/login.tpl"}
    <script>
        {literal}
       $(function(){
           utils.appName = "model";
       });
        {/literal}

    </script>
{/if}

{include file="models/v2/components/footer.tpl"}
</div>
<!-- ./wrapper -->
{include file="models/v2/components/html_footer.tpl"}
</body>
</html>
