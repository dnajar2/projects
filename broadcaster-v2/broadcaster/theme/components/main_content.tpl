<section class="content primary-color {if $smarty.request.from_model_swf}margin-bottom-none{/if}" style="visibility: hidden;" >
    <!-- Info boxes -->
    <div class="row" style="position:relative;">

        {*Top modules*}
        {if "1" eq "2"}
            {include file="models/v2/components/card_modules.tpl"}
        {/if}
        {include file="models/v2/components/$show.tpl"}


    </div>
    <!-- /.row -->

    {include file="models/v2/components/modals/composer.tpl"}
</section>
<!-- W9 input -->
{if $w9input}
{include file="models/v2/components/modals/w9input.tpl"}
{/if}

