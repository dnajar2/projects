<!-- flat UI search box added 8/12/2016 -->
<div class="falt-ui-search col-xs-9">
	<form name="searchForm" id="searchForm" action="/" method="POST">
		<input type="search" name="search[pattern]" id="searchNow" class="search-field" placeholder="Search ...">
		<i class="fa fa-search" onclick="formSubmit()"></i>
		{literal}
		<script>
		function formSubmit() {
			document.getElementById("searchForm").submit();
			return true;
		}
		</script>
		{/literal}
	</form>
</div>
<div id='adv_search_button' class="col-xs-3 site-filter" style="padding-right: 0; padding-left:10px;">
	<button id="advsearch" type="button" class="btn btn-xs btn-info button-2 adv-search" data-toggle="modal" data-backdrop="static" data-target="#searchFilter">Filter</button>
</div>
<div class="clearfix"></div>
