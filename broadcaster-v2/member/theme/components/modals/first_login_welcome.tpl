<div id="termsModal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header navbar-inverse">
                <p class="modal-title primary-color">TERMS AND CONDITIONS</p>
            </div>
            <div class="modal-body">
                <div id="theTerm">
                    {include file="wcc3/components/terms.tpl"}
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="modal-footer">
                <form action="/members/" method="POST" enctype="application/x-www-form-urlencoded">
                    <input type="hidden" name="show" value="first_login_welcome">
                    <input type="hidden" name="terms" value="1">
                    <button id="agreeToTerms" type="submit" class="btn button-2 btn-sm disabled">I Agree</button>
                </form>
            </div>
        </div>
    </div>
</div>
