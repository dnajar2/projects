<div id="myPhotos" class="col-xs-12">
    <div class="box box-primary">
        <div class="box no-top-border">
            <div class="box-header with-border">
                <h3 class="box-title">My Photos</h3>
            </div>
            <div class="box-body" style="padding-bottom: 48px;">
                <div class="text-center">
                    {if $NoPhotos}
                        <strong>You have not uploaded any photos!</strong><br />You will not be able to go online until you upload at least 1 photo.<br /> <br />
                    {/if}
                    <br>
                    {if !$NoPhotos}
                        <div id="warning" class="alert alert-warning alert-dismissible col-md-6 col-md-offset-3" style="display: none">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <h4><i class="icon fa fa-warning"></i> Please Note!</h4>
                            Primary photos can not be deleted please select another photo as your primary photo by clicking on the (<i class="fa fa-star-o"></i>) icon,
                            once your new primary photo is approved you can safely delete your previous primary photo.
                        </div>
                        <div class="clearfix"></div>
                    {/if}
                    {*<button type="submit" name="submit2" id="uploadImages" class="btn button-2 btn-lg"><i class="fa fa-crop" aria-hidden="true"></i> Upload Photo</button>*}
                    <button type="submit" name="submit" id="uploadOnly" class="btn button-2 btn-lg" data-toggle="modal" data-target="#uploadPhotosOnly">
                        <i class="fa fa-upload" aria-hidden="true"></i> Upload Photo
                    </button>
                </div>
                <div class="clearfix"></div>
                <hr>
                {if count($photo_logs)}
                    {foreach from=$photo_logs item="logline"}
                        <tr><td align="center">
                                <!-- <img src="{$CDN_SCHEMA}/images/wcc1/members/spacer.gif" width="8"> -->
                                {$logline}
                            </td></tr>
                    {/foreach}
                {/if}
                <form id="photoGrid" enctype="multipart/form-data"  name="application" method="post" action="/models/">
                    <input name="show" type="hidden" value="myphotos">
                    <input type="hidden" name="act" value="updatephoto_application">
                    {section name=this loop=$form}
                        <div id="cellId{$form[this].id}" class="col-lg-3 col-md-4 col-xs-12 image-row">
                            <div class="working text-center" style="display: none">
                                <i class="fa fa-refresh fa-spin" style="margin-top: 20%;"></i>
                            </div>
                            <input name="photo[]" type="hidden" value="{$form[this].id}">
                            <div class="profile-img {if $form[this].prime}primary-photo{/if}">
                                <a href="{$form[this].orig}" title="{$form[this].id}" data-value="{$form[this].id}">
                                    <img alt="" src="{if $form[this].thumb}{$form[this].thumb}{else}{$form[this].file}{/if}&v={$smarty.now}" class="photoBox" border="0">
                                </a>
                                <div class="corner-ribbon top-right sticky blue" {if !$form[this].prime}style="display: none"{/if}>Primary Photo</div>
                            </div>
                            <div class="text-center">
                                {if $restrictFromModels}
                                    <div class="hide">

                                        Primary Photo{if $form[this].pending_prime_photo}<span>({$form[this].pending_prime_photo})</span>{/if}
                                    </div>
                                {/if}
                                {* ation item icons *}
                                <a href="#" class="photo-action-icons" title="{if $form[this].prime}Primary Photo{else}Change as primary{/if}" >
                                    <i class="fa {if $form[this].prime}fa-star{else}fa-star-o{/if}" aria-hidden="true" {if !$form[this].prime}data-name="favorite"{/if}></i>
                                    <input name="radiobutton" type="radio" id="radiobutton{$smarty.section.this.index}" class="hide" value="{$smarty.section.this.index}" {if $form[this].prime}checked{/if}>
                                </a>
                                {*original image*}
                                <a href="{$form[this].orig}" class="photo-action-icons full-size" title="View full size">
                                    <i class="fa fa-arrows-alt" aria-hidden="true" data-name="view"></i>
                                </a>
                                <a href="#" class="photo-action-icons" title="Crop Image">
                                    <i class="fa fa-crop" aria-hidden="true" data-name="crop"></i>
                                </a>

                                <a href="{$form[this].deleteLink}" id="button-myphotos-delete{$smarty.section.this.index}"  title="Delete Photo" class="photo-action-icons">
                                    <i class="fa fa-trash" aria-hidden="true" {if $form[this].prime} data-alert{else}data-name="delete"{/if}></i>
                                </a>

                            </div>
                        </div>
                    {/section}
                    <div class="clearfix"></div>
                    <hr>
                </form>
            </div>
            <!-- /.box-body -->
        </div>
    </div>
