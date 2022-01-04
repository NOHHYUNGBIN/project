<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
int roomnum = Integer.parseInt(request.getParameter("room_num"));
String date = request.getParameter("date");
String[] date2 = date.split(" ");
int year = Integer.parseInt(date2[0]);
int month = Integer.parseInt(date2[1]);
int day = Integer.parseInt(date2[2]);
Date rdate = new Date(year-1900, month - 1, day);
int wkday = rdate.getDay();
String rdate2 = year + "-" + month + "-" + day;
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
   var g5_bbs_skin_url = "https://www.suu.kr/skin/board/booking";

</script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
   href="https://www.suu.kr/skin/board/booking/style.css">
<link rel="stylesheet"
   href="https://www.suu.kr/css/default.css?ver=200723">
<link rel="stylesheet" href="https://www.suu.kr/css/carway.css">


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
<script>
var room = null;
   $(function(){
      $.ajax({
         url : '/getresform',
         data : { roomnum : <%=roomnum%>  },
         success : function(json){
            console.log(json)
            room = json;
            
            /*$("#date").html("<%=year%>년 <%=month%>월 <%=day%>일");*/
            $("#rdate").val("<%=rdate2%>");
            console.log($("#rdate").val())
            var today = new Date();
	        if(<%=year%><=today.getFullYear()&&<%=month%><=today.getMonth()+1&&<%=day%><=today.getDate()){
	           		alert("선택하신 날짜는 예약을 할 수 없습니다.")
	           		history.back();
	            }
            $("#roomcode").val(room[0].room_num+"호 "+room[0].room_name);

			
            if(<%=wkday%>>4){
               $("#roomcost").val(room[0].room_weekend_cost );
               $("#cost").val(room[0].room_weekend_cost );
               
            } else{
               $("#roomcost").val(room[0].room_week_cost );
               $("#cost").val(room[0].room_week_cost);
            }
            if(room[0].room_code > 4 ){
               $("#person").attr('max', 4);
            }
            
            room[0].room_code = document.querySelector('[name=room_code]');
            console.log($("#room_code").val())
            
            
         },
         error : function(xhr){
            alert(xhr.status +" : "+xhr.statusText)
         }
      })
      
   });

</script>



