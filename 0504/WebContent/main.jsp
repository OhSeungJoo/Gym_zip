<%@page import="com.joa.sht.gym_zip.vo.Coach"%>
<%@page import="com.joa.sht.gym_zip.vo.Exercise"%>
<%@page import="com.joa.sht.gym_zip.dao.ExerciseDAO"%>
<%@page import="com.joa.sht.gym_zip.dao.LectureDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.Lecture"%>
<%@page import="com.joa.sht.gym_zip.dao.CoachDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.CoachMain"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%--<%@ include file="/WEB-INF/template/member.jsp" %> --%>  
  
  
  <%

        	// 인기 코치 추천 
                  List<CoachMain> coachs=CoachDAO.coachMainSelect();
                  
                  // end 인기 코치 추천
                  
                  
                  // 인기 강의 추천 
                  List<Lecture> lectures=LectureDAO.selectLectureMainList();
                  // end 인기 강의 추천
                  
                  
                  //인기 운동 추천
                  List<Exercise> exercises=ExerciseDAO.selectMainExerciseList();
                  
        %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Gym.zip</title>
    <link rel="icon" href="/img/img/logo_coral.ico">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/header.css">
    <script src="js/jquery.js"></script>
    <style>
        .wrap #mainHeader{
            margin: auto;
            background-repeat: no-repeat;
            background-size: 1100px;
            height: 620px;
            width: 1100px;
            position: relative;
        }
        #mainHeaderBox{
            background-image: url("img/main.png");
            background-size: cover;
            background-color: red;
            background-repeat: no-repeat;
            background-position: center;
        }
        #mainHeader .main_logo{
            height: 50px;
            /*background-color: red;*/
            display: inline;
            margin-left: 10px;
            margin-top: 25px;
        }
        .main_logo img{
            width: 50px;
            height: 50px;
            margin-left: 100px;
            /*background-color: yellow;*/
            display: block;
            float: left;
        }
        .main_logo>a{
            color: #fff;
            font-weight: 700;
            margin-top: 25px;
            /*background-color: blue;*/
            height: 50px;
            font-size: 25px;
            line-height: 50px;
            clear: both;
            text-shadow: 0 0 10px #424242;
        }
        a{
            text-decoration: none;
        }
        .navi{
            left:435px;
            top: 25px;
            position: absolute;
            display: inline;
            /*background-color: blue;*/
        }
        .navi a{
            /*border: 1px solid #424242;*/
            font-weight: 700;
            font-size: 20px;
            color: #ffffff;
            width: 50px;
            text-align: center;
            padding: 0px  10px;
        }
        .login{
            position: absolute;
            right: 30px;
            top:25px;
            display: inline;
            /*background-color: yellow;*/
        }
        .login>a{
            font-size: 20px;
            font-weight: 700;
            color: #ffffff;
        }
        #search{
            position: absolute;
            left: 550px;
            margin-left: -150px;
            margin-top: 30px;
            width: 300px;
            background-color: white;
            border: 1px solid #424242;
            border-radius: 50px;
            box-shadow: 0 16px 28px 0 rgba(0, 0, 0, 0.22), 0 25px 55px 0 rgba(0, 0, 0, 0.21);
        }
        #search input{
            width: 200px;
            height: 25px;
            border: none;
            margin-left: 20px;
        }
        #search button{
            border: none;
            margin-right: 10px;
        }
        .scroll{
            position: absolute;
            bottom: 10px;
            left: 550px;
            font-size: 40px;
            font-weight: 700;
            cursor: pointer;
            transition: .2s ease;
        }
        .scroll:hover{
            color: #fff;
            transform: scale(1.1);
        }
        #mainHeader>span{
            position: absolute;
            left: 750px;
            bottom: 200px;
            width: 250px;
            font-size: 40px;
            color: white;
            font-weight: 900;
        }
        #mainHeader>span>p{
            margin-bottom: 15px;
        }
        /*코치, 강의, 운동에 관한 이미지(추천)*/
        .coach_img, .lecture_img, .exercise_img{
            width: 210px;
            height:140px;
            background-color: black;
            border-radius: 10%;
        }
        /* .coach_img, .lecture_img, .exercise_img end*/


        /* 추천 리스트 (코치, 강의, 운동)에 관한 전체 박스 (이미지와 강사이름) */
        #coach ul li, #lecture ul li, #exercise ul li{
            float:left;
            margin-right: 30px;
            height:210px;


            border-bottom: 1px solid #e0e0e0;

            border-radius: 5% 5% 0 0;
        }
        /* #coach ul li, #lecture ul li, #exercise ul li end*/


        /*추천리스트(코치4개, 강의4개, 운동4개 전체를 포함)*/
        #coach ul, #lecture ul, #exercise ul{
            height:210px;
            margin-bottom: 40px;
            margin-top: 20px;
        }
        /*#coach ul, #lecture ul, #exercise ul end*/


        /*추천 리스트내의 코치 이름, 강의 이름, 운동 이름*/
        #coach .coach_name, #lecture .lecture_name, #exercise .exercise_name{
            text-align: center;
            width:210px;
            height:40px;
            line-height: 40px;
            margin-top: 15px;
        }
        /*#coach .coach_name, #lecture .lecture_name, # exercise .exercise_name end*/

        /*모든 a요소에 관한 공통 스타일 정의*/
        a{
            text-decoration: none;
            color: #424242;
            font-weight: bold; /* notosans로 바꾸기 */
        }
        /* a end*/

        /* 전체를 감싸는 컨테이너에 관한 스타일 정의 */
        #container{
            width:960px;
            margin: 50px auto;
            padding-left: 30px;
            position: relative;
        }
        /* #container end*/


        #container h6{
            font-weight: bold;
        }
        #container h6 button{
            width:90px;
            height:30px;
            right: 45px;
            position: absolute;
            color: #fff;
            background-color: rgb(249,25,78);
            border: none;
        }
        #msgBox {
		    margin:10px;
		    position: relative;
		    text-align: center;
		    color:#fff;
		    font-size:21px;
		    font-weight: 900;
		}
        
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div class="wrap">
    <div id="mainHeaderBox">
        <div id="mainHeader"><!-- 전체를 감싸는 wrapper -->
            <div class="main_logo">
                <a href="main.jsp"><img src="img/logo_white.png"/>GYM.zip</a>
            </div>
            <div class="navi">
                <a href="/exercise_main.jsp">운동</a><!--
         --><a href="/lectureList.jsp">강의</a><!--
         --><a href="/coachList.jsp">코치</a><!--
         --><a href="https://www.tonal.com/">BM</a>
            </div>
            <div class="login">
            <%if(loginMember==null) {%>
                <a href="/login.jsp">로그인</a>
            <%}else{%>
                <a href="/logout.do">로그아웃</a>
            <%} %>
            </div>
            <div id="search" class="">
                <input placeholder="검색 시작하기"/>
                <button>검색</button>
            </div>
            <span>
            <p>이제, 운동은</p>
            <p>집 안에서</p>
        </span>
            <div class="scroll">
                <i class="fas fa-angle-double-down"></i>
            </div>
        </div>
    </div>



    <!--인기 코치, 강의, 운동을 감싸는 컨테이너-->
    <div id="container">
        <!-- 인기 코치 추천-->
        <div id="coach">
            <h6>인기 코치 추천<button id="" type="button"  onclick = "location.href = '/coachList.jsp' ">더보기</button></h6>


            <!--=====================================================================================================-->
            <!--서비스 내의 인기 코치 4명을 추천한다.  -->
            <ul>
                <%for(CoachMain coach:coachs) {%>
                <li>
                    <a href="/coach_mypage.jsp?no=<%=coach.getNo()%>"> <!-- 해당 코치의 상세 페이지로 이동하게 한다.-->
                        <div class="coach_img"><img src="/img/member/<%=coach.getProfile()%>" width=210 height=140></div>
                        <div class="coach_name"><%=coach.getNickname() %></div>
                    </a>
                </li>
             	<%} %>
                

            </ul>
            <!--coach ul end  -->
        </div>
        <!--coach end -->
        <!--================================================================================================================-->


        <!--================================================================================================================-->
        <!--인기 강의 추천-->
        <div id="lecture">
            <h6>인기 강의추천<button id="" type="button"  onclick = "location.href = '/lectureList.jsp' " >더보기</button></h6>


            <%-- 서비스 내의 인기 강의 4개를 추천한다.  --%>
            <ul>
                <%for(Lecture lecture:lectures){ %>
                <li>
                    <a href="/lecture_detail.jsp?no=<%=lecture.getNo()%>"><!--해당 강의의 상세 페이지로 이동하게 한다. -->
                        <div class="lecture_img">
                        <img src="/img/thumbnail/<%=lecture.getThumbnail()%>" width=210 height=140
                         onerror="this.src='/img/thumbnail/<%=lecture.getNo()%>'+'.JPG';"></div>
                        <div class="lecture_name">
                        <%if(lecture.getTitle().length()>10){%>
 						<script>
 							$(".lecture_name").css("line-height","110%");
 						</script>	
                      	<%} %>
                        
                        <%=lecture.getTitle() %></div>
                    </a>
                </li>
                <%} %>
                <!--1번째 강의 end -->

               
            </ul>
            <!--lecture ul end-->
        </div>
        <!--lecture end-->
        <!--================================================================================================================-->

        <!--================================================================================================================-->
        <!-- 인기 운동 추천 -->
        <div id="exercise">
            <h6>인기 운동추천 <button id="" type="button" onclick = "location.href = '/exercise_main.jsp' ">더보기</button></h6>



            <!--서비스 내의 인기 운동 4개를 추천한다.  -->
            <ul>
            <%for(Exercise exercise:exercises) {%>
                <li>
                    <a href="/coach_mypage.jsp?no=<%=exercise.getCoachNo()%>"><!--해당 운동을 등록한 코치 페이지로 이동  -->
                        <div class="exercise_img">
                        <img src="/img/exercise/<%=exercise.getThumbnail()%>" width=210 height=140></div>
                        <div class="exercise_name"><%=exercise.getName() %></div>
                    </a>
                </li>
                <%} %>
              
            </ul>
            <!--exercise ul end-->
        </div>
        <!--exercise end  -->
        <!--================================================================================================================-->
    </div>
    <!--container end-->
   	<%@ include file="/WEB-INF/template/footer.jsp" %>
    
</div><!-- wrap end -->

<script>

	

	$("#header").addClass('hidden');
    $(".scroll").on("click", function () {
        var scrollPosition = $("#container").offset().top;
        // alert(scrollPosition);
            scrollPosition-=110;
        $('html, body').animate({
            scrollTop: scrollPosition
        }, 500);
        
    });
  	<!-- header.js -->
    var headerOffset = $('#header').offset();
    $(window).scroll( function() {
        if($( document ).scrollTop() > 0){
            $('#header').addClass('header_fixed');
            $("#header").removeClass('hidden');

        }else{
            $('#header').removeClass('header_fixed');
            $("#header").addClass('hidden');
            $(".drop_box").hide();
        }
    });

    $("body").on("click",function(e) {
        if(!$(e.target).hasClass("drop") && !$(e.target).hasClass("profile_btn") &&!$(e.target).hasClass("profile_i") &&!$(e.target).hasClass("profile_span")) {
            $(".drop_box").hide();
            // $(".drop_box").toggleClass("hidden");
        }
    });
    $(".profile_btn").on("click",function () {
        $(".drop_box").toggle();
        // $(".drop_box").removeClass("hidden");
    });<!-- header.js end -->


</script>
</body>
</html>