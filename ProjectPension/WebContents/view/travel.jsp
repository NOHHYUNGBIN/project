<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css">
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

<style>
.travel {
   position: relative;
   margin: 0 auto;
   padding: 120px 0;
   width: 100%;
   max-width: 1400px;
   overflow: hidden;
}

.travel_wrap {
   position: relative;
   margin-top: 80px;
   font-size: 0;
   overflow: hidden;
}

.travel-swiper .swiper-button-next {
   top: auto;
   bottom: 10px;
   right: 10px;
}

.travel-swiper .swiper-button-prev {
   top: auto;
   bottom: 10px;
   right: 75px;
   left: auto;
}

.travel_wrap .list {
   position: relative;
   display: inline-block;
   margin: 0 40px 120px 0;
   width: calc(50% - 40px);
   vertical-align: top;
}

.travel_wrap .list:last-child {
   margin-bottom: 0;
}

.travel_wrap .list .loader {
   height: 372px;
}

.travel_wrap .list .info {
   position: relative;
   text-align: right;
}

.travel_wrap .list .info .title {
   position: relative;
   display: inline-block;
   margin-top: 40px;
   padding-bottom: 7px;
   font-size: 20px;
   font-weight: bold;
   color: #333;
}

.travel_wrap .list .info .title::after {
   content: '';
   position: absolute;
   right: 0;
   bottom: 0;
   left: 0;
   width: 100%;
   height: 2px;
   background-color: #a67244;
}

.travel_wrap .list .info .content {
   position: relative;
   margin-top: 30px;
   font-size: 14px;
   line-height: 20px;
   color: #666;
   letter-spacing: -0.05em;
   word-break: keep-all;
}

/* 吏앹닔   */
.travel_wrap .list:nth-child(even) {
   margin: 100px 0 0 40px;
}

.travel_wrap .list:nth-child(even) .info {
   text-align: left;
}