</head>
<body>

   <%@ include file="/view/header.jsp"%>

   <h1
      style="text-align: center; font-family: 'Last Ninja', Impact, fantasy;">Reserve</h1>
   <h3
      style="text-align: center; font-family: 'Last Ninja', Impact, fantasy;">Busan
      Emotional Stay</h3>
   <div id="popup_msg"></div>
   <!-- 팝업메세지 -->
   <div id="dialog_m" style="display: none; z-index: 1000;">
      <iframe id="ifm_m" width="100%" height="99%" marginwidth="0"
         marginheight="0" frameborder="0" scrolling="auto"></iframe>
   </div>

   <!-- 콘텐츠 시작 { -->
   <div id="wrapper">
      <div id="container_wide">
         <div style="width: 100%; text-align: center; margin-bottom: 20px;">
            <div class="row row-cols-1 row-cols-md-3 g-9">
               <div class="col">
                  <div class="card h-100">
                     <img src="image/<%=roomnum%>/01.jpg" class="card-img-top" alt="...">
                  </div>
               </div>
               <div class="col">
                  <div class="card h-100">
                     <img src="image/<%=roomnum%>/02.jpg" class="card-img-top" alt="...">
                  </div>
               </div>
               <div class="col">
                  <div class="card h-100">
                     <img src="image/<%=roomnum%>/03.jpg" class="card-img-top" alt="...">
                  </div>
               </div>
               <div class="col">
                  <div class="card h-100">
                     <img src="image/<%=roomnum%>/04.jpg" class="card-img-top" alt="...">
                  </div>
               </div>
               <div class="col">
                  <div class="card h-100">
                     <img src="image/<%=roomnum%>/05.jpg" class="card-img-top" alt="...">
                  </div>
               </div>
               <div class="col">
                  <div class="card h-100">
                     <img src="image/<%=roomnum%>/06.jpg" class="card-img-top" alt="...">
                  </div>
               </div>
               <div class="col">
                  <div class="card h-100">
                     <img src="image/<%=roomnum%>/07.jpg" class="card-img-top" alt="...">
                  </div>
               </div>
               <div class="col">
                  <div class="card h-100">
                     <img src="image/<%=roomnum%>/08.jpg" class="card-img-top" alt="...">
                  </div>
               </div>
               <div class="col">
                  <div class="card h-100">
                     <img src="image/<%=roomnum%>/09.jpg" class="card-img-top" alt="...">
                  </div>
               </div>
               <div class="col">
                  <div class="card h-100">
                     <img src="image/<%=roomnum%>/10.jpg" class="card-img-top" alt="...">
                  </div>
               </div>
               <div class="col">
                  <div class="card h-100">
                     <img src="image/<%=roomnum%>/11.jpg" class="card-img-top" alt="...">
                  </div>
               </div>
               <div class="col">
                  <div class="card h-100">
                     <img src="image/<%=roomnum%>/12.jpg" class="card-img-top" alt="...">
                  </div>
               </div>
            </div>
         </div>
         <!-- skin : booking -->


         <div id="mara_view">
            <form name="fwrite" id="mara_write" action="pension?cmd=RESV"
               onsubmit="#" method="POST" autocomplete="off" style="width: 100%">



               <ol class="explain" style="font-size: 13px;">
                  <li>[입,퇴실안내]<br> ∙ 입실시간 15:00 / 퇴실시간 11:00<br> ∙ 퇴실
                     시 퇴실점검 부탁드립니다.<br> ∙ 12시부터 15시까지 펜션 청소시간이므로 펜션의 원활한 운영을 위해
                     시간을 꼭 지켜주세요
                  </li>
                  <br>
                  <li>[인원추가요금]<br> ∙ 기준인원 초과시 1인당 추가비용 : 성인20,000원
                     (현장결제가능)<br> ∙ 각 객실마다 정해진 최대수용인원 초과를 엄격히 금하며, 예약된 인원외에는 펜션에
                     입실 할 수 없습니다
                  </li>
                  <br>
                  <li>[예약안내]<br> ∙ 업체연락처는 예약과 동시에 고객님의 휴대폰으로 자동발송됩니다<br>
                     ∙ 예약 전 취소수수료를 꼭 확인바랍니다
                  </li>
               </ol>

               <table>
                  <colgroup>
                     <col width="13%" />
                     <col width="37%" />
                     <col width="13%" />
                     <col width="37%" />
                  </colgroup>
                  <tbody>
                     <tr>
                        <th>예약일자</th>
                        <td colspan="3" id="date"><i class='fa fa-clock-o'
                           aria-hidden='true'></i> <input type="text" name="rdate"
                           class="wr_1" id="rdate" value="<%=rdate2%>" readonly /></td>
                     </tr>
                     <tr>
                        <th>객실</th>
                        <td colspan="3" id="roomname"><i class='fa fa-clock-o'
                           aria-hidden='true'></i> <input type="text" name="room_code"
                           class="wr_1" id="roomcode" readonly /></td>
                     </tr>
                     <tr>
                        <th>객실금액</th>
                        <td colspan="3"><i class='fa fa-clock-o'
                           aria-hidden='true'></i> <input type="number" name="wr_1"
                           class="wr_1" readonly id="roomcost" />원</td>
                     </tr>
                     <tr>
                        <th>예약자명</th>
                        <td colspan="3" class="name"><input type="text" name="name"
                           value="" id="wr_name" class="required" required></td>
                     </tr>
                     <tr>
                        <th>연락처</th>
                        <td colspan="3" class="hp_num"><input type="text"
                           name="tel" value="" id="wr_homepage" class="required" required
                           placeholder="예 : 01011112222"> <span class="frm_info">
                              ( 연락가능한 번호를 입력해 주세요. )</span></td>
                     </tr>
                     <tr>
                        <th>생년월일</th>
                        <td colspan="3"><input type="date" name="birth"
                           class="wr_subject required" value="2000-01-01" required
                           placeholder="예 : 951212"></td>
                     </tr>
                     <tr>
                        <th>추가인원 수</th>
                        <td colspan="3"><input type="number" name="headcount"
                           class="wr_4 required" value="0" max="2" min="0"
                           onchange="payplus(this.value)" id="person">
                           <div id="div1"></div></td>
                     </tr>
                     <tr>
                        <th>추가금액</th>
                        <td colspan="3"><input type="text" name="personpay"
                           readonly value="0" size="10">
                     </tr>
                     <tr>
                        <th>총 결제금액</th>
                        <td colspan="3"><input type="number" name="totalpay"
                           readonly value="" size="10" id="cost">
                     </tr>

                  </tbody>
               </table>
               <script>
                  function payplus(person) {
                     var wr_person = document.querySelector('[name=headcount]');
                     if(wr_person.value > wr_person.max) {
                        alert("선택한 객실의 추가인원수를 확인해주세요");
                        //var div1 = document.getElementById('div1');
                        //div1 = "선택한 객실의 추가인원수를 확인해주세요";
                        return;   
                     } 
                     var pay = person * 20000;
                     var personpay = document.querySelector('[name=personpay]');
                     personpay.value = pay;
                     
                     var totalpay = document.querySelector('[name=totalpay]');
                     //totalpay.value = 150000; // 넘어오는 펜션 가격으로 초기화되야함.
                     totalpay.value = parseInt(roomcost.value) + parseInt(personpay.value);                     
                  }
                  
               </script>
               <ul class="explain" style="font-size: 13px;">
                  <li>[객실 이용시 유의사항]<br> ∙ 각 객실에서는 금연구역으로 고객님의 안전을 위하여
                     화재경보기가 설치되어 있습니다.<br> ∙ 쾌적한 공간이용을 위하여 실내에서의 튀김, 생선요리, 고기 등
                     기름기가 많은 음식조리를 금합니다.<br> ∙ 화재의 위험성이있어 펜션내에서의 불꽃놀이, 촛불사용은 절대
                     금지이므로 양해 바랍니다.<br> ∙ 조용한 휴식을 위한 공간이라 예약자외 지인의 방문이나 초대가 안되므로
                     양해 바랍니다.<br> ∙ BBQ를 이용하실수 있는 공간은 객실앞 전용테라스이며 가능시간대 17:00-
                     21:00 입니다.<br>

                  </li>
                  <br>
                  <li>[입금 전 확인사항]<br> ∙ 입금 후 예약취소시 고객센터로 연락을 하셔서 환불안내를
                     받으시기 바랍니다.<br> ∙ 환불기준은 아래와 같으므로 신중하게 예약을 취소하시기 당부드립니다.<br>
                     <br>
                     <dl>
                        <dt>※환불 수수료</dt>
                        <dd>
                           <div class="refund">
                              <table>
                                 <thead>
                                    <tr>
                                       <td>이용당일</td>
                                       <td>1일전</td>
                                       <td>2일전</td>
                                       <td>3일전</td>
                                       <td>4일전</td>
                                       <td>5일전</td>
                                       <td>6일전</td>
                                       <td>7일전</td>
                                       <td>8일전</td>
                                       <td>9일전</td>
                                       <td>10일전</td>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                       <td>0%</td>
                                       <td>10%</td>
                                       <td>20%</td>
                                       <td>30%</td>
                                       <td>40%</td>
                                       <td>50%</td>
                                       <td>60%</td>
                                       <td>70%</td>
                                       <td>80%</td>
                                       <td>90%</td>
                                       <td>90%</td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                        </dd>
                     </dl>
                  </li>
               </ul>


               <h4>※개인정보처리방침안내</h4>
               <table id="tbl_agree">
                  <caption>개인정보처리방침안내</caption>
                  <colgroup>
                     <col width="50%" />
                     <col width="25%" />
                     <col width="25%" />
                  </colgroup>
                  <thead>
                     <tr>
                        <th>목적</th>
                        <th>항목</th>
                        <th>보유기간</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>이용자 식별 및 본인여부 확인</td>
                        <td>이름, 생년월일</td>
                        <td>본인요청 또는 사이트폐쇄시까지</td>
                     </tr>
                     <tr>
                        <td>고객서비스 이용에 관한 통지, CS대응을 위한 이용자 식별</td>
                        <td>기본정보(이름,연락처,생년월일)</td>
                        <td>본인요청 또는 사이트폐쇄시까지</td>
                     </tr>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th colspan="3"><input type="checkbox" name="agree"
                           id="agree" value="Y" required /> <label for="agree">
                              (필수)환불기준 및 유의사항을 확인하였으며, 위 내용에 동의합니다.</label></th>
                     </tr>
                  </tfoot>
               </table>

               <div id="button_zone">
                  <button type="submit" id="btn_submit" class="btn_submit">
                     <i class='fa fa-check' aria-hidden='true'></i> 예약하기
                  </button>
                  <button type="button" class="btn_cancel"
                     onclick="pension?cmd=CALENDAR">
                     <i class='fa fa-remove' aria-hidden='true'></i> 뒤로가기
                  </button>
               </div>
            </form>
         </div>

      </div>
   </div>


   <%@ include file="/view/bottom.jsp"%>

</body>
</html>