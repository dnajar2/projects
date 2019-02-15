<div id="lp_107_container">
    <main class="step1">
        <h1>Hottest Rooms</h1>
        <div class="thumbs">
        	{foreach from=$models name="model_loop" item="model"}
            {if $smarty.foreach.model_loop.iteration % 5 == 1}
            <div class="row"><!-- start div class row -->
            {/if}
                <div class="thumb-col">
                    <div class="model">
                        <div class="thumb">
                            <h2 class="p-green">
                                <i class="fa fa-lock"></i> In Private
                                <div class="modelfeatures">
                                 	{if $model.volume}
                                   		 <span><i class="fa fa-volume-up"></i></span>
                                    {/if}
                                    <span class="hd">HD</span>
                                    {if $model.mobile}
                                    <span><i class="fa fa-mobile"></i></span>
                                    {/if}
                                </div>
                            </h2>
                            <div class="profile" profile="{$model.username}" id="58518" style="background-image:url({$model.photo_url})">
                                <video id="video_{$model.username}" preload="auto" loop style="opacity:0;position:absolute; top:0px; left:0px;  height:125%;" type='video/mp4'></video>
                                <div id="hoverimg_{$model.username}" class="hover-effect" style="position:absolute; top:0px; left:0px; width:100%; height:92.5%;">
                                    <div class="mask" style="position:absolute; top:0px; left:0px; width:100%;">
                                    </div>
                                </div>
                            </div>
                            {if $model.flame}
                            <div class="flame">
                                <div class="flame1"><i class="fa fa-fire"></i></div>
                                <div class="flame2"><i class="fa fa-firefox"></i></div>
                                <div class="flame3"><i class="fa fa-fire"></i></div>
                            </div>
                            {/if}
                        </div>
                        <div class="left">
                            <h3>{$model.username}</h3>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-half-full"></i>
                            </div>
                        </div>
                    </div>
                </div>
            {if $smarty.foreach.model_loop.iteration % 5 == 0 || $smarty.foreach.model_loop.last}
            </div><!-- end div class row -->
            {/if}
            {/foreach}
        </div>
        <div class="button join">JOIN FOR FREE</div>
    </main>
    <main class="step2">

        <div class="livechat">
            <div class="left">
                <div class="heading">
                    <span id="modelName">KINKYKAT</span>
                    <span class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </span>
                </div>
                <div class="video">
                    <video preload="auto" loop class="vbg" id="mainVideo" autoplay type='video/mp4'></video>
                    <div id="loaderHolder" class="loader"><img id="loaderImg" src="{$smarty.const.CDN_SCHEMA}/images/wcc2/global/landing/107/default-loader.gif"></div>
                    <div id="videoMask" class="videoMask"></div>
                    <div id="videoMaskTxt" class="videoMaskTxt">Your free preview has ended.</div>
                    <div id="videoMaskBtn" class="button joinBtnLocked">CREATE FREE ACCOUNT</div>
                </div>
                <div class="menu">
                    <ul class="buttons">
                        <li><i class="fa fa-search"></i></li>
                        <li><i class="fa fa-volume-up"></i></li>
                        <li><i class="fa fa-star"></i></li>
                        <li><i class="fa fa-gear"></i></li>
                        <li><i class="fa fa-spinner"></i></li>
                        <li><i class="fa fa-video-camera"></i></li>
                    </ul>
                    <div class="tipbutton goal">TIP MODEL</div>
                </div>
            </div>
            <div class="right">
                <div class="heading" id="modelNameHeading"></div>
                <div class="chat">
                    <div class="messages">

                    </div>
                    <div class="input">
                        <input type="text">
                    </div>
                </div>
                <div class="menu">
                    <ul class="buttons2">
                        <li><i class="fa fa-search-plus"></i></li>
                        <li><i class="fa fa-language"></i></li>
                        <li><i class="fa fa-font"></i></li>
                        <li><i class="fa fa-eye"></i></li>
                        <li><i class="fa fa-smile-o"></i></li>
                    </ul>
                    <div class="button send">SEND</div>
                </div>
            </div>
        </div>
        <h1>Other Hot Rooms</h1>
        <div class="thumbs thumbspvt">
            <div class="row">
                <div class="thumb-col">
                    <div class="model">
                        <div class="thumb">
                            <h2 class="p-green">
                                <i class="fa fa-lock"></i> In Private
                                <div class="modelfeatures">
                                    <span><i class="fa fa-volume-up"></i></span>
                                    <span class="hd">HD</span>
                                    <span><i class="fa fa-mobile"></i></span>
                                </div>
                            </h2>
                            <div class="profile" profile="AnetteTurner" id="50454" style="background-image:url({$models[0].photo_url})">
                            </div>
                            <div class="flame">
                                <div class="flame1"><i class="fa fa-fire"></i></div>
                                <div class="flame2"><i class="fa fa-firefox"></i></div>
                                <div class="flame3"><i class="fa fa-fire"></i></div>
                            </div>
                        </div>
                        <div class="left">
                            <h3>AnetteTurner</h3>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-half-full"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="thumb-col">
                    <div class="model">
                        <div class="thumb">
                             <h2 class="p-green">
                               <i class="fa fa-lock"></i> In Private
                                <div class="modelfeatures">
                                    <span><i class="fa fa-volume-up"></i></span>
                                    <span class="hd">HD</span>
                                    <span><i class="fa fa-mobile"></i></span>
                                </div>
                            </h2>
                            <div class="profile" profile="AngelaMillerX" id="55593" style="background-image:url({$smarty.const.CDN_SCHEMA}/images/wcc2/global/landing/107/modelImages/AngelaMillerX.jpg)">
                            </div>
                        </div>
                        <div class="left">
                            <h3>AngelaMillerX</h3>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-half-full"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="thumb-col">
                    <div class="model">
                        <div class="thumb">
                            <h2 class="p-green">
                                <i class="fa fa-lock"></i> In Private
                                <div class="modelfeatures">
                                    <span class="hd">HD</span>
                                </div>
                            </h2>
                            <div class="profile" profile="AnikaDuvale" id="41967" style="background-image:url({$smarty.const.CDN_SCHEMA}/images/wcc2/global/landing/107/modelImages/AnikaDuvale.jpg)">
                            </div>
                            <div class="flame">
                                <div class="flame1"><i class="fa fa-fire"></i></div>
                                <div class="flame2"><i class="fa fa-firefox"></i></div>
                                <div class="flame3"><i class="fa fa-fire"></i></div>
                            </div>
                        </div>
                        <div class="left">
                            <h3>AnikaDuvale</h3>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-half-full"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="thumb-col">
                    <div class="model">
                        <div class="thumb">
                            <h2 class="p-green">
                                <i class="fa fa-lock"></i> In Private
                                <div class="modelfeatures">
                                    <span><i class="fa fa-volume-up"></i></span>
                                    <span class="hd">HD</span>
                                    <span><i class="fa fa-mobile"></i></span>
                                </div>
                            </h2>
                            <div class="profile" profile="AntoniaTeacher" id="56943" style="background-image:url({$smarty.const.CDN_SCHEMA}/images/wcc2/global/landing/107/modelImages/AntoniaTeacher.jpg)">
                            </div>
                        </div>
                        <div class="left">
                            <h3>AntoniaTeacher</h3>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-half-full"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="thumb-col">
                    <div class="model">
                        <div class="thumb">
                            <h2 class="p-green">
                                <i class="fa fa-lock"></i> In Private
                                <div class="modelfeatures">
                                    <span class="hd">HD</span>
                                </div>
                            </h2>
                            <div class="profile" profile="LadyBossMMM" id="41084" style="background-image:url({$smarty.const.CDN_SCHEMA}/images/wcc2/global/landing/107/modelImages/LadyBossMMM.jpg)">
                            </div>
                            <div class="flame">
                                <div class="flame1"><i class="fa fa-fire"></i></div>
                                <div class="flame2"><i class="fa fa-firefox"></i></div>
                                <div class="flame3"><i class="fa fa-fire"></i></div>
                            </div>
                        </div>
                        <div class="left">
                            <h3>LadyBossMMM</h3>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-half-full"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <div class="modal" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="joinModalLabel" style="display: block;opacity:0">
        <div class="overlay"></div>
        <div class="modal-dialog" role="document" style="display: block;">
            <div class="modal-content">
                <div class="modalgirl"></div>
                <div class="modal-header navbar-inverse">
                    <h1 class="modal-title">Join the sexiest cam network for FREE!</h1>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><img class="btn_close_icon" src='{$smarty.const.CDN_SCHEMA}/members/mobile/assets/closeX.png' height='33' width='33'></span>
                    </button>
                </div>
                <div class="modal-body">
              		<h4 style="color:#79c720;font-size:52px!important;font-weight:600;" >6 FREE CREDITS !</h4>
                    <div class="modal-form">
                         <ul>
                            <div data-module-box="true">
                                {include file="$_THEME/components/members/joinpages/form_fields.tpl" exit_pop_joinpage=$exit_pop_joinpage}
                            </div>
                        </ul>
                        <div style="clear:both;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
