<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>GreenStay</title>

<link rel="stylesheet" href="/css/common.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>

</head>
<style>

.vimeoWrap {
	position: relative;
	padding-bottom: 56.25%;
	height: 0;
	overflow: hidden;
	margin: 0;
	background: url(http://img.einet.kr/P201911010/responsive/main/movieBg.jpg) center center no-repeat;
	background-size: cover;
}
.vimeoWrap iframe,
.vimeoWrap object,
.vimeoWrap embed {
	position:absolute;
	top:0;
	left:0;
	width:100%;
	height:100%;
}

.vimeo-area {
	position: absolute;
	top: 0; right: 0; bottom: 0; left: 0;
	width: 100%; height: 100%;
	margin: auto;
}

.firstMovie .vimeoSlogan {
	position: absolute;
	top: calc(50% - 65px); right: 0; left: 0;
	width: 100%;
	margin: auto;
	text-transform: capitalize;
	transform: translateY(-50%);
	text-align: center;
}
.firstMovie .vimeoSlogan .slogan {
	transform: translateY(10%);
}
.firstMovie .vimeoSlogan .vimeo_play {
	position: relative;
	display: inline-block;
	margin-top: 20px;
	padding-left: 60px;
	color: #fff;
	text-shadow: 0 1px 2px rgba(34,34,34,0.5);
	transition: color 0.3s;
}
.firstMovie .vimeoSlogan .vimeo_play i {
	position: absolute;
	top: 0; left: 0;
	width: 50px; height: 50px;
	font-size: 20px;
	line-height: 50px;
	text-align: center;
}
.firstMovie .vimeoSlogan .vimeo_play i::after {
	content: '';
	position: absolute;
	top: 0; right: 0; bottom: 0; left: 0;
	margin: auto;
	border: 1px solid #fff;
	border-radius: 100%;
	transition: border 0.3s;
}
.firstMovie .vimeoSlogan .vimeo_play:hover i::after {
	content: '';
	border: 2px solid #fff;
}
.firstMovie .vimeoSlogan .vimeo_play span {
	font-family: 'Lato';
	font-size: 20px;
	line-height: 50px;
	letter-spacing: 0.05em;
	text-transform: uppercase;
	vertical-align: top;
	transition: font-weight 0.3s;
}

.firstMovie .scrollDown {
	bottom: 160px;
}


/* 외부 css 가져오기 */
.mfp-bg {
    top: 0; left: 0;
    width: 100%; height: 100%;
    z-index: 1042;
    overflow: hidden;
    position: fixed;
    background: #0b0b0b;
    opacity: 0.8;
}

.mfp-wrap {
    top: 0; left: 0;
    width: 100%; height: 100%;
    z-index: 1043;
    position: fixed;
    outline: 0 !important;
    -webkit-backface-visibility: hidden;
}

.mfp-container {
    text-align: center;
    position: absolute;
    width: 100%;
    top: 50%; right:0; left: 0;
    transform: translateY(-50%);
    padding: 0 8px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.mfp-content {
    position: relative;
    display: inline-block;
    vertical-align: middle;
    margin: 0 auto;
    text-align: left;
    z-index: 1045;
}

.mfp-content {
    position: relative;
    display: inline-block;
    vertical-align: middle;
    margin: 0 auto;
    text-align: left;
    z-index: 1045;
}

.mfp-auto-cursor .mfp-content {
    cursor: auto;
}

.mfp-iframe-holder .mfp-content {
    line-height: 0;
    width: 100%;
    max-width: 900px;
}

.mfp-iframe-scaler {
	width: 100%; height: 0;
    overflow: hidden;
    padding-top: 56.25%;
}

.mfp-close {
    width: 44px; height: 44px;
    line-height: 44px;
    position: absolute;
    top: 0; right: 0;
    text-decoration: none;
    text-align: center;
    opacity: 0.65;
    padding: 0 0 18px 10px;
    color: #fff;
    font-style: normal;
    font-size: 28px;
    font-family: 'Lato';
}

button.mfp-close {
    overflow: visible;
    cursor: pointer;
    background: 0 0;
    border: 0;
    -webkit-appearance: none;
    display: block;
    outline: 0;
    padding: 0;
    z-index: 1046;
    -webkit-box-shadow: none;
    box-shadow: none;
}

.mfp-close-btn-in .mfp-close {
    color: #333;
}

.mfp-iframe-holder .mfp-close, .mfp-image-holder .mfp-close {
    color: #fff;
    right: -6px;
    text-align: right;
    padding-right: 6px;
    width: 100%;
}

.mfp-iframe-holder .mfp-close {
	top:-40px;
}

.mfp-iframe-scaler iframe {
    position: absolute;
    display: block;
    top: 0; left: 0;
    width: 100%; height: 100%;
    -webkit-box-shadow: 0 0 8px rgba(0,0,0,.6);
    box-shadow: 0 0 8px rgba(0,0,0,.6);
    background: #000;
}

@media (max-width: 1680px) {
	.firstMovie .vimeoSlogan {
		top: 50%;
	}
	.firstMovie .vimeoSlogan .slogan {
	}
	.firstMovie .scrollDown {
		bottom: 50px;
	}
}


@media (max-width: 1024px) {
	/* .vimeoWrap {
		height: 94.453vh;
		padding-bottom: auto;
	} */
    
	.vimeoWrap
	.vimeoWrap iframe,
	.vimeoWrap object,
	.vimeoWrap embed {
		display: none;
	}
	.firstMovie .movie {
		position: relative;
	}
	/* .firstMovie .movie #ivideo {
		display: none;
	} */
	.firstMovie .vimeoSlogan .slogan {
		display: none;
	}
	.firstMovie .vimeoSlogan .vimeo_play {
		margin-top: 0;
		padding-left: 0;
	}
	.firstMovie .vimeoSlogan .vimeo_play i {
		position: relative;
		top: auto; left: auto;
		width: 60px; height: 60px;
		font-size: 24px;
		line-height: 60px;
		text-align: center;
	}
	.firstMovie .vimeoSlogan .vimeo_play span {
		display: block;
		margin-top: 15px;
		font-size: 22px;
		line-height: 1;
	}

	
.firstMovie .scrollDown {
	bottom: 15px;
	width: 55px; height: 19px;
	-webkit-background-size: cover;
	background-size: cover;
}
}



.firstMovie .control{ font-size: 0; position: absolute; bottom: 210px; left: 0; right: 0; margin: 0 auto; width: 170px; text-align: center;}
.firstMovie .control li{ display: inline-block; padding: 0 5px;}
.firstMovie .control li a{ display: block; font-size: 18px; color: #fff; width: 40px; height: 40px; line-height: 35px; border-radius: 50%; border: 2px solid #fff; text-align: center;}
.firstMovie .control li i{ color: #fff;}

.firstMovie .control .play-pause a.hide{ display: none;}
.firstMovie .control .mute-onoff a.hide{ display: none;}
.vidbox .ratio, .end-video .vimeoWrap {pointer-events: none;}
/* #ivideo1, #ivideo2, .lastmovie, #ivideo9{ pointer-events: none;} */
@media (max-width: 1024px){
    .firstMovie .control{ bottom: 80px;}
}
</style>

    <script>
            $('.control .play').addClass('hide');
            $('.control .pause').click(function(){
                $(this).addClass('hide');
                $('.control .play').removeClass('hide');
            });
            $('.control .play').click(function(){
                $(this).addClass('hide');
                $('.control .pause').removeClass('hide');
            });
            //mute-onoff
            $('.mute-onoff .muteon').addClass('hide');
            $('.mute-onoff .muteoff').click(function(){
                $(this).addClass('hide');
                $('.mute-onoff .muteon').removeClass('hide');
            });
            $('.mute-onoff .muteon').click(function(){
                $(this).addClass('hide');
                $('.mute-onoff .muteoff').removeClass('hide');
            });

        var elem = document.getElementById("ivideo");
        function openFullscreen() {
          if (elem.requestFullscreen) {
            elem.requestFullscreen();
          } else if (elem.mozRequestFullScreen) { /* Firefox */
            elem.mozRequestFullScreen();
          } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
            elem.webkitRequestFullscreen();
          } else if (elem.msRequestFullscreen) { /* IE/Edge */
            elem.msRequestFullscreen();
          }
        }
    
        function playerControl_play() {
            document.getElementById("ivideo").contentWindow.postMessage("play", "*");
        }
    
        function playerControl_pause() {
            document.getElementById("ivideo").contentWindow.postMessage("pause", "*");
        }
        function playerControl_muteOn(){
            document.getElementById("ivideo").contentWindow.postMessage("muteOn", "*");
        }
        function playerControl_muteOff(){
            document.getElementById("ivideo").contentWindow.postMessage("muteOff", "*");
        }

        
    </script>
</head>
<body>
	<div class="all_wrap">
		<!-- 메인 영상 -->
		<div id="firstMovie" class="cpage firstMovie">
			<div class="movie">
				<div class="vimeoWrap">
					<iframe id="ivideo" src="https://play.mbus.tv/17b18ab18993f3e9?autoplay&repeat&mute" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen allow=autoplay></iframe>
				</div>
				<div class="vimeo-area" id="vimeo-area"></div>
				<div class="vimeoSlogan" id="vimeoSlogan">
					<div class="slogan TRAN">
						<h1><a href="pension?cmd=MENU" style="text-shadow: black 0.2em 0.2em 0.2em; 
						color:white; font-size: 70px;">Green Stay</a></h1></br>
						<h1><a href="pension?cmd=MENU"" style="text-shadow: black 0.2em 0.2em 0.2em; 
						color:white; font-size: 30px;">Busan Emotional Stay</a></h1>
					</div>
					<!-- <a class="vimeo_play">
						<i class="fas fa-play"></i> <span>play video</span>
					</a> -->
				</div>
			</div>
		</div>
	</div>
	<%@include file="/view/reservenav.jsp"%>
   <%@include file="view/bottom.jsp"%>

</body>
</html>