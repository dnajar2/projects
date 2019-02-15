<!-- credits modal -->
<div id="credits_modal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header navbar-inverse">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Get More Credits</h4>
            </div>
            <div class="modal-body">
                <!-- buy credits section -->
                <section class="animated fadeIn" data-wow-duration="2s" data-wow-delay="1s">
                    <div class="account-panel">
                        <div class="account-panel-title"><!-- title -->
                            <div class="pull-left account-section-name">
                                <i class="fa {if $auth_billing_new_card}fa-credit-card{else}fa-database{/if}"></i> &nbsp; {if $auth_billing_new_card} PLACE NEW CARD ONFILE {else}{$buttons.credits.caption}{/if}
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <!-- end of title -->
                        <div class="clearfix"></div>
                        <div id="form_output" class="bp-error-label text-center alert-danger{if $smarty.session.bp.errors.global} show{else} hide{/if}">
                            {$smarty.session.bp.errors.global}
                        </div>
                        <div class="clearfix"></div>

                        <div id="credit_packages_cells" class="{if $credit_packages || $membership_packages}show{else}hide{/if}">

                            <div id="credit_packages">
                                {if $buy_page}
                                {include file="$_THEME/components/members/desktop/buy_pages/$buy_page"}
                                {/if}
                            </div>

                        </div>

                        <div id="limit-reached"{if $credit_packages || $membership_packages} class="hide"{/if}>
                            <div class="col-sm-12">
                                <div class="account-panel-subtitle" style="color: maroon !important;padding-top:45px;">
                                    <h2>Daily Limit Reached</h2>
                                </div>
                                <div class="col-md-6 col-md-offset-3" style="padding-bottom:95px;">
                                    We are sorry for the inconvenience, you have reached your daily maximum for credit purchases.
                                    If you would like to increase your daily maximum or feel you are getting this message in error,
                                    please contact <a href="/?{'show=contact'|base64_encode}">support</a>.
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <div class="payment-method-disclam">
                            <div class="col-sm-12">
                                <div class="col-sm-4">
                                    <div class="col-sm-2">
                                        <i class="fa fa-shield" aria-hidden="true"></i>
                                    </div>
                                    <div class="col-sm-10">
                                        <strong>SAFE</strong>
                                        <div>
                                            No one has access to our database of information other that our trained staff. And we will not sell, trade or give your information out to third parties.
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="col-sm-2">
                                        <i class="fa fa-lock" aria-hidden="true"></i>
                                    </div>
                                    <div class="col-sm-10">
                                        <strong>SECURE</strong>
                                        <div>
                                            All transactions are encrypted from your computer directly to our credit card processing partner sites and are guaranteed 100% secure.
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="col-sm-2">
                                        <i class="fa fa-eye-slash" aria-hidden="true"></i>
                                    </div>
                                    <div class="col-sm-10">
                                        <strong>PRIVATE</strong>
                                        <div>
                                            To respect your privacy, all charges are billed discreetly. The website name or the content of the website will not be mentioned on your credit card statement.
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div><!-- end of panel -->
                    <div class="clearfix"></div>
                </section>
                <!-- end of get credits -->
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
{if $credit_packages || $membership_packages}
{literal}
    <script>
        {/literal}
        var addNewCard = {if $smarty.get.addNewCard}true{else}false{/if};
        {literal}
        var modalEvents = {

            close:function(modal){
                if(modal !== 'empty'){
                    $(modal).modal("toggle")
                }else {
                    var backDrop = $('.modal-backdrop')[1];
                    $(backDrop).hide()
                }

            }
        }
        $(document).ready(function(){
            $('#credit_packages_cells').removeAttr('style');
            if(addNewCard){
                console.log('add new card yes');
                $('#add-card').modal()
            }
        });
        //close credits modal on show receipt
        $('#purchase-receipt').on('show.bs.modal', function () {
            console.log('purchase-receipt ON')
            if($('#credits_modal').hasClass('in')){
                $('#credits_modal').modal('toggle')
                $('.modal-backdrop')
            }
        })
    </script>
{/literal}

    {include file="$_THEME/components/members/desktop/modals/$rebuy_modal"}

    {include file="$_THEME/components/members/desktop/modals/$credit_card_modal"}

    {include file="$_THEME/components/members/desktop/modals/purchase_receipt.tpl"}
{/if}
