<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>방명록 수정</title>
  <style>
    .container {
      width: 30%;
      margin: 1px auto;
      padding: 30px; /* 제목과 표 사이의 간격을 늘림 */
      border: 2px solid #444;
      border-radius: 10px;
    }
    
    table {
      width: 100%;
      margin-top:20px; /* 표와 버튼 사이의 간격을 추가 */
    }
    
    th, td {
      padding: 5px;
      text-align: center;
      border: 1px solid #444;
    }
    
    input[type="text"],
    input[type="email"],
    input[type="password"],
    textarea {
      width: 100%;
      box-sizing: border-box;
      padding: 8px;
    }
    
    .mint-text {
      color: #00BFA5;
    }
    
    .button-container {
      text-align: center;
      margin-top: 20px;
    }
    
    button {
      padding: 10px 30px;
      font-size: 16px;
      background-color: #009EE2;
      color: white;
      border: none;
      border-radius: 4px;
      margin: 10px;
    }
    
    h2 {
      text-align: center;
    }
    
    textarea {
      width: 100%;
      height: 250px;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>방명록 수정</h2>
   <form method="post" action="/guest.nhn?action=updateguest&aid=<%= request.getParameter("aid") %>" onsubmit="return validateForm()">
      <table>
        <tr>
          <th class="mint-text" style="width: 10%;">작성자</th>
          <td style="width: 20%;"><input type="text" name="name" value="<%= request.getParameter("name") %>"></td>
        </tr>
        <tr>
          <th class="mint-text" style="width: 10%;">이메일</th>
          <td style="width: 20%;"><input type="text" name="email" value="<%= request.getParameter("email") %>"></td>
        </tr>
        <tr>
          <th class="mint-text" style="width: 10%;">제목</th>
          <td style="width: 20%;"><input type="text" name="content" value="<%= request.getParameter("content") %>"></td>
        </tr>
        <tr>
          <th class="mint-text" style="width: 10%;">비밀번호</th>
          <td style="width: 20%;"><input type="text" id="password" name="password" value="<%= request.getParameter("password") %>"></td>
        </tr>
        <tr>
          <td colspan="2">
             <textarea id="message" name="message"><%= request.getParameter("message")%></textarea>
          </td>
        </tr>
      </table>

      <div class="button-container">
        <!-- form 내부의 필드들을 추가해주세요 -->
        <button type="submit">수정</button>
        <button type="button" onclick="clearFields()">삭제</button>
        <button onclick="goBack()">목록</button>
      </div>
    </form>
    
	<script>
	    
	  function goBack() {
		history.back();
		}
	  
	  function validateForm() {
	    var name = document.getElementsByName("name")[0].value;
	    var email = document.getElementsByName("email")[0].value;
	    var content = document.getElementsByName("content")[0].value;
	    var password = document.getElementById("password").value;
	    
	    if (name === '' || email === '' || content === '' || password === '') {
	      alert("모든 필드를 입력해주세요.");
	      return false;
	    }
	  }
	  	
	  function clearFields() {
	    document.getElementsByName("name")[0].value = "";
	    document.getElementsByName("email")[0].value = "";
	    document.getElementsByName("content")[0].value = "";
	    document.getElementById("password").value = "";
	    document.getElementById("message").value = "";
	  }
		  
	</script>
    
  </div>
</body>

</html>


