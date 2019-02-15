<!-- joinModal -->
<div class="modal animated fadeIn" id="searchFilter" tabindex="-1" role="dialog" aria-labelledby="searchFilterLabel" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header navbar-inverse">
				<h1 class="modal-title">Filter Models</h1>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<i class="fa fa-times"></i>
				</button>
			</div>
			<div id="close-modal" class="modal-body ">

				<div class="container-fluid">
					<div class="row-fluid searchForm">
						<div id="filterForm">
							<form id="filter" name="filter" action="/" method="POST">
								<!-- sction one -->
								<div class="col-lg-6">
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
												<input type="checkbox" name="filter[breasts][]" id="breats-{$breast_size}"
													   value="{$breast_size}"{if (is_array($filter.breasts) && in_array($breast_size, $filter.breasts))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$breast_size}</div>
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
												<input type="checkbox" name="filter[haircolor][]" id="haircolor-{$hair_color.HairColorID}"
													   value="{$hair_color.HairColorID}"{if (is_array($filter.haircolor) && in_array($hair_color.HairColorID, $filter.haircolor))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$hair_color.HairColor}</div>
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
												<input type="checkbox" name="filter[pubichair][]" id="pubichair-{$pubic_hair.id}"
													   value="{$pubic_hair.id}"{if (is_array($filter.pubichair) && in_array($pubic_hair.id, $filter.pubichair))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$pubic_hair.pubic_hair}</div>
											</label>
											{/foreach}
										</div><!-- end of large screen -->
										<!-- //=================== // -->
									</div><!-- end of Pubic Hair selection -->
								</div><!-- end of section one -->
								<!-- section two -->
								<div class="col-lg-6">
									<div><!-- strta of body selection -->
										<p>Body Type</p>
										<div id="body_section" class="formElm">
											{foreach from=$body_types item=body_type}
											<label class="checkbox-inline">
												<input type="checkbox" name="filter[bodytypes][]" id="bodytype-{$body_type.id}"
													   value="{$body_type.id}"{if (is_array($filter.bodytypes) && in_array($body_type.id, $filter.bodytypes))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$body_type.type}</div>
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
												<input type="checkbox" name="filter[eyecolor][]"
													   id="eyecolor-{$eye_color.EyeColorID}" value="{$eye_color.EyeColorID}"{if (is_array($filter.eyecolor) && in_array($eye_color.EyeColorID, $filter.eyecolor))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$eye_color.EyeColor}</div>
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
												<input type="checkbox" name="filter[ethnicity][]" id="ethnicity-{$ethnicity.EthnicityID}"
													   value="{$ethnicity.EthnicityID}"{if (is_array($filter.ethnicity) && in_array($ethnicity.EthnicityID, $filter.ethnicity))} checked{/if}> <span></span><div class='checkbox-inline-caption'>{$ethnicity.Ethnicity}</div>
											</label>
											{/foreach}
										</div><!-- end of large screen -->
										<!-- //=================== // -->
									</div><!-- end of ethnicity selection -->
								</div><!-- end of section 2 -->
								<div class="col-lg-6 col-lg-offset-6" style="padding: 0">
									<div class="col-sm-6">
										<p>Height</p>
										<div class='col-sm-6 col-xs-6 filter'>
										<select name="filter[height][min]" id="height1">
											{foreach from=$heights item='height'}
											<option value="{$height.HeightID}"{if $filter.height.min == $height.HeightID} selected{/if}>{$height.Height}</option>
											{/foreach}
										</select>
										</div>
										<div class='col-sm-6 col-xs-6 filter'>
										<select name="filter[height][max]" id="height2">
											{foreach from=$heights item='height'}
											<option value='{$height.HeightID}'{if $filter.height.max == $height.HeightID} selected{/if}>{$height.Height}</option>
											{/foreach}
										</select>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="col-sm-6">
										<p>Weight</p>
										<div class='col-sm-6 col-xs-6 filter'>
											<select name="filter[weight][min]" id="weight1">
												{foreach from=$weights item='weight'}
												<option value='{$weight.WeightID}'{if $filter.weight.min == $weight.WeightID} selected{/if}>{$weight.Weight}</option>
												{/foreach}
											</select>
										</div>
										<div class='col-sm-6 col-xs-6 filter'>
											<select name="filter[weight][max]" id="weight2">
												{foreach from=$weights item='weight'}
												<option value='{$weight.WeightID}'{if $filter.weight.max == $weight.WeightID} selected{/if}>{$weight.Weight}</option>
												{/foreach}
											</select>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="col-md-6 col-md-offset-6 btn-top-margin">
									<div class='col-sm-6'>
										<button id="clearFilter" type="reset" class="btn button-3 btn-lg col-sm-12 col-xs-12">Clear Filter</button>
									</div>
									<div class='col-sm-6'>
										<button id="applyFilter" type="submit" class="btn button-2 btn-lg col-sm-12 col-xs-12" onclick="wcc.pushWaiting('applyFilter'); return true;">Apply Filter</button>
									</div>
									<div class="clearfix"></div>
								</div>
							</form>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
