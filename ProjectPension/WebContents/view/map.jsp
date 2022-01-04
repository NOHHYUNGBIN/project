<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>그린 스테이 찾아오시는 길</title>
<style>
   .text {
      background-color: F2F0E9;
   }
</style>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
<link rel="stylesheet" href="css/common.css">
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
   <%@include file = "/view/header.jsp" %>
   <h1 style = "text-align: center;font-family: 'Last Ninja', Impact, fantasy;">Map</h1>
   <h3 style = "text-align: center;font-family: 'Last Ninja', Impact, fantasy;">Busan Emotional Stay</h3>
   
   <div class="main">
      <div id="staticMap" style="width:100%;height:600px;"></div> 
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14e0ee17fccba4d3b79c7dde1536fabf"></script>
      <script>
         var markerPosition  = new kakao.maps.LatLng(35.13711950419067, 129.09897315882722); 

         // 이미지 지도에 표시할 마커입니다
         // 이미지 지도에 표시할 마커는 Object 형태입니다
         var marker = {
               position: markerPosition
         };
         var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
          staticMapOption = { 
              center: new kakao.maps.LatLng(35.13711950419067, 129.09897315882722), // 이미지 지도의 중심좌표
              level: 1, // 이미지 지도의 확대 레벨
              marker: marker // 이미지 지도에 표시할 마커 
          };    

         // 이미지 지도를 생성합니다
         var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
      </script>
      <div class="text" style="text-align: center;">
         <h1>그린스테이</h1>
         <p>
            도로명주소 : 부산 남구 수영로 299 루미너스타워<br>
            지번주소 : 부산 남구 대연동 73-18 루미너스타워<br>
            경성대,부경대역 6번 출구에서52m
            <hr>
            예약문의       : 010-2447-0114<br>
            카카오톡아이디 : ddangbiz
                  
            
         </p>
      </div>
   </div>
   <%@include file = "/view/bottom.jsp" %>
</body>
</html>