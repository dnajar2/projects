{include file="$_THEME/components/html_header.tpl" show=$show}

<body>

	{include file="$_THEME/components/header.tpl" show=$show}

{* $photo_url_key : the key name in the $models[#] array of the image to be displayed *}
{if !$photo_url_key}
	{assign var="photo_url_key" value="large_url"}
{/if}

<div class="page-header container-fluid"><!-- page header -->
	<div id="btn-search" class="pull-right">
		<button type="button" class="btn btn-danger">Advanced Search</button>
		<span id="carousel" class="wcc-ci-carousel active" data-toggle="tooltip" data-placement="top" title="" data-original-title="Carousel View">
			<span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span><span class="path5"></span><span class="path6"></span><span class="path7"></span><span class="path8"></span>
		</span>
		<i id="grid-toggle" class="fa fa-th" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Grid View"></i>
	</div>
	<div class="title hidden-xs">Model Gallery</div>
</div> <!-- end of page hader -->
<div id="carousel-gal" >
	<section class="section_light wow slideInLeft" data-wow-delay="1s">
		<div class="bullet_blue title">Most Popular</div>
		<div class="gallery-container-fluid">
			<div class="row-fluid" >
				<div class="col-sm-12 col-md-12" style="padding:0;">
					<div class="gallery-container-fluid gallery-profiles owl-carousel-width" style="padding:0">
						<div class="row-fluid ">
							<div class="owl-carousel"> <!-- start of carousel-->

								{*<!-- foreach most popular model -->*}
								{foreach name='popular_models' from=$popular_models key='k' item='model'}
								<a href="{$model.publicchat_url}">
								<div class="gallery-thumb-col item{if $model.has_sound} audio{/if}{if $model.hd} hd{/if}{if $model.p2p_validated} phone{/if}">
									<div class="gallery-model">
										<div class="gallery-thumb">
											<h2 class="{$model.dom.status_color}">
												<i class="fa {$model.dom.status_icon}"></i> {$model.dom.status_name}
												<div class="modelfeatures">
													{if $model.has_sound}
													<span><i class="fa fa-volume-up"></i></span>
													{/if}
													{if $model.hd}
													<span class="hd">HD</span>
													{/if}
													{if $model.p2p_validated}
													<span><i class="fa fa-mobile"></i></span>
													{/if}
												</div>
											</h2>
											<img src="{$model[$photo_url_key]}">
										</div>
									 	<div class="gallery-left">
											<h3 class="model-gallery-name">{$model.username}</h3>
											<div class="rating">
											{if $model.rating}
												{foreach from=$model.rating_full_stars item='k'}
												<i class="fa fa-star"></i>
												{/foreach}
												{if $model.rating_half_star}
												<i class="fa fa-star-half-full"></i>
												{/if}
											{/if}
											</div>
										</div>
									</div>
								</div>
								</a>
								{/foreach}
								{*<!-- /foreach most popular model -->*}

							</div><!-- end of carousel-->
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</section>

	<section class="section_cream wow slideInRight" data-wow-delay="1s">
		<div class="bullet_blue title">New Models</div>
		<div class="gallery-container-fluid">
			<div class="row-fluid" >
				<div class="col-sm-12 col-md-12" style="padding:0;">
					<div class="gallery-container-fluid gallery-profiles owl-carousel-width" style="padding:0">
						<div class="row-fluid ">
							<div class="owl-carousel"> <!-- start of carousel-->

								{*<!-- foreach new model -->*}
								{foreach name='new_models' from=$new_models key='k' item='model'}
								<a href="{$model.publicchat_url}">
								<div class="gallery-thumb-col item{if $model.has_sound} audio{/if}{if $model.hd} hd{/if}{if $model.p2p_validated} phone{/if}">
									<div class="gallery-model">
										<div class="gallery-thumb">
											<h2 class="{$model.dom.status_color}">
												<i class="fa {$model.dom.status_icon}"></i> {$model.dom.status_name}
												<div class="modelfeatures">
													{if $model.has_sound}
													<span><i class="fa fa-volume-up"></i></span>
													{/if}
													{if $model.hd}
													<span class="hd">HD</span>
													{/if}
													{if $model.p2p_validated}
													<span><i class="fa fa-mobile"></i></span>
													{/if}
												</div>
											</h2>
											<img src="{$model[$photo_url_key]}">
										</div>
										<div class="gallery-left">
											<h3 class="model-gallery-name">{$model.username}</h3>
											<div class="rating">
											{if $model.rating}
												{foreach from=$model.rating_full_stars item='k'}
												<i class="fa fa-star"></i>
												{/foreach}
												{if $model.rating_half_star}
												<i class="fa fa-star-half-full"></i>
												{/if}
											{/if}
											</div>
										</div>
									</div>
								</div>
								</a>
								{/foreach}
								{*<!-- /foreach new model -->*}

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</section>

	<section class="section_light wow slideInLeft" data-wow-delay="1s">
		<div class="bullet_blue title">Fan Favorites</div>
		<div class="gallery-container-fluid">
			<div class="row-fluid" >
				<div class="col-sm-12 col-md-12" style="padding:0;">
					<div class="gallery-container-fluid gallery-profiles owl-carousel-width" style="padding:0">
						<div class="row-fluid ">
							<div class="owl-carousel"> <!-- start of carousel-->

								{*<!-- foreach fan favorite model -->*}
								{foreach name='favorite_models' from=$favorite_models key='k' item='model'}
								<a href="{$model.publicchat_url}">
								<div class="gallery-thumb-col item{if $model.has_sound} audio{/if}{if $model.hd} hd{/if}{if $model.p2p_validated} phone{/if}">
									<div class="gallery-model">
										<div class="gallery-thumb">
											<h2 class="{$model.dom.status_color}">
												<i class="fa {$model.dom.status_icon}"></i> {$model.dom.status_name}
												<div class="modelfeatures">
													{if $model.has_sound}
													<span><i class="fa fa-volume-up"></i></span>
													{/if}
													{if $model.hd}
													<span class="hd">HD</span>
													{/if}
													{if $model.p2p_validated}
													<span><i class="fa fa-mobile"></i></span>
													{/if}
												</div>
											</h2>
											<img src="{$model[$photo_url_key]}">
										</div>
										<div class="gallery-left">
											<h3 class="model-gallery-name">{$model.username}</h3>
											<div class="rating">
											{if $model.rating}
												{foreach from=$model.rating_full_stars item='k'}
												<i class="fa fa-star"></i>
												{/foreach}
												{if $model.rating_half_star}
												<i class="fa fa-star-half-full"></i>
												{/if}
											{/if}
											</div>
										</div>
									</div>
								</div>
								</a>
								{/foreach}
								{*<!-- /foreach fan favorite model -->*}

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</section>
</div>
<div class="clearfix"></div>

<div id="grid-gal" class="hide">
	<section class="section_light wow slideInLeft" data-wow-delay="1s">
		<div class="bullet_blue title">Most Popular</div>
		<div class="gallery-container-fluid">
			<div class="row-fluid" >
				<div class="col-sm-12 col-md-12">
					<div class="gallery-container-fluid gallery-profiles">
						<div class="row-fluid ">
							<div class="grid"> <!-- start of carousel-->
								<div class="gutter-sizer"></div>

								{*<!-- foreach most popular model -->*}
								{foreach name='popular_models_grid' from=$popular_models key='k' item='model'}
								<a href="{$model.publicchat_url}">
								<div class="grid-item item{if $model.has_sound} audio{/if}{if $model.hd} hd{/if}{if $model.p2p_validated} phone{/if}">
									<div class="gallery-model">
										<div class="gallery-thumb">
											<h2 class="{$model.dom.status_color}">
												<i class="fa {$model.dom.status_icon}"></i> {$model.dom.status_name}
												<div class="modelfeatures">
													{if $model.has_sound}
													<span><i class="fa fa-volume-up"></i></span>
													{/if}
													{if $model.hd}
													<span class="hd">HD</span>
													{/if}
													{if $model.p2p_validated}
													<span><i class="fa fa-mobile"></i></span>
													{/if}
												</div>
											</h2>
											<img src="{$model[$photo_url_key]}">
										</div>
										<div class="gallery-left">
											<h3 class="model-gallery-name">{$model.username}</h3>
											<div class="rating">
											{if $model.rating}
												{foreach from=$model.rating_full_stars item='k'}
												<i class="fa fa-star"></i>
												{/foreach}
												{if $model.rating_half_star}
												<i class="fa fa-star-half-full"></i>
												{/if}
											{/if}
											</div>
										</div>
									</div>
								</div>
								</a>
								{/foreach}
								{*<!-- /foreach most popular model -->*}

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</section>

	<section class="section_cream wow slideInRight" data-wow-delay="1s">
		<div class="bullet_blue title">New Models</div>
		<div class="gallery-container-fluid">
			<div class="row-fluid" >
				<div class="col-sm-12 col-md-12">
					<div class="gallery-container-fluid gallery-profiles">
						<div class="row-fluid ">
							<div class="grid"> <!-- start of carousel-->
								<div class="gutter-sizer"></div>

								{*<!-- foreach most popular model -->*}
								{foreach name='new_models_grid' from=$new_models key='k' item='model'}
								<a href="{$model.publicchat_url}">
								<div class="grid-item item{if $model.has_sound} audio{/if}{if $model.hd} hd{/if}{if $model.p2p_validated} phone{/if}">
									<div class="gallery-model">
										<div class="gallery-thumb">
											<h2 class="{$model.dom.status_color}">
												<i class="fa {$model.dom.status_icon}"></i> {$model.dom.status_name}
												<div class="modelfeatures">
													{if $model.has_sound}
													<span><i class="fa fa-volume-up"></i></span>
													{/if}
													{if $model.hd}
													<span class="hd">HD</span>
													{/if}
													{if $model.p2p_validated}
													<span><i class="fa fa-mobile"></i></span>
													{/if}
												</div>
											</h2>
											<img src="{$model[$photo_url_key]}">
										</div>
										<div class="gallery-left">
											<h3 class="model-gallery-name">{$model.username}</h3>
											<div class="rating">
											{if $model.rating}
												{foreach from=$model.rating_full_stars item='k'}
												<i class="fa fa-star"></i>
												{/foreach}
												{if $model.rating_half_star}
												<i class="fa fa-star-half-full"></i>
												{/if}
											{/if}
											</div>
										</div>
									</div>
								</div>
								</a>
								{/foreach}
								{*<!-- foreach most popular model -->*}

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</section>

	<section class="section_creme wow slideInRight" data-wow-delay="1s">
		<div class="bullet_blue title">Fan Favorites</div>
		<div class="gallery-container-fluid">
			<div class="row-fluid">
					<div class="col-sm-12 col-md-12" style="padding:0;">
						<div class="gallery-container-fluid gallery-profiles">
							<div class="row-fluid ">
								<div class="grid"> <!-- start of carousel-->
								<div class="gutter-sizer"></div>

								{*<!-- foreach fan favorite model -->*}
								{foreach name='favorite_models_grid' from=$favorite_models key='k' item='model'}
								<a href="{$model.publicchat_url}">
								<div class="grid-item item{if $model.has_sound} audio{/if}{if $model.hd} hd{/if}{if $model.p2p_validated} phone{/if}">
									<div class="gallery-model">
										<div class="gallery-thumb">
											<h2 class="{$model.dom.status_color}">
												<i class="fa {$model.dom.status_icon}"></i> {$model.dom.status_name}
												<div class="modelfeatures">
													{if $model.has_sound}
													<span><i class="fa fa-volume-up"></i></span>
													{/if}
													{if $model.hd}
													<span class="hd">HD</span>
													{/if}
													{if $model.p2p_validated}
													<span><i class="fa fa-mobile"></i></span>
													{/if}
												</div>
											</h2>
											<img src="{$model[$photo_url_key]}">
										</div>
										<div class="gallery-left">
											<h3 class="model-gallery-name">{$model.username}</h3>
											<div class="rating">
											{if $model.rating}
												{foreach from=$model.rating_full_stars item='k'}
												<i class="fa fa-star"></i>
												{/foreach}
												{if $model.rating_half_star}
												<i class="fa fa-star-half-full"></i>
												{/if}
											{/if}
											</div>
										</div>
									</div>
								</div>
								</a>
								{/foreach}
								{*<!-- /foreach fan favorite model -->*}

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</section>
</div>
<div class="clearfix"></div>

<section id="alpha_search" class="advance_search animated fadeInUpBig hide" data-wow-duration="2s" data-wow-delay="2s" >
	<div id="go-back" class="pull-right"><i class="fa fa-arrow-left"></i> &nbsp; <a>GO BACK</a></div>
	<div class="text-uppercase advanced_search_header"> <i class="fa fa-list" aria-hidden="true"></i> Advanced Search</div>
	<div style="margin-left:-15px; margin-right:-15px; border-top: 1px solid #eee; padding-bottom: 40px; " id="alpha"  class="section_lite container-fluid">
		<div class="hidden-xs" style="padding-top:45px;  margin-bottom:-10px;">
			<div class="title bullet_blue">Alphabetical</div>
		</div>
		<div class="row-fluid">
			<div class="pagination pagination-info hidden-xs">
				<ul>
				{foreach from=$alpha_search_chars item='chars'}
					<li class="paginationFit{if $alpha_search_char == $chars.char} selected{/if}"><a href="{$chars.url}">{$chars.char}</a></li>
				{/foreach}
				</ul>
			</div>
			<div style="padding-top:15px; padding-left: 6px; padding-right: 5px; " class="hidden-lg hidden-md  hidden-sm"><!-- small screens -->
				<div style="padding-bottom:15px; margin-left:-10px;">
					<div class="title bullet_blue">Alphabetical</div>
				</div>
				<select name="Alphabet" id="Alphabet" onclick='location = this.value'>
				{foreach from=$alpha_search_chars item='chars'}
					<option value='{$chars.url}'{if $alpha_search_char == $chars.char} selected{/if}>{$chars.char}</option>
				{/foreach}
				</select>
			</div><!-- end of list for small screens -->
		</div>
		<div class="gallery-container-fluid">
			<div class="row-fluid" >
				<div class="col-sm-12 col-md-12" style="padding:0;">
					<div class="gallery-container-fluid gallery-profiles owl-carousel-width" style="padding:0">
						<div class="row-fluid ">
							<div class="owl-carousel"> <!-- start of carousel-->

								{*<!-- foreach alphabetical search or something model -->*}
								{foreach name='alpha_search_grid' from=$alpha_search key='k' item='model'}
								<a href="{$model.publicchat_url}">
								<div class="gallery-thumb-col item{if $model.has_sound} audio{/if}{if $model.hd} hd{/if}{if $model.p2p_validated} phone{/if}">
									<div class="gallery-model">
										<div class="gallery-thumb">
											<h2 class="{$model.dom.status_color}">
												<i class="fa {$model.dom.status_icon}"></i> {$model.dom.status_name}
												<div class="modelfeatures">
													{if $model.has_sound}
													<span><i class="fa fa-volume-up"></i></span>
													{/if}
													{if $model.hd}
													<span class="hd">HD</span>
													{/if}
													{if $model.p2p_validated}
													<span><i class="fa fa-mobile"></i></span>
													{/if}
												</div>
											</h2>
											<img src="{$model[$photo_url_key]}">
										</div>
									 	<div class="gallery-left">
											<h3 class="model-gallery-name">{$model.username}</h3>
											<div class="rating">
											{if $model.rating}
												{foreach from=$model.rating_full_stars item='k'}
												<i class="fa fa-star"></i>
												{/foreach}
												{if $model.rating_half_star}
												<i class="fa fa-star-half-full"></i>
												{/if}
											{/if}
											</div>
										</div>
									</div>
								</div>
								</a>
								{/foreach}
								{*<!-- /foreach alphabetical search or someting model -->*}

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>

	{if $no_models_found || $special_models}
	<section class="section_cream animated slideInLeft" data-wow-delay="1s">
		<div class="bullet_blue title">Your {$special_models_type} Results</div>
		<div class="gallery-container-fluid">
			<div class="row-fluid" >
				<div class="col-sm-12 col-md-12" style="padding:0;">
					<div class="gallery-container-fluid gallery-profiles owl-carousel-width" style="padding:0">
						<div class="row-fluid ">

								{if $no_models_found}
								<div style='padding:30px;'>No models found matching {$special_models_type} criteria</div>
								{else}
								<div class="owl-carousel"> <!-- start of carousel-->
								{foreach name='special_models' from=$special_models key='k' item='model'}
								<a href="{$model.publicchat_url}">
								<div class="gallery-thumb-col item{if $model.has_sound} audio{/if}{if $model.hd} hd{/if}{if $model.p2p_validated} phone{/if}">
									<div class="gallery-model">
										<div class="gallery-thumb">
											<h2 class="{$model.dom.status_color}">
												<i class="fa {$model.dom.status_icon}"></i> {$model.dom.status_name}
												<div class="modelfeatures">
													{if $model.has_sound}
													<span><i class="fa fa-volume-up"></i></span>
													{/if}
													{if $model.hd}
													<span class="hd">HD</span>
													{/if}
													{if $model.p2p_validated}
													<span><i class="fa fa-mobile"></i></span>
													{/if}
												</div>
											</h2>
											<img src="{$model[$photo_url_key]}">
										</div>
									 	<div class="gallery-left">
											<h3 class="model-gallery-name">{$model.username}</h3>
											<div class="rating">
											{if $model.rating}
												{foreach from=$model.rating_full_stars item='k'}
												<i class="fa fa-star"></i>
												{/foreach}
												{if $model.rating_half_star}
												<i class="fa fa-star-half-full"></i>
												{/if}
											{/if}
											</div>
										</div>
									</div>
								</div>
								</a>
								{/foreach}
								</div><!-- end of carousel-->
								{/if}

						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</section>
	{/if}

	<div class="container-fluid">
		<div class="row-fluid searchForm">
			<div id="filterForm">
				<div class="advance_title">
					<div class="title bullet_blue">FILTER</div>
				</div>
				<form name='gallery_filter' action="/?{'show=gallery'|base64_encode}" method="POST">
					<!-- sction one -->
					<div class="col-md-6">
						<div><!-- age selection -->
							<p>Age</p>
							<!-- for large screens -->
							<div id="age_section" class="formElm">
								{foreach from=$age_groups item='age_group'}
								<label class="checkbox-inline">
									<input type="checkbox" name="filter[age][]" id="age-{$age_group}" value="{$age_group}"{if (is_array($filter.age) && in_array($age_group, $filter.age))} checked{/if}><span></span> <div class='checkbox-inline-caption'>{$age_group}</div>
								</label>
								{/foreach}
							</div><!-- end of large screen -->
							<!-- //=================== // -->
						</div><!-- end of age selection -->
						<div><!-- start of Breast Size selection -->
							<p>Breast Size</p>
							<div id="breast_section" class="formElm">
								{foreach from=$breast_sizes key='breast_size_id' item='breast_size'}
								<label class="checkbox-inline">
									<input type="checkbox" name="filter[breasts][]" id="breats" value="{$breast_size}"{if (is_array($filter.breasts) && in_array($breast_size, $filter.breasts))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$breast_size}</div>
								</label>
								{/foreach}
							</div><!-- end of large screen -->
							<!-- //=================== // -->
						</div><!-- end of Breast Size selection -->
						<div><!-- start of hair color selection -->
							<p>Hair Color</p>
							<div id="hair_section" class="formElm">
								{foreach from=$hair_colors item='hair_color'}
								<label class="checkbox-inline">
									<input type="checkbox" name="filter[haircolor][]" id="haircolor" value="{$hair_color.HairColorID}"{if (is_array($filter.haircolor) && in_array($hair_color.HairColorID, $filter.haircolor))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$hair_color.HairColor}</div>
								</label>
								{/foreach}
							</div>
							<!-- end of large screen -->
							<!-- //=================== // -->
						</div><!-- end of hair color selection -->
						<div ><!-- start of Pubic Hair selection -->
							<p>Pubic Hair</p>
							<div id="pubic_section" class="formElm">
								{foreach from=$pubic_hairs item='pubic_hair'}
								<label class="checkbox-inline">
									<input type="checkbox" name="filter[pubichair][]" id="pubichair" value="{$pubic_hair.id}"{if (is_array($filter.pubichair) && in_array($pubic_hair.id, $filter.pubichair))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$pubic_hair.pubic_hair}</div>
								</label>
								{/foreach}
							</div><!-- end of large screen -->
							<!-- //=================== // -->
						</div><!-- end of Pubic Hair selection -->
					</div><!-- end of section one -->
					<!-- section two -->
					<div class="col-md-6">
						<div><!-- strta of body selection -->
							<p>Body Type</p>
							<div id="body_section" class="formElm">
								{foreach from=$body_types item=body_type}
								<label class="checkbox-inline">
									<input type="checkbox" name="filter[bodytypes][]" id="bodytype" value="{$body_type.id}"{if (is_array($filter.bodytypes) && in_array($body_type.id, $filter.bodytypes))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$body_type.type}</div>
								</label>
								{/foreach}
							</div><!-- end of large screen -->
							<!-- //=================== // -->
						</div><!-- end of body selection -->
						<div><!-- start of eye color selection -->
							<p>Eye Color</p>
							<div id="eye_section" class="formElm">
								{foreach from=$eye_colors item='eye_color'}
								<label class="checkbox-inline">
									<input type="checkbox" name="filter[eyecolor][]" id="eyecolor" value="{$eye_color.EyeColorID}"{if (is_array($filter.eyecolor) && in_array($eye_color.EyeColorID, $filter.eyecolor))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$eye_color.EyeColor}</div>
								</label>
								{/foreach}
							</div><!-- end of large screen -->
							<!-- //=================== // -->
						</div><!-- end of eye color selection -->
						<div><!-- start of Kinky Attributes selection -->
							<p>Kinky Attributes</p>
							<div class="formElm">
								{foreach from=$kinky_attributes item="attribute"}
								<label class="checkbox-inline">
									<input type="checkbox" name="filter[kinky_attributes][]" id="kinky-attributes{$attribute.id}" value="{$attribute.id}"{if (is_array($filter.kinky_attributes) && in_array($attribute.id, $filter.kinky_attributes))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$attribute.category_name}</div>
								</label>
								{/foreach}
							</div><!-- end of large screen -->
							<!-- //=================== // -->
						</div><!-- end of Kinky Attributes selection -->
						<div><!-- start of ethnicity selection -->
							<p>Ethnicity</p>
							<div id="ethnicity_section" class="formElm mobile">
								{foreach from=$ethnicities item='ethnicity'}
								<label class="checkbox-inline">
									<input type="checkbox" name="filter[ethnicity][]" id="ethnicity" value="{$ethnicity.EthnicityID}"{if (is_array($filter.ethnicity) && in_array($ethnicity.EthnicityID, $filter.ethnicity))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$ethnicity.Ethnicity}</div>
								</label>
								{/foreach}
							</div><!-- end of large screen -->
							<!-- //=================== // -->
						</div><!-- end of ethnicity selection -->
					</div><!-- end of section 2 -->
					<div class="col-md-6 col-md-offset-6">
						<div class="col-lg-6 col-md-6">
							<p>Height</p>
							<div class='col-sm-6'>
							<select name="filter[height][min]" id="height1">
								{foreach from=$heights item='height'}
								<option value='{$height.HeightID}'{if $filter.height.min == $height.HeightID} selected{/if}>{$height.Height}</option>
								{/foreach}
							</select>
							</div>
							<div class='col-sm-6'>
							<select name="filter[height][max]" id="height2">
								{foreach from=$heights item='height'}
								<option value='{$height.HeightID}'{if $filter.height.max == $height.HeightID} selected{/if}>{$height.Height}</option>
								{/foreach}
							</select>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<p>Weight</p>
							<div class='col-sm-6'>
							<select name="filter[weight][min]" id="weight1">
								{foreach from=$weights item='weight'}
								<option value='{$weight.WeightID}'{if $filter.weight.min == $weight.WeightID} selected{/if}>{$weight.Weight}</option>
								{/foreach}
							</select>
							</div>
							<div class='col-sm-6'>
							<select name="filter[weight][max]" id="weight2">
								{foreach from=$weights item='weight'}
								<option value='{$weight.WeightID}'{if $filter.weight.max == $weight.WeightID} selected{/if}>{$weight.Weight}</option>
								{/foreach}
							</select>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-md-offset-6"><br><br>
						<div class='col-md-6'>
							<button id="clearFilter" type="reset" class="btn btn-default btn-lg col-sm-12 col-xs-12">Clear Filter</button>
						</div>
						<div class='col-md-6'>
							<button id="applyFilter" type="submit" class="btn btn-info btn-lg col-sm-12 col-xs-12">Apply Filter</button>
						</div>
					</div>
				</form>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</section>

{include file="$_THEME/components/pagination.tpl"}

{include file="$_THEME/components/footer.tpl" show=$show}

<!-- Bootstrap core JavaScript
================================================== -->

<!-- Placed at the end of the document so the pages load faster -->
{literal}
<script type="text/javascript">
//<![CDATA[
$('.owl-carousel').owlCarousel({
	loop:false,
	margin:3,
	responsiveClass:true,
	responsive:{
		0:{
			items:1,
			nav:true,
			dots:false,
		},
		425:{
			items:2,
			nav:true,
			dots:false,
		},
		768:{
			items:3,
			nav:false,
			dots: true,
			slideBy:3,
			dotsEach:3,
		},
		1000:{
			items:5,
			dots: true,
			dotsEach: 5,
			dotData: true,
			lazyLoad: true,
			nav: true,
			slideBy:5,
		},
		1200:{
			items: 6,
			dots: true,
			dotsEach: 6,
			dotData: true,
			lazyLoad: true,
			nav: true,
			slideBy:6,
		}
	}
});

//advanced search
$("#btn-search button").click(function(){
	$('#alpha_search').removeClass('hide');
	$('#carousel-gal').addClass('hide');
	$('#grid-gal').addClass('hide');
});

$("#go-back").click(function(){
	$('#alpha_search').addClass('fadeOutDown');
	setTimeout(function () {
		$("#alpha_search").removeClass('fadeOutDown').addClass('hide');
		$('#carousel-gal').removeClass('hide');
	}, 1000);
});

$('#alpha_search').click(function(){
	$('.select2-container').removeClass('select2-dropdown-open')
	$('.select2-drop').css('display','none')
	$('#select2-drop-mask').css('display','none')
	$('.select2-drop').removeAttr('id')
	$('input').removeAttr('disabled')
});

$('#grid-toggle').on('click', function(){
	$('#carousel-gal').addClass('hide');
	$('#grid-gal').removeClass('hide');
	$('#carousel').removeClass('active');
	$('#grid-toggle').addClass('active');
	$('.grid').isotope({
		layoutMode: 'fitRows',
		itemSelector: '.grid-item',
		percentPosition: true,
		fitRows: {
			gutter: '.gutter-sizer'
		}
	});
});

$('#carousel').on('click', function(){
	$('#carousel-gal').removeClass('hide');
	$('#grid-gal').addClass('hide');
	$('#grid-toggle').removeClass('active');
	$('#carousel').addClass('active');
});

$('#grid-toggle').mouseover(function(){
	$(this).delay(10).queue(function(getId){
		var _tooltip = $('#grid-toggle').attr('aria-describedby');
		var _id = '#' + _tooltip;
		$(_id).find('.tooltip-arrow').css('top','86%');
		$(_id).css('top','-60px');
		getId();
	});
});

$('#clearFilter').on('click', function () {
	$('#filterForm').find('input[type=checkbox]').removeAttr('checked');
	$('#filterForm').find('select option').removeAttr('selected').trigger('change');
});

$(document).ready(function() {
	{/literal}
	{if $js_code}
	{foreach from=$js_code item='exec_js_code'}
	{$exec_js_code}
	{/foreach}
	{/if}
	{literal}
});
</script>
<style type="text/css">
i.fa.fa-search.top-search{
	display:none;
}
</style>
{/literal}

</body>

{include file="$_THEME/components/html_footer.tpl" show=$show}
