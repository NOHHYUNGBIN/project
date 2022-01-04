<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="admin/DBConnection.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
   var g5_bbs_skin_url = "https://www.suu.kr/skin/board/booking";
</script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
#mara_view {
   text-align: center;
   width: 80%;
   margin: auto;
}

#mara_view H2 {
   margin: 20px 0px 10px 0px;
}

#mara_view .explain {
   margin: 0;
   height: auto;
   padding: 10px 10px 10px 30px;
   border: 1px solid #ebebeb;
   background: #fafafa;
   line-height: 1.6em;
}

#mara_view .explain li {
   margin: 0;
   padding: 0;
}

#mara_view .explain span {
   color: #ff0000;
}

#mara_view table {
   text-align: center;
   width: 100%;
   margin: 10px 0px 20px 0px;
   
}


#mara_view th {
   height: 30px;
   width: 10px;
   font-size: 12px;
   color: white;
   text-align: right;
   background: black;
   border: 1px solid #cccccc;
   padding: 8px 10px 8px 0px;
}

#mara_view td {
   font-size: 12px;
   width: 40px;
   text-align: left;
   border: 1px solid black;
   padding: 8px 10px 8px 10px;
   background: #eeeeee;
}
</style>
<body>
   <h1
      style="text-align: center; font-family: 'Last Ninja', Impact, fantasy;">Green
      Stay</h1>
   <h3
      style="text-align: center; font-family: 'Last Ninja', Impact, fantasy;">예약내역</h3>

   <div id="mara_view">
      <table>
         <%
         int res_num = Integer.parseInt(request.getParameter("resnum"));
         int cust_num = Integer.parseInt(request.getParameter("custnum"));

         sql = "select to_char(v.in_date,'yyyy-mm-dd')in_date,r.room_num,r.room_name,c.cust_name,c.tel,v.cost,v.checked ";
         sql += "from reserve v left join customer c ";
         sql += "on v.cust_num = c.cust_num ";
         sql += "left join room r ";
         sql += "on v.room_code = r.room_code ";
         sql += "where v.res_num = ? and c.cust_num = ? ";

         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, res_num);
         pstmt.setInt(2, cust_num);
         ResultSet rs = pstmt.executeQuery();

         String tagbtn = "";
         boolean btncheck = false;

         while (rs.next()) {
            String check = Integer.toString(rs.getInt("checked"));

            switch (check) {
            case "0" :
            tagbtn += "<button type='submit' id='btn_cancel' class='btn_submit'>";
            tagbtn += "<i class='fa fa-check' aria-hidden='true'></i> 예약취소 ";
            tagbtn += "</button>";
            check = "미결제";
            btncheck = true;
               break;
            case "1" :
            check = "결제완료";
               break;
            case "2" :
            check = "예약취소";
               break;
            case "3" :
            check = "예약취소";
               break;
            }
         %>

         <tbody>
            <tr>
               <th>예약번호</th>
               <td><%=res_num%></td>
            </tr>
            <tr>
               <th>예약일자</th>
               <td><%=rs.getString("in_date")%></td>
            </tr>
            <tr>
               <th>객실</th>
               <td><%=rs.getString("room_name")%></td>
            </tr>
            <tr>
               <th>예약자명</th>
               <td><%=rs.getString("cust_name")%></td>
            </tr>
            <tr>
               <th>연락처</th>
               <td><%=rs.getString("tel")%></td>
            </tr>
            <tr>
               <th>총 결제금액</th>
               <td><%=rs.getInt("cost")%></td>
            </tr>
            <tr>
               <th>진행상태</th>
               <td><%=check%></td>
            </tr>
            <%
            }
            rs.close();
            pstmt.close();
            conn.close();
            %>
         </tbody>
      </table>

      <div id="button_zone">
         <div id="button_zone">
            <button type="button" id="btn_gohome" class="btn_submit">
               <i class='fa fa-check' aria-hidden='true'></i> 홈으로
            </button>
            <button type="button" id="btn_close" class="btn_submit" onclick="self.close()">
               <i class='fa fa-check' aria-hidden='true'></i> 닫기
            </button>
	        <%=tagbtn%>

         </div>
      </div>
   </div>
   <script>
   window.onload = function() {
      if(<%=btncheck%>) {
         var btn_cancel = document.getElementById("btn_cancel");
         btn_cancel.onclick = function() {
            
            var confirmflag = confirm("정말 예약을 취소하시겠습니까?");
            if(confirmflag) {
               location.href = "/pension?cmd=CANCELRESV&resnum="+<%=res_num%>+"&custnum="+<%=cust_num%>;
            }
         }
      }
      
      var btn_gohome = document.getElementById("btn_gohome");
      btn_gohome.onclick = function() {
         location.href = '/pension?cmd=MENU';
      }

   }
</script>
</body>
</html>