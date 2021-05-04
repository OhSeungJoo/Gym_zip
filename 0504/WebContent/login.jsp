<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String msg = (String)session.getAttribute("msg");
    session.removeAttribute("msg");

%>
<!DOCTYPE html>
<!--20201220 작성
  작성자 : 오승주
  로그인 페이지를 작성 -->
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Gym.zip</title>
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/notosanskr.css">
    <link rel="stylesheet" href="css/footer.css">
	
    <style>

        body{
            font-family: "Noto Sans KR",sans-serif;
        }


        /*container의 위치 정의*/
        #container{

            width: 660px;
            /*height:350px;*/

            position : relative;

            /*수평 가운데 정렬*/
            left:50%;
            margin-left: -330px;

            /*윗 부분 공간 주기*/
            margin-top: 50px;



        }
        /*.container style end*/
        
        #footer.fixed {
		   position: fixed;
		   bottom:0;
		  
		}

        /*로고 부분 정의 (로고 이미지, 텍스트)*/
        .logo{
            background-color: rgb(249,27,78);
            color: #fff;

            width:660px;
            height:50px;




            line-height: 50px;

            font-weight: 700;
            font-size: 30px;

        }
        /* .logo style end*/

        /*로고 이미지*/
        .logo img{
            /*float: left;*/
            position:absolute;
            margin-left:245px;

        }
        /* .logo img end*/

        /*로고 텍스트*/
        .logo h1{
			color:#fff;
            width:120px;
            height:50px;
            line-height: 50px;
            margin-left:295px;
        }
        /* .logo h1 end*/


        /*이메일을 입력하는 라벨과 비밀번호를 입력하는 라벨에 관한 스타일 지정*/
        #inputEmail label, #inputPassword label{
            display: block;
        }
        /* #input lable, #input Password label end*/

        /*이메일 라벨*/
        #inputEmail label{
            margin-top: 50px;
            margin-bottom:5px;
        }
        /*#inputEmail label end*/

        /*이메일 입력, 비밀번호 입력*/
        #inputEmail input, #inputPassword input{
            border: 1px solid rgb(249,27,78);
            height:30px;
            width:300px;
        }
        /*#inputEmail input*/

        /*비밀번호 라벨*/
        #inputPassword label{
            margin-top: 10px;
            margin-bottom: 5px;
        }
        /*#inputPassword label end*/

        /*로그인 폼 */
        #login{
            margin:20px;
            width: 400px;
            height:300px;

        }
        /* #login end */

        /* 로그인 버튼*/
        #loginBtn {
            /*버튼의 크기를지정*/
            width: 100px;
            height: 100px;
            /*----------------*/
            position: absolute;
            top: 120px;
            left: 450px;

            font-size: 25px;
            font-weight: 700;
            color: #fff;
            background-color: rgb(249, 27, 78);

            border: none;


        }
        /* #loginBtn end*/

        /*로그인 실패시 문구*/
        #login p{
            font-size: 10px;
            color:#f00;
            /*display: none;*/
            /*    일단은 안보이게 지정해놓고 나중에 입력한 결과가 디비에 없을 경우 이 디스플레이 속성을 활성화 한다.*/
        }
        /* #login p end*/



        /*회원가입하기, 아이디찾기, 비밀번호 찾기*/
        #bottom{
            position:absolute;

            top:300px;
        }
        /*#bottom end*/


        /*회원가입하기, 비밀번호 찾기 버튼*/
        #bottom button{
            width:330px;
            height:50px;

            color:rgb(249,27,78);
            background-color: #fff;

            border: 1px solid rgb(249,27,78);

            font-family: "Noto Sans KR",sans-serif;
            font-weight: 500;
        }
        /*#buttom button end*/




        #inputEmail, #inputPassword,#subText{
            margin-left: 40px;
        }



    </style>
</head>
<body>

<div id="container">


    <!--로고 이미지와 텍스트를 출력 한다.  -->
    <div class="logo">
        <a href="/main.jsp"><img  src="img/logo_white.png" width="50"><h1> GYM.zip</h1></a>
    </div>
    <!--    -->

    <!-- 로그인 폼을 작성한다. 폼요소 안에는 이메일 비밀번호
    로그인 버튼, 회원가입, 아이디 찾기, 비밀번호 찾기 버튼이 있다.
    이 페이지는 로그인 페이지 이므로 폼요소의 메서드는 post 방식을 사용하며
    폼요소에 입력된 데이터를 처리하는 곳은 login.do 라는 곳에서 하도록 한다.
    -->
    <form id="login" method="post" action="/login.do">

        <!--이메일 입력-->
        <div id="inputEmail">
            <label for="email">이메일</label>
            <input id="email" name="email" type="email">
        </div>
        <!--inputEmail end-->

        <!-- 비밀번호 입력-->
        <div id="inputPassword">
            <label for="password">비밀번호</label>
            <input id="password" name="password" type="password">
        </div>
        <!--inputPassword end-->

        <!--이메일이나 비밀번호가 일치하지 않을 경우 문구 표기-->
        <%if(msg!=null) {%>
        <p id="subText"><%=msg%></p>
        <!-- -->
		<%} %>
        <!--로그인 버튼-->
        <button id="loginBtn">로그인</button>
        <!--loginBtn end-->

    </form>
    <!--login form end-->
    <!--회원가입, 로그인, 비밀번호 찾기
    일렬로 나열할 예정이므로 하나로 묶음-->
    <div id="bottom">
       <a href="/join.jsp"><button id="join" type="button">회원가입</button></a><!--
    --><button id="findPW" type="button">비밀번호찾기</button>
    </div>
    <!--bottom end-->


</div>
<!-- container end -->
<script src="js/jquery.js"></script>
<%@include file="/WEB-INF/template/footer.jsp" %>
<script>
    // 로그인 버튼 누르면 서버 가서 이메일 비밀번호 일치하는 지 찾아보고 없으면

           // $("#subText").css("display","block");




</script>
</body>
</html>