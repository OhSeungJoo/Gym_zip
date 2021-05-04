<%@page import="com.joa.sht.gym_zip.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	
	Member loginMember = (Member)session.getAttribute("loginMember");

%>
<!--header start -->
<div id="header">
    <div class="aux">
        <h1 class="logo">
            <a href="main.jsp"><img src="/img/logo_coral.png"><strong> GYM.zip</strong></a>
        </h1>

        <div class="search_box">
            <div>
                <input class="search_text" />
                <button class="search_btn"><i class="fas fa-search"></i></button>
            </div>
        </div>

        <div class="header_nav">
            <ul>
                <li><a href="/exercise_main.jsp" >운동</a></li>
                <li><a href="/lectureList.jsp" >강의</a></li>
                <li><a href="/coachList.jsp" >코치</a></li>
                <li> <a href="https://www.tonal.com/" >BM</a></li>
            </ul>
        </div>

        <div class="global_profile">
            <button class="profile_btn"><i class="fas fa-user profile_i"></i><span class="profile_span">▼</span></button>
             <div class="drop_box ">
       <ul>
           <li ><a href="" class="drop">마이페이지</a></li>
           <li ><a href="/training_room.jsp" class="drop">트레이닝룸</a></li>
           <%if(loginMember!=null) {%>
           <li ><a href="/coach_mypage.jsp?no="<%=loginMember.getNo() %> class="drop">코치모드</a></li>
           <li ><a href="/logout.do" class="drop">로그아웃</a></li>
           <%}else{%>
           <li ><a href="/login.jsp" class="drop">로그인</a></li>
           <%} %>
       </ul>
   </div>
        </div>
    </div>
</div> <!--header END-->
<div id="headerSearchBackgroundBox">
    <div id="headerSearchBox">
        <div id="headerSearchTop">
            <i class="fas fa-times"></i>
        </div>
        <div id="headerSearchInputBox">
            <input id="headerSearchInput">
        </div>
        <div id="headerSearchMain">
            <div id="exerciseSearchArea">
                <ul id="headerExerciseSearchList">
                
                </ul>
            </div><!--
         --><div id="lectureAndCoachSearchArea">
                <div id="lectureSearchArea">
                    <ul id="headerLectureSearchList">
                       
                    </ul>
                </div>
                <div id="coachSearchArea">
                    <ul id="headerCoachSearchList">
                       
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/template" id="exerciseSearchHeaderTmpl">
    <@ _.each(exerciseList, function(element){@>
        <li class="exercise_search_item"><a href="/exercise_listl.jsp?no=<@=element.exerciseNo@>&exerciseNo=<@=element.no@>"><@=element.name @></a></li>
    <@ }) @>
</script>
<script type="text/template" id="lectureSearchHeaderTmpl">
    <@ _.each(lectures, function(lecture){@>
        <li class="lecture_search_item"><a href="/lecture_detail.jsp?no=<@=lecture.no@>"><@=lecture.title @></a></li>
    <@ }) @>
</script>
<script type="text/template" id="coachSearchHeaderTmpl">
    <@ _.each(coaches, function(coach){ @>
        <li class="coach_search_item"><a href="/coach_mypage.jsp?no=<@=coach.no@>"><@=coach.nickname @></a></li>
    <@ }) @>
</script>
<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>
   // 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
   _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
   const $exerciseSearchHeaderTmp = _.template($("#exerciseSearchHeaderTmpl").html());
   const $lectureSearchHeaderTmp = _.template($("#lectureSearchHeaderTmpl").html());
   const $coachSearchHeaderTmp = _.template($("#coachSearchHeaderTmpl").html());
   const $headerSearchInput = $("#headerSearchInput");
   const $searchBox =$(".search_box");
   $searchBox.on("click",function(){
	   $("#headerSearchBackgroundBox").css("display"," block");
	   $headerSearchInput.focus();
	   $("html").css("overflow", "hidden");
   });
   $headerSearchInput.on("keyup",function () {
	  // $headerSearchInput.attr("disabled","disabled");
       let keyword = $headerSearchInput.val().replace(/\s{2,}/g," ");
       let keywordArray=keyword.split(" ");
       console.log(keywordArray);
       let searchKeyword={
           "keywordArray":keywordArray
       };
       
       $.ajax({
           url:'/keywordSearch.json',
           type:'get',
           data:searchKeyword,
           error:function () {
               alert("서버 점검 중~~")
           },
           success:function (json) {
               console.log(json);
               json=JSON.parse(json);
               console.log(json["exercise"]);
               $("#headerExerciseSearchList").html($exerciseSearchHeaderTmp({exerciseList:json["exercise"]}));
               console.log(json["lecture"]);
               $("#headerLectureSearchList").html($lectureSearchHeaderTmp({lectures:json["lecture"]}));
               console.log(json["coach"]);
               $("#headerCoachSearchList").html($coachSearchHeaderTmp({coaches:json["coach"]}));
              // $headerSearchInput.attr("disabled","false");
           }
       });
   });
   $("#headerSearchTop i").on("click",function () {
      $("#headerSearchBackgroundBox").css("display","none");
      $("html").css("overflow-y", "scroll")
   });
</script>