</div>
{* popup image gallery *}
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" style="display: none;">
    <div class="slides" style="width: 11520px;"></div>
    <div class="action-icons-holder">
        <span class="icons">
           {* ation item icons *}
            <a href="#" class="photo-action-icons" title="Set as prim" >
                <i class="prime-pic fa fa-star-o" aria-hidden="true" data-action="favorite"></i>
            </a>
            <a href="#" class="photo-action-icons" title="Crop Image">
                <i class="fa fa-crop" aria-hidden="true" data-action="crop"></i>
            </a>
            <a href="#" id="button-myphotos-delete"  title="Delete Photo" class="photo-action-icons">
                <i class="fa fa-trash" aria-hidden="true" data-action="delete"></i>
            </a>
        </span>
    </div>
    <h4 class="title">{$modelInfo.Username}</h4>
    <h3 class="title hide">{$model_username} Photos</h3>
    <a class="prev"><i class="fa fa-chevron-left"></i></a>
    <a class="next"><i class="fa fa-chevron-right"></i></a>
    <a class="close">x</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>
<div id="fullPageOverlay" style="display: none">
    <h3 class="text-center"><i class="fa fa-refresh fa-spin" style="margin-top: 20%; color: #fff;"></i></h3>
</div>

{* upload and crop modal*}
<div id="cropPhotos" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Crop Photo</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-7 text-center">
                        <div id="upload-image"></div>
                        <div id="upload-image-caption" class="text-center">Crop image by using the slider and moving the images to your desired position</div>
                    </div>
                    <div class="col-md-5 crop_preview">
                        <div id="upload-image-i" style="display: none"></div>
                    </div>

                    <div id="uploadForm" class="col-sm-12" style="display: none">
                        <form enctype="multipart/form-data"  name="application" method="POST" action="{$uploadPhotosURL}">
                            <input name="show" type="hidden" value="myphotos"  />
                            <input name="action" type="hidden" value="uploadPhotos" />
                            <div class="text-center">
                               <span class="control-fileupload">
                                <label for="imageUpload" class="btn btn-primary"> <i class="fa fa-folder-open-o" aria-hidden="true"></i> Choose an image
                                    <input name="userfile" id="imageUpload" type="file" class="hide" >
                                </label>
                            </span>
                                <p><strong>Use .jpg/.gif/.png images only (maximum size of {$upload_max_filesize})</strong></p>
                            </div>
                            <div class="text-center" style="padding-bottom: 25px;">
                                {if $NoPhotos}
                                    <strong>You have not uploaded any photos!</strong><br />You will not be able to go online until you upload at least 1 photo.<br /> <br />
                                {/if}
                                <br>
                                {*<button type="submit" name="submit2" class="btn button-2 btn-lg"><i class="fa fa-upload" aria-hidden="true"></i> Upload Images</button>*}
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cropped_image" type="button" class="btn btn-primary" disabled><span class="text">Upload and Save</span> <i class="fa fa-refresh fa-spin" style="display: none"></i></button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
{*Upload photos only*}
<div id="uploadPhotosOnly" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form id="uploadModelPhoto" enctype="multipart/form-data"  name="application" method="POST" action="{$uploadPhotosURL}">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Upload Photo</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div id="uploadForm" class="col-sm-12">
                        <input name="show" type="hidden" value="myphotos"  />
                        <input name="action" type="hidden" value="uploadPhotos" />
                        <input name="type" type="hidden" value="ajax" />
                        <div id="renderUploadImages">
                            <div class="col-md-10 col-md-offset-1 img-upload-stage"></div>
                            {*<div class="col-md-4 img-upload-stage"></div>*}
                            {*<div class="col-md-4 img-upload-stage"></div>*}
                        </div>
                        <div class="clearfix"></div>
                        <div class="text-center">
                        {section name=file loop=1 start=0}
                           <span class="control-fileupload">
                                <label for="userfile{$smarty.section.file.index}" class="btn btn-primary"> <i class="fa fa-folder-open-o" aria-hidden="true"></i> Choose an image
                                   <input name="userfile{$smarty.section.file.index}"
                                       id="userfile{$smarty.section.file.index}"
                                       type="file"
                                       class="hide"
                                       data-index="{$smarty.section.file.index}"
                                       >
                                </label>
                            </span>
                        {/section}
                            <p class="clear_wl"><strong>Use .jpg/.gif/.png images only (maximum size of {$upload_max_filesize})</strong></p>
                        </div>
                        <div class="text-center" style="padding-bottom: 25px;">
                            {if $NoPhotos}
                                <strong>You have not uploaded any photos!</strong><br />You will not be able to go online until you upload at least 1 photo.<br /> <br />
                            {/if}
                            <br>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="progress" style="display: none">
                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
                </div>
                <button type="submit" class="btn btn-primary" style="display: none" onclick="$(this).find('.fa').show()">
                    <span class="text">Upload Photo &nbsp; </span><i class="fa fa-refresh fa-spin" style="display: none"></i>
                </button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
        </form>
    </div>
</div>
{*confirm image delete*}
<div id="deletePhoto" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Photo Delete Request</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this photo?</p>
                <div class="text-center">
                    <img src="" alt="model photo to be deleted" id="image2delete" class="img-responsive" style="display: block; margin: auto">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-success" data-dismiss="modal" onclick="utils.delete_confirmed = true">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

