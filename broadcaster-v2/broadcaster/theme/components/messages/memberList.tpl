<div>
    <ul class="addressListNav" v-if="members.length > 0">
        <li class="heading">
            <span class="pull-left">Member</span>
            <span class="pull-right">Credits</span>
            <span class="clearfix"></span>
        </li>
        <li v-for="member in members">
            <a {if $mailShowAction neq "mailCompose"} :href="'/models/?show=mailCompose&compose=true&userID='+member.id+'&username='+member.username{if $smarty.request.from_model_swf}+'&from_model_swf=1'{/if}"{else} href="#" @click="setMailMember(member.id,member.username)"{/if}>
                <span class="pull-left">%%member.username%%</span>
                <span class="pull-right">%%member.balance%%</span>
            </a>
            <span class="clearfix"></span>
        </li>
    </ul>
    <p v-else v-show="showEl" class="text-center">There are no members online</p>
    <p v-show="!showEl" class="text-center">Loading <i class="fa fa-refresh fa-spin"></i></p>
</div>

