<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> <!--jQuery 불러오기-->
    <script>
        $(document).ready(function(){ 
            $("#buttonSubmit").on('click',function(){ // 제출 버튼 이벤트 지정
                $.ajax({
                    url: "./result.jsp", // 목적지
                    type: "POST", // HTTP Method
                    data: $("#theForm").serialize(), // 전송 데이터
                    dataType: 'json', // 전송 데이터 형식
                    success: function(res){ // 성공 시 실행
                        alert("성공");
                        $("#result_name").html(res.name);
                        $("#result_ph_number").html(res.ph_number);
                        $("#result_address").html(res.address);
                    },
                    error:function(er){ //실패 시 실행
                        alert("실패 원인 : " + er);
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form id="theForm">
        <table border="1">
            <tr>
                <th>이름</th>
                <td><input type="text" id="name" name="name"></td>
            </tr>
            <tr>
                 <th>번호</th>
                 <td><input type="text" id="ph_number" name="ph_number"></td>
            </tr>
                <th>주소</th>
                <td><input type="text" id="address" name="address"></td>
        </table>
        <br>
        <input id="buttonSubmit" type="button" value="제출">
    </form>
    <br>
    <table border="1">
        <tr>
            <th>[확인] 이름</th>
            <td style="width: 200px;"><span id="result_name"></span></td>
        </tr>
        <tr>
            <th>[확인] 번호</th>
            <td><span id="result_ph_number"></span></td>
        </tr>
            <th>[확인] 주소</th>
            <td><span id="result_address"></span></td>
    </table>
</body>
</html>