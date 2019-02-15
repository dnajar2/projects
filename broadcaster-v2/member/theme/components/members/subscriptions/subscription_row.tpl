
{if $member_subscriptions}
{foreach from=$member_subscriptions key="subscription_key" item="subscription" name="member_subscriptions"}
	{assign var="login_template" value=$subscription->template_acctmngt_login}
    {include file="$_THEME/components/members/subscriptions/$login_template.tpl" subscription=$subscription}
{/foreach}
{/if}