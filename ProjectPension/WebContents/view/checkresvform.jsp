<%@page import="cust.dao.CustomerDao"%>
<%@page import="java.util.List"%>
<%@page import="res.vo.ResVo"%>
<%@page import="res.dao.ResDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String cust = request.getParameter("custnum");
   String num = request.getParameter("resnum");
   int cust_num = 0;
   int res_num = 0;

   String logincheck = "";
   boolean login = false;
   
   if (num != null && cust != null) {
      res_num = Integer.parseInt(num);
      cust_num = Integer.parseInt(cust);
      ResDao rDao = new ResDao();
      List<ResVo> resList = rDao.getResCheck();   
   
      for (int i = 0; i < resList.size(); i++) {
   
         if (res_num == resList.get(i).getRes_num() && 
            cust_num == resList.get(i).getCust_num()) {
            login = true;
            break;
   
         } else {
            logincheck = "입력한 정보와 일치하는 예약이 없습니다";
         }
      }
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
<style>
*, *:before, *:after {
   -moz-box-sizing: border-box;
   -webkit-box-sizing: border-box;
   box-sizing: border-box;
}

body, html, .login_form {
   height: 100%;
}

body {
   background: #262626;
}

.login_form {
   display: -webkit-box;
   display: -moz-box;
   display: -ms-flexbox;
   display: -webkit-flex;
   display: flex;
   -webkit-box-flex: center;
   -moz-box-flex: center;
   -webkit-flex: center;
   -ms-flex: center;
   flex: center;
   -webkit-justify-content: center;
   -moz-justify-content: center;
   justify-content: center;
   -webkit-box-pack: center;
   -moz-box-pack: center;
   -ms-flex-pack: center;
   -webkit-align-items: center;
   align-items: center;
}

.login-wrapper {
   max-width: 500px;
   width: 100%;
}

.logo {
   text-align: center;
}

.logo img {
   max-width: 200px;
   width: 100%;
   margin: 1em auto 2em;
}

form {
   background: #000;
   padding: 2em 1em;
   font-family: helvetica, sans-serif;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
}

form label {
   color: #fff;
   margin: 0 3% 0.25em;
   display: block;
   font-family: helvetica, sans-serif;
}

form input {
   width: 94%;
   padding: 0.5em 0.25em;
   margin: 0 3% 1em;
   font-size: 1.2em;
   border: 2px solid #000;
   outline: none;
   -webkit-transition: all 0.25s;
   -moz-transition: all 0.25s;
   -ms-transition: all 0.25s;
   -o-transition: all 0.25s;
   transition: all 0.25s;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
}

form input.password {
   padding-right: 4rem;
}

form input:focus {
   border: 2px solid #1fd100;
}

form button {
   width: 94%;
   margin: 2em 3% 0;
   border: none;
   background: #1fd100;
   padding: 1em 0;
   font-size: 1.25em;
   clear: both;
   color: #000;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   outline: none;
   -webkit-transition: all 0.25s;
   -moz-transition: all 0.25s;
   -ms-transition: all 0.25s;
   -o-transition: all 0.25s;
   transition: all 0.25s;
   cursor: pointer;
}

form button:focus, form button:hover {
   background: #262626;
}

.hide-show {
   width: 94%;
   margin: -3.62em 3% 0 1.5%;
   position: relative;
   z-index: 5;
   display: none;
}

.hide-show span {
   background: #1fd100;
   font-size: 1em;
   padding: 0.5em;
   float: right;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
   <script>
window.onload = function() {
   var div1 = document.getElementById("div1");
   div1.innerHTML = "<%=logincheck%>";
   if (<%=login%>) {
      location.href = "pension?cmd=CHECKRESV&resnum="+<%=res_num%>+"&custnum="+<%=cust_num%>;
   }
}
   </script>
   <div class="login_form">

      <form method="post" action="/pension?cmd=CHECKRESVFORM">
         <h1 style="color: white; text-align: center;">GreenStay</h1>
         <h2 style="color: white; text-align: center;">예약확인</h2>
         <label for="resnum">예약번호</label> <input required name="resnum"
            id="resnum" type="number" autocapitalize="off" autocorrect="off" />

         <label for="custname">이름</label> <input required name="custname"
            id="custname" type="text" autocapitalize="off" autocorrect="off" />
         <label for="tel">연락처</label> <input required name="tel" id="tel"
            type="text" autocapitalize="off" autocorrect="off" />
         <div id="div1" style="color: white; text-align: center;"></div>
         <button type="submit">예약확인</button>
      </form>
   </div>
</body>
</html>