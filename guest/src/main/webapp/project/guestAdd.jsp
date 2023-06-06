<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>방명록 입력</title>
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
    input[type="text"],
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
    <h2>방명록 입력</h2>
  	<form method="post" action="/guest.nhn?action=addguest" onsubmit="return validateForm()">
    <table>
        <tr>
            <th class="mint-text" style="width: 10%;">작성자</th>
            <td style="width: 20%;"><input type="text" id="name" name="name"></td>
        </tr>
        <tr>
            <th class="mint-text" style="width: 10%;">이메일</th>
            <td style="width: 20%;"><input type="email" id="email" name="email"></td>
        </tr>
        <tr>
            <th class="mint-text" style="width: 10%;">제목</th>
            <td style="width: 20%;"><input type="text" id="content" name="content"></td>
        </tr>
        <tr>
            <th class="mint-text" style="width: 10%;">비밀번호</th>
            <td style="width: 20%;"><input type="text" id="password" name="password"></td>
        </tr>
        <tr>
            <td colspan="2">
                <textarea id="message" name="message"></textarea>
            </td>
        </tr>
    </table>
  	
	    <div class="button-container">
	             <!-- form 내부의 필드들을 추가해주세요 -->
	        <button type="submit">입력</button>
	        <button type="reset">취소</button>
	        <button onclick="goBack()">목록</button>
	    </div>
	 </form>
	</div>
	<script>
	  function goBack() {
	    history.back();
	  }
	  
	  function validateForm() {
		    var name = document.getElementById("name").value;
		    var email = document.getElementById("email").value;
		    var content = document.getElementById("content").value;
		    var password = document.getElementById("password").value;
		    var message = document.getElementById("message").value;
		    
		    if (name === "" || email === "" || content === "" || password === "" || message === "") {
		      alert("입력칸을 모두 채워주세요.");
		      return false;
		    }
		    
		    return true;
		  }
	</script>
	
</body>


</html>


