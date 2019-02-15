var script = document.createElement('script');
script.onload = function () {
    //console.log("script loaded");
};
script.src = "https://www.webcamclub.com/js/socket.io-2.0.3.js";
document.head.appendChild(script);

var script2 = document.createElement('script');
script2.onload = function () {
    //console.log("script2 loaded");
};
script2.src = "https://www.webcamclub.com/js/hls.js";
document.head.appendChild(script2);

var video,pauseScreen,screenButton,pbarContainer,pbar,playButton,timeField,soundBUtton,sbarContainer,sbar,fullscreenbutton,buttonsContainer,isInternetExplorer,is_ie = false,from,chatSWF,curSelVideoID,uri,
    sid,url_root,server_port,node,node_url,serverURL,filename,modelName,modelID,my_str,percentage,mouseX,width,seconds,minutes,totalSeconds,totalMinutes,fullPath,socketVideoConvert,client,current_room,
    my_array,my_array2,my_array3,

useFlash = true,
useDevServer = false,
node_port = "8003",
sessionName = wcc.sid_name,
session_id = wcc.sid,
memberID = wcc.member_id,
nodeShowFolder = "PrivateShows", //could be goalshow.
isDev = false,
wowzaVersion = "3",
sio_url = "www.webcamclub.com";
myGateway = "https://www.webcamclub.com";

if ( location.href.indexOf("dev") !== -1 ) {
    isDev = true;
    my_str = location.href.toString();
    my_array = my_str.split( "." );

    my_array2 = my_array [ 0 ].split( "//" );
    my_array3 = my_array2.splice( 1, 1 );

    myGateway  = "https://" + my_array3 + ".dev.webcamclub.com";
    sio_url = my_array3 + ".dev.webcamclub.com";
}

logger("myGateway " + myGateway );
logger("sessionName = " + sessionName );
logger("session_id = " + session_id );
logger("memberID = " + memberID );

if ( navigator.userAgent.indexOf('MSIE') !== -1 || navigator.appVersion.indexOf('Trident/') > 0 ) {
    is_ie = true;
}

// video container
video = document.getElementById('video');
pauseScreen =  document.getElementById('screen');
screenButton = document.getElementById('screen-button');
//progress bar container
pbarContainer = document.getElementById('pbar-container');
pbar = document.getElementById('pbar');
// buttons container
playButton = document.getElementById('play-button');
timeField = document.getElementById('time-field');
soundBUtton = document.getElementById('sound-button');
sbarContainer = document.getElementById('sbar-container');
sbar = document.getElementById('sbar');
fullscreenbutton = document.getElementById('fullscreen');
// videoContainer = document.getElementById('video-container');
buttonsContainer = document.getElementById('buttons-container');

window.addEventListener('load', function(){

	if ( !useFlash ) {
   		video.load();

		video.addEventListener('canplay', function() {
			if ( playButton != null )
				playButton.addEventListener('click', h5player.playOrPause, false);

			if ( pbarContainer != null )
				pbarContainer.addEventListener('click', h5player.skip, false);

			if ( soundBUtton != null )
				soundBUtton.addEventListener('click', h5player.muteOrUnmute, false);

			if ( sbarContainer != null )
				sbarContainer.addEventListener('click', h5player.changeVolume, false);

			if ( fullscreenbutton != null )
				fullscreenbutton.addEventListener('click', h5player.fullscreen, false);

			if ( screenButton != null )
				screenButton.addEventListener('click', h5player.playOrPause);
			// videoCcontainer.addEventListener('click', h5player.playOrPause, false);

			h5player.updatePlayer();

		}, false);
	}
	else {
		if ( playButton != null )
			playButton.addEventListener('click', h5player.playOrPause, false);

		if ( pbarContainer != null )
			pbarContainer.addEventListener('click', h5player.skip, false);

		if ( soundBUtton != null )
			soundBUtton.addEventListener('click', h5player.muteOrUnmute, false);

		if ( sbarContainer != null )
			sbarContainer.addEventListener('click', h5player.changeVolume, false);

		if ( fullscreenbutton != null )
			fullscreenbutton.addEventListener('click', h5player.fullscreen, false);

		if ( screenButton != null )
			screenButton.addEventListener('click', h5player.playOrPause);
	}
}, false);

