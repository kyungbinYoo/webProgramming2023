<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
  table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
    border: 3px solid lightgray;
    background-color: #00D1A3;
  }

  th, td {
    border: 3px solid lightgray;
    padding: 8px;
  }

  thead {
    background-color: #f0f0f0;
  }

  tbody {
    background-color: #00D1A3;
  }

  h2 {
    text-align: center;
  }

  .button-container {
    text-align: center;
    margin-top: 20px;
  }

  .button-container button {
    padding: 10px 30px;
    font-size: 16px;
    background-color: #009EE2;
    color: white;
    border: none;
    border-radius: 4px;
  }
</style>
<body>
    <h2>방명록 목록</h2>
    <table>
      <thead>
        <tr>
          <th>번호</th>
          <th>이름</th>
          <th>이메일</th>
          <th>날짜</th>
          <th>제목</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="guest" items="${guestlist}" varStatus="status">
          <tr>
            <td>${guest.aid}</td>
            <td>${guest.name}</td>
            <td>${guest.email}</td>
            <td>${guest.date}</td>
            <td><a href="project/guestUpdate.jsp?aid=${guest.aid}&name=${guest.name}&email=${guest.email}&content=${guest.content}&message=${guest.message}&password=${guest.password}">${guest.content}</a></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <div class="button-container">
      <button onclick="location.href='project/guestAdd.jsp'">등록</button>
    </div>

</body>
</html>
