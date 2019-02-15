<!-- load_modals on page {$show} -->
{if $smarty.session.__logged_in}
    <!-- new messages modal -->
    {include file="wcc3/components/members/new_message.tpl"}

    {if $desktop_button neq 'notifications'}
        <!-- model notifications modal -->
        {include file="wcc3/components/members/setup_model_notification.tpl"}
    {/if}
    {if $show neq "register"}
        {include file="wcc3/components/modals/credits.tpl"}
        <!-- loading {$rebuy_modal} -->
        {if $show neq 'myaccount' && $desktop_button neq 'settings'}
            {include file="wcc3/components/members/desktop/modals/default_rebuy.tpl"}
        {/if}
    {/if}


    {literal}
        <script>
            {/literal}
            var addNewCard = {if $smarty.get.addNewCard}true{else}false{/if};
            {literal}
            $(document).ready(function(){
                $('#credit_packages_cells').removeAttr('style');
                if(addNewCard){
                    console.log('add new card yes');
                    $('#add-card').modal()
                }
            });
        </script>
    {/literal}
{else}
    {include file="wcc3/components/members/login.tpl"}
    {include file="wcc3/components/members/joinforms/default.tpl"}
{/if}

{include file="wcc3/components/support.tpl"}
{include file="wcc3/components/contactus.tpl"}
{if $show eq 'site_index'}
    {include file="wcc3/components/modals/search-filter.tpl"}
    {include file="wcc3/components/category_modals.tpl"}
{/if}
<!-- wcc3 dynamic modal -->
<div id="wcc3_modal" class="modal fadeIn" tabindex="-1" role="dialog">
    <form action="/api/members/notifications.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
        <input type="hidden"  name="member_id" value="{$smarty.session.userid}">
        <input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
        <input type="hidden"  name="request_type" value="">
    </form>
    <div class="modal-dialog" role="document">

        <div class="modal-content">
            <div class="modal-header navbar-inverse">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div id="wcc3_modal_messages" class="inverted-color text-center" style="display:none"></div>
            <div class="inverted-color modal-body">
                <h2>'h2' modal body title</h2>
                <p>'p' level element</p>
            </div>
            <div class="modal-footer">
                <div class="col-xs-6">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
                <div class="col-xs-6">
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

{if $smarty.session.first_login_terms}
{include file="wcc3/components/modals/first_login_welcome.tpl"}
{/if}