@media ( max-width : 1024px) {
   .travel .section_title .ttl {
      font-size: 40px;
   }
   .travel .section_title .txt {
      font-size: 14px;
   }
   .travel {
      padding: 60px 15px;
   }
   .travel_wrap {
      margin-top: 40px;
   }
   .travel-swiper .swiper-button-next {
      bottom: 5px;
      right: 5px;
   }
   .travel-swiper .swiper-button-prev {
      bottom: 5px;
      right: 37px;
   }
   .travel_wrap .list, .travel_wrap .list:nth-child(even) {
      margin: 0 0 40px 0;
      width: 100%;
   }
   .travel_wrap .list:last-child {
      margin-bottom: 0;
   }
   .travel_wrap .list .loader {
      height: auto;
      padding-top: 56.25%;
   }
   .travel_wrap .list .info, .travel_wrap .list:nth-child(even) .info {
      text-align: center;
   }
   .travel_wrap .list .info .title {
      display: block;
      margin-top: 20px;
      padding-bottom: 10px;
      font-size: 15px;
   }
   .travel_wrap .list .info .title::after {
      height: 1px;
   }
   .travel_wrap .list .info .content {
      margin-top: 20px;
      padding: 0 15px;
      font-size: 13px;
      line-height: 17px;
   }
}
</style>
</head>
<body>
   <%@include file="/view/header.jsp"%>
   <h1 style = "text-align: center;font-family: 'Last Ninja', Impact, fantasy;">Travel</h1>
   <h3 style = "text-align: center;font-family: 'Last Ninja', Impact, fantasy;">Recommend from Green</h3>
   
   <div class="all_wrap">

      <div class="cpage travel" id="travel">
         <div class="section_title"></div>

         <div class="travel_wrap">
            <div class="list">
               <div class="swiper-container travel-swiper">

                  <div id="carouselExampleFade" class="carousel slide carousel-fade"
                     data-bs-ride="carousel">
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <img src="/image/travel/01-01.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                        <div class="carousel-item">
                           <img src="/image/travel/01-02.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                     </div>
                     <button class="carousel-control-prev" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                     </button>
                     <button class="carousel-control-next" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                     </button>
                  </div>
               </div>

               <div class="info">
                  <div class="title">케이블카</div>
                  <div class="content">
                     통영 미륵산에 설치된 통영케이블카는 한국에서 유일한 2선(bi-cable) 자동순환식 곤돌라 방식으로 스위스의
                     최신기술에 의해 설치되었으며, 그 길이도 1975m로 국내 일반관광객용 케이블카 중에서는 가장 길다고 합니다.<br>또한,
                     8인승 곤돌라 48대가 연속적으로 탑승객을 운송함으로써 지체 없이 탑승이 가능하며, 가까운 사람끼리 오붓하게 아름다운
                     한려수도의 경치를 감상할 수 있습니다.
                  </div>
               </div>
            </div>
            <div class="list">
               <div class="swiper-container travel-swiper">
                  <div id="carouselExampleFade" class="carousel slide carousel-fade"
                     data-bs-ride="carousel">
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <img src="/image/travel/02-01.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                        <div class="carousel-item">
                           <img src="/image/travel/02-02.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                     </div>
                     <button class="carousel-control-prev" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                     </button>
                     <button class="carousel-control-next" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                     </button>
                  </div>
               </div>

               <div class="info">
                  <div class="title">루지</div>
                  <div class="content">
                     스카이라인 루지 통영은 통영시와 바다, 그리고 주변의 섬들까지도 조망 할 수 있는 아름다운 풍경을 여러분께
                     선사합니다. 미륵산 정상까지 운행하는 통영케이블카 하부터미널 건너편에 위치해 있습니다.<br>스카이라인 루지
                     통영은 모든 연령대의 이용객들에게 즐거움으로 가든 찬 실외활동을 제공하며, 대한민국에서는 유일하게 통영에서만 만나보실
                     수 있습니다.
                  </div>
               </div>
            </div>
            <div class="list">
               <div class="swiper-container travel-swiper">
                  <div id="carouselExampleFade" class="carousel slide carousel-fade"
                     data-bs-ride="carousel">
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <img src="/image/travel/03-01.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                        <div class="carousel-item">
                           <img src="/image/travel/03-02.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                     </div>
                     <button class="carousel-control-prev" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                     </button>
                     <button class="carousel-control-next" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                     </button>
                  </div>
               </div>


               <div class="info">
                  <div class="title">어드벤처</div>
                  <div class="content">
                     통영 어드벤처 타워는 15m 고공에서 즐기는 익스트림 레포츠 시설입니다.<br>국내 최초의 최대 규모
                     시설이며, 100명이 동시에 90여 개의 익사이팅 코스를 경험할 수 있습니다.<br>학생 수련, 단체
                     워크숍으로 모험심을 기르고 팀워크를 다지는 좋은 기회가 될 것입니다.
                  </div>
               </div>
            </div>
            <div class="list">
               <div class="swiper-container travel-swiper">
                  <div id="carouselExampleFade" class="carousel slide carousel-fade"
                     data-bs-ride="carousel">
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <img src="/image/travel/04-01.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                     </div>
                     <button class="carousel-control-prev" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                     </button>
                     <button class="carousel-control-next" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                     </button>
                  </div>
               </div>

               <div class="info">
                  <div class="title">중앙시장</div>
                  <div class="content">
                     통영중앙시장은 한려수도의 관문인 통영에 위치한 전통시장입니다.<br>동피랑벽화마을과 강구안 문화마당 등 유명
                     관광 명소와 가까이 있어 관광객들과 지역 주민을 상대로 활어를 비롯해 다양한 물품들을 판매하고 있습니다.
                  </div>
               </div>
            </div>
            <div class="list">
               <div class="swiper-container travel-swiper">
                  <div id="carouselExampleFade" class="carousel slide carousel-fade"
                     data-bs-ride="carousel">
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <img src="/image/travel/05-01.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                     </div>
                     <button class="carousel-control-prev" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                     </button>
                     <button class="carousel-control-next" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                     </button>
                  </div>
               </div>

               <div class="info">
                  <div class="title">서호시장</div>
                  <div class="content">
                     통영항 여객선 터미널 앞에 위치해 있으며(면적 4,512㎡), 일제 시대에 일본인이 바다를 매립한 곳으로<br>일본에서
                     귀국한 동포들의 임시주거지로 삼았으며 이들이 아침 시간대에 상행위를 하면서 점차 사설시장으로 자리 잡았습니다.
                  </div>
               </div>
            </div>
            <div class="list">
               <div class="swiper-container travel-swiper">
                  <div id="carouselExampleFade" class="carousel slide carousel-fade"
                     data-bs-ride="carousel">
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <img src="/image/travel/06-01.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                        <div class="carousel-item">
                           <img src="/image/travel/06-02.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                        <div class="carousel-item">
                           <img src="/image/travel/06-03.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                     </div>
                     <button class="carousel-control-prev" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                     </button>
                     <button class="carousel-control-next" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                     </button>
                  </div>
               </div>


               <div class="info">
                  <div class="title">동피랑&서피랑</div>
                  <div class="content">'동피랑'이란 이름은 '동쪽 벼랑'이라는 뜻이다. 구불구불한 오르막
                     골목길을 따라 강구항이 한눈에 내려다보이는 동피랑마을에 오르면 담벼락마다 그려진 형형색색의 벽화가 눈길을 끕니다.
                     세병관 서쪽 끝에 위치한 고지대 벼랑을 '서피랑'이라 부르는데 이곳은 박경리 선생의 글귀가 적힌 99계단과 벽화 등을
                     볼 수 있습니다.</div>
               </div>
            </div>
            <div class="list">
               <div class="swiper-container travel-swiper">
                  <div id="carouselExampleFade" class="carousel slide carousel-fade"
                     data-bs-ride="carousel">
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <img src="/image/travel/07-01.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                        <div class="carousel-item">
                           <img src="/image/travel/07-02.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                     </div>
                     <button class="carousel-control-prev" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                     </button>
                     <button class="carousel-control-next" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                     </button>
                  </div>
               </div>

               <div class="info">
                  <div class="title">이순신공원</div>
                  <div class="content">
                     옛날 임진왜란 당시에 왜적소탕에 큰 역할을 했던 천자총통이 바다를 바라보며 서있고, 바다를 향해 손짓하고 있는
                     이순신동상의 모습도 매우 인상적입니다. 거북선의 조각과 토피어리 등 볼 거리가 많고 한적합니다.<br>나지막한
                     산책로와 목재데크로 아름답고 편안한 느낌을 줍니다.<br>바다와 함께 어우러져 자연을 즐기며 시간을 보내는
                     것도 좋을 것입니다.
                  </div>
               </div>
            </div>
            <div class="list">
               <div class="swiper-container travel-swiper">
                  <div id="carouselExampleFade" class="carousel slide carousel-fade"
                     data-bs-ride="carousel">
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <img src="/image/travel/08-01.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                        <div class="carousel-item">
                           <img src="/image/travel/08-02.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                     </div>
                     <button class="carousel-control-prev" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                     </button>
                     <button class="carousel-control-next" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                     </button>
                  </div>
               </div>

               <div class="info">
                  <div class="title">달아공원</div>
                  <div class="content">지형이 코끼리 어금니와 닮았다고 해서 달아라는 이름이 붙었는데 현재는
                     달구경하기 좋은 곳이라는 뜻으로 쓰인다고 합니다. 아름다운 산양일주도로에는 동백나무 가로수가 있어서 동백로라고도
                     불리며, 다도해의 절경을 즐기기에 매우 좋은 곳입니다.</div>
               </div>
            </div>
            <div class="list">
               <div class="swiper-container travel-swiper">
                  <div id="carouselExampleFade" class="carousel slide carousel-fade"
                     data-bs-ride="carousel">
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <img src="/image/travel/09-01.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                        <div class="carousel-item">
                           <img src="/image/travel/09-02.jpg" class="d-block w-100"
                              alt="...">
                        </div>
                     </div>
                     <button class="carousel-control-prev" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                     </button>
                     <button class="carousel-control-next" type="button"
                        data-bs-target="#carouselExampleFade" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                     </button>
                  </div>
               </div>
               <div class="info">
                  <div class="title">해저터널</div>
                  <div class="content">터널입구에 용문달양은 용문을 거쳐 산양에 통한다는 뜻이라고 한다.
                     아스콘으로 포장된 터널의 경사면을 따라 내려가면 바가 수면쯤에서부터 전등이 켜져 있고 조금 더 내려가면 굽이를 트는
                     지점부터 오른쪽 벽면에 와이드 칼라 홍보판 12개 중 3개의 홍보판이 그 당시의 역사를 말없이 보여주고 있습니다.</div>
               </div>
            </div>
         </div>
      </div>

   </div>

   <script>
      $(".travel-swiper").each(function(index, element) {
         var $this = $(this);
         $this.addClass('instance-' + index);

         var rooms_swiper = new Swiper('.instance-' + index, {
            slidesPerView : 1,
            loop : false,
            watchOverflow : true,
            navigation : {
               nextEl : '.instance-' + index + ' .swiper-button-next',
               prevEl : '.instance-' + index + ' .swiper-button-prev',
            },
            pagination : {
               el : '.instance-' + index + ' .swiper-pagination',
               clickable : true
            },
         });
      });
   </script>
   <%@include file="/view/bottom.jsp"%>

</body>
</html>