var h5player = {
	playOrPause:function () {

		if ( !useFlash ) {
			logger("playOrPause video.paused " + video.paused );

			if ( video.paused ) {
				video.play();
				playButton.innerText = 'pause';
				update = setInterval(h5player.updatePlayer, 30);

				pauseScreen.style.display = 'none';
				screenButton.innerText = 'play_circle_outline';
			}
			else {
				video.pause();
				playButton.innerText = 'play_arrow';
				window.clearInterval(update);

				pauseScreen.style.display = 'block';
				screenButton.innerText = 'play_circle_outline';
			}
		}
		else {
			logger("playOrPause useFlash FIRED");
			pauseScreen.style.display = 'none';
			screenButton.innerText = 'play_circle_outline';
			buttonsContainer.style.display = 'none';
			pbarContainer.style.display = 'none';
		}
    },

    updatePlayer : function () {
		if ( !useFlash ) {
			percentage = ( video.currentTime / video.duration ) * 100;
			pbar.style.width = percentage + "%";
			timeField.innerHTML = h5player.getFormattedTime();
			if ( video.ended ) {
				window.clearInterval(update);
				playButton.innerText = 'replay';

				pauseScreen.style.display = 'block';
				screenButton.innerText = 'replay'
			}
			else if ( video.paused ) {
				playButton.innerText = 'play_arrow';
				screenButton.innerText = 'play_circle_outline';
			}
		}
		else {
			logger("updatePlayer useFlash FIRED");
		}
    },

    skip : function (ev) {
	    mouseX = ev.pageX - pbarContainer.offsetLeft;
		width = window.getComputedStyle(pbarContainer).getPropertyValue('width')
		width = parseFloat(width.substr(0, width.length - 2) );
		video.currentTime = (mouseX/width) * video.duration;
		h5player.updatePlayer();
    },

    getFormattedTime : function () {
	    seconds = Math.round(video.currentTime);
	    minutes = Math.floor(seconds/60);

        if ( minutes > 0 ) {
            seconds -= minutes * 60;
        }
        if ( seconds.toString().length === 1 ) {
            seconds = '0' + seconds;
        }

        totalSeconds = Math.round(video.duration);
        totalMinutes = Math.floor(totalSeconds/60);

        if ( totalMinutes > 0 ) {
            totalSeconds -= totalMinutes * 60;
        }
        if ( totalSeconds.toString().length === 1 ) {
            totalSeconds = '0' + totalSeconds;
        }
        return minutes+':'+seconds + ' / ' + totalMinutes+':'+totalSeconds;
    },

    muteOrUnmute : function () {
		if ( !useFlash ) {
			if( !video.muted ) {
				video.muted = true;
				soundBUtton.innerText = 'volume_off';
				sbar.style.display = 'none';
			}
			else {
				video.muted = false;
				soundBUtton.innerText = 'volume_up';
				sbar.style.display = 'block';
			}
		}
		else {
			logger("muteOrUnmute useFlash FIRED");
		}
    },

    changeVolume : function (ev) {
        mouseX = ev.pageX - sbarContainer.offsetLeft;
        width = window.getComputedStyle(sbarContainer).getPropertyValue('width')
        width = parseFloat(width.substr(0, width.length - 2) );

		if ( !useFlash ) {
        	video.volume = (mouseX/width);
			video.muted = false;
		}
		else {
			console.log("changeVolume useFlash FIRED");
		}

        sbar.style.width = (mouseX/width)*100 + '%';
        soundBUtton.innerText = 'volume_up';
        sbar.style.display = 'block';
    },

    fullscreen : function() {
		if ( !useFlash ) {
			if ( video.requestFullscreen ){
				video.requestFullscreen();
			}
			else if ( video.webkitRequestFullScreen ){
				video.webkitRequestFullScreen()
			}
			else if ( video.mozRequestFullScreen ){
				video.mozRequestFullScreen()
			}
			else if ( video.msRequestFullScreen ){
				video.msRequestFullScreen()
			}
		}
		else {
			logger("fullscreen useFlash FIRED");
		}
    },

    openPoster : function( id ) {
		logger("openPoster FIRED id = " + id);

        $('#player-holder').slideDown();
        $('#videos-grid').slideUp();
		$('#videoFilter').hide();
		$('#backToGrid').show();
		if ( !useFlash ) {
       	    //h5player.playOrPause();
            h5player.getVideoConnectInfo ( id );
            document.getElementById('flashvideo-container').style.cssText += "width:0;height:0;opacity:0;z-index:0;position:absolute;top:0px;";
            video.style.cssText += "width:100%;height:100%;opacity:1;z-index:10;position:absolute;top:0px;object-fit:initial!important;";
		}
		else {
			pauseScreen.style.display = 'none';
			screenButton.innerText = 'play_circle_outline';
			buttonsContainer.style.display = 'none';
			pbarContainer.style.display = 'none';

			/* Set id for Flash ExternalInterface to grab 538367*/
			curSelVideoID = id;
		}
    },

	getVideoID : function() {
		logger("getVideoID curSelVideoID " + curSelVideoID );
		return curSelVideoID;
	},

    loadAndPlay : function( src ) {

		//../assets/lp_videos/video2/video.mp4
		logger("loadAndPlay src " + src );

		if ( !useFlash ) {
			video.firstElementChild.src = src;

			video.load();
			setTimeout(function(){
				if ( video.readyState === 4) {
					h5player.playOrPause();
				}
			},300)
		}
		else {
			curSelVideoID = src;
			logger("loadAndPlay useFlash FIRED");
			h5player.playerLoadID( src );
			pauseScreen.style.display = 'none';
			screenButton.innerText = 'play_circle_outline';
		}
    },

	/**
	 * ExternalInterface play video call to swf.
	 */
	playerLoadID : function ( id ) {
		try {
			chatSWF = h5player.configureSWFParams();

			if ( typeof chatSWF !== "undefined" ) {
				if ( typeof chatSWF.playerLoadID === "function" ) {
					chatSWF.playerLoadID( id );
				}
			}
		}
		catch ( e ) {
			logger("playerLoadID error: " + e.toString());
		}
	},
    /**
     * ExternalInterface pause video call to swf.
     */
    playerPause : function () {
        try {
            chatSWF = h5player.configureSWFParams();

            if ( typeof chatSWF !== "undefined" ) {
                if ( typeof chatSWF.doPause === "function" ) {
                    chatSWF.doPause();
                }
            }
        }
        catch ( e ) {
            logger("playerPause error: " + e.toString());
        }
    },

	/**
	 * Returns swf object for ExternalInterface calls.
	 */
	configureSWFParams : function () {
		try {
			if ( typeof isInternetExplorer === "undefined" )
				isInternetExplorer = is_ie;

			from = 0;
			chatSWF = document.getElementsByName("movie");
			if ( chatSWF.length > 1 ) {
				from = chatSWF.length - 2;
			}
			chatSWF = document.getElementsByName("movie")[ from ];
			chatSWF = isInternetExplorer ? document.all.movie : document.movie;
			return chatSWF;
		}
		catch ( e ) {
			logger("configureSWFParams error: " + e.toString());
		}
	},

    get_video_info: function ( video_id ) {
        try {
            logger( "get_video_info fired " + video_id  );

            var e = {};
            e.args = [ video_id ];
            e.method = 'CamGirlService.get_video_info';

            $.ajax({
                url: myGateway+'/flashservices/gateway2.php?m=get_video_info&'+sessionName+'='+ session_id,
                type: 'POST',

                data: JSON.stringify(e),

                success: function( response ) {
                    if ( response.data != null ) {
                        uri = response.data.video_uri;
                        logger( "get_video_info success uri " + uri  );
                        sid = video_id;

                        modelName = response.data.model_username;
                        logger( "get_video_info success modelName " + modelName  );

                        modelID = response.data.model_id;
                        logger( "get_video_info success modelID " + modelID  );

                        wowzaVersion = 4;
                        if ( wowzaVersion === "3" ) {
                            serverURL = "rtmp://" + url_root + ":"+ server_port + "/" + "admin_playback_"+node;
                            filename = "/PrivateShows/" + modelName + "/" + uri;
                        }
                        else {
                            serverURL = "rtmp://172.22.1.33:80/admin_playback2_"+node+"/_definst_/";
                            uri =  uri.replace("streams_" + modelName, "flv:streams_" + modelName + ".flv" );
                            filename = "/PrivateShows/" + modelName + "/" + uri;
                        }

                        fullPath = serverURL + filename;
                        sid = uri;
                        logger("get_video_info fullPath = " + fullPath );

                        h5player.videoConverterInit();
                    }
                    else {
                        alert("get_video_info response.data WAS null");
                    }
                },
                error: function() {
                    logger('get_video_info error');
                }
            })
        }
        catch ( e ) {
            logger( "get_video_info catch e = " + e );
        }
    },

    videoConverterInit : function () {

	    if ( socketVideoConvert != null ) {
            socketVideoConvert.close();
        }


        logger("fullPath = " + fullPath);

        client = {};
        client.modelName    = modelName;
        client.modelID      = modelID;
        client.username     = modelName;
        client.userID       = memberID;
        client.sessionName  = sessionName;
        client.session_id   = session_id;
        client.usertype     = "4";
        client.user_type    = "member";
        client.gateway      = myGateway.replace("https://" , "" );
        client.path         = fullPath;
        client.sid          = sid;

        logger("videoConverterInit - client.gateway = " + client.gateway);

        current_room = modelName;
        client.room = modelName;

        socketVideoConvert = io.connect( 'https://'+sio_url+':7002',{'forceNew':true });

        socketVideoConvert.on('connect', function(){
            socketVideoConvert.emit('adduser', client);
        });

        socketVideoConvert.on('onadduser', function (message) {
            logger('socket.on onadduser : ' + message + "" );
            //socketVideoConvert.emit('start', 'start' , 100 );
        });

        socketVideoConvert.on('message', function (message) {
            logger('socketVideoConvert.on message : ' + message + "" );
            if ( message === "server connected!" ) {
                socketVideoConvert.emit('start', 'start', 100);
                //socketVideoConvert.emit('start2', 'start', 100);
            }
        });

        socketVideoConvert.on('fatal', function (message) {
            logger('socketVideoFree.on fatal : ' + message );

            if ( message.toString() === "ffmpeg exit e = 1" ) {
                logger('ffmpeg exit detected stream closed');
            }
            if ( message.toString().indexOf("Error: This socket is closed" ) !== -1 || message.toString().indexOf( "Error: This socket has been ended by the other party") !== -1 ) {
                logger('Error: This socket is closed');
            }
        });

        socketVideoConvert.on('ffmpeg_stderr',function(message){
            logger('socketVideoConvert.on ffmpeg_stderr FFMPEG: ' + message );
            if ( message.indexOf("Too many packets buffered for output stream") !== -1 ) {
                logger('ffmpeg fatal error');
            }
        });

        if ( Hls.isSupported() ) {
            var video = document.getElementById('video');
            var hls = new Hls();
            hls.loadSource('https://kmurray.dev.mstreams.webcamclub.com:7002/video.m3u8?modelName=kristy&showtype=vod');
            hls.attachMedia(video);
            hls.on(Hls.Events.MANIFEST_PARSED,function() {
                video.play();
            });
        }
        else if ( video.canPlayType('application/vnd.apple.mpegurl') ) {
            video.src = 'https://kmurray.dev.mstreams.webcamclub.com:7002/video.m3u8?modelName=kristy&showtype=vod';
            video.addEventListener('canplay',function() {
                video.play();
            });
        }

    },

    getVideoConnectInfo: function (video_id) {
        try {
            //logger( "getVideoConnectInfo fired video_id " + video_id );
            var e = {};
            e.args = [ video_id ];
            e.method = 'CamGirlService.getVideoConnectInfo';

            $.ajax({
                url: myGateway+'/flashservices/gateway2.php?m=getVideoConnectInfo&'+sessionName+'='+ session_id,
                type: 'POST',

                data: JSON.stringify(e),

                success: function( response ) {
                    if ( response.data != null ) {
                        node =  response.data.node;
                        url_root = response.data.url;
                        server_port = response.data.server_port;

                        if ( isDev ) {
                            //url_root = "172.22.1.33";
                            //server_port = 80;
                           // wowzaVersion = "4";
                        }

                        logger( "getVideoConnectInfo node = " + node );
                        logger( "getVideoConnectInfo url_root = " + url_root );
                        logger( "getVideoConnectInfo server_port = " + server_port );

                        h5player.get_video_info ( video_id );
                    }
                },
                error: function() {
                    logger('getVideoConnectInfo error');
                }
            })
        }
        catch ( e ) {
            logger( "getVideoConnectInfo catch e = " + e );
        }
    },
    disconnectAllSockets : function () {
        logger("Chat disconnectAllSockets TOP");

        if ( socketVideoConvert != null ) {
            socketVideoConvert.disconnect(true);
            socketVideoConvert.close();
            socketVideoConvert = null;
        }
    }
};

function logger( msg ) {
	try {
		console.enabled = true;
		console.log( msg );
	}
	catch ( e ) {
		console.log( "logger catch e = " + e.toString() );
	}
}

window.onbeforeunload = function() {
    logger("****onbeforeunload fired****");
    killApplication();
};

window.addEventListener('pagehide',function(e) {
    killApplication();
});

function killApplication() {
    logger("**** killApplication fired ****");
    h5player.disconnectAllSockets();
}
