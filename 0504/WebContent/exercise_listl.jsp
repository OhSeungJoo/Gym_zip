<%@page import="com.joa.sht.gym_zip.vo.Member"%>
<%@page import="com.joa.sht.gym_zip.vo.Step"%>
<%@page import="com.joa.sht.gym_zip.vo.Count"%>
<%@page import="com.joa.sht.gym_zip.vo.Exercise"%>
<%@page import="com.joa.sht.gym_zip.dao.ExerciseDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.joa.sht.gym_zip.dao.RepresentExercisesDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.RepresentExercise"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String noStr = request.getParameter("no");
	System.out.println(noStr);
	int exerciseNo;
	int reExNo = Integer.parseInt(noStr);
	System.out.println(reExNo);
	RepresentExercise reEx = RepresentExercisesDAO.selectOne(reExNo);
	int no,memEnergy;
	try{
			Member loginMember = (Member)session.getAttribute("loginMember");
			no = loginMember.getNo();
			memEnergy=loginMember.getMyEnergy();
	 } catch(Exception e){
		no=-1;
		memEnergy=0;
	 }
	try{
		String exerciseNoStr = request.getParameter("exerciseNo");
		exerciseNo=Integer.parseInt(exerciseNoStr);
	}catch(Exception e){
		exerciseNo=-1;
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>운동상세목록</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/subscribe_popUp.css">
    <style>
        html{
            overflow-y: scroll;
        }
        #container{
            width: 1100px;
            position: relative;
            margin: auto;
        }
        #filter{
            width: 100%;
            height: 200px;
            padding: 20px;
            border-bottom: 1px solid #e0e0e0;

        }
        #filter img{
            width: 160px;
            height: 160px;
            border-radius: 50%;
            float: left;
        }
        #exerciseTitle{
            margin: 50px;
            font-size: 30px;
            font-weight: 900;
            float: left;
        }
        #exerciseTitle>h2,#exerciseTitle>h3{
            margin: 20px 10px 0 0;
            font-size: 15px;
            float: left;
        }
        #exerciseTitle>h2{
            font-weight: 700;
        }
        #exerciseTitle>h3{
            font-weight: 700;
        }

        #content{
            float: left;
        }

       #content li{
            width: 300px;
            height: 300px;
            float: left;
            border-bottom: 1px solid #e0e0e0;
            margin: 30px;
            text-align: center;
            border-radius: 10px;
            cursor: pointer;
            box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
        }
        #content li div{
            float: left;
            line-height: 30px;
        }
        .exercise_thumbnail{
            width: 300px;
            height: 170px;
            border-radius: 10px 10px 0 0;
        }
        .exercise_kcal{
            width: 175px;
            font-weight: 700;
        }
        .exercise_difiiculty{
            width: 125px;
            color: rgb(249, 27, 78);
        }
        .exercise_title{
            padding-top: 5px;
            width: 300px;
            font-size: 15px;
            font-weight: 700;
            color: #000;
        }
        .exercise_kcal{
            color: #fff;
            background-color: rgb(249, 27, 78);
        }
        .exercise_coach,.exercise_coachTier{
            width: 150px;
        }
        .exercise_coach{
        	width:70%;
            color: rgb(249, 27, 78);
            text-align: right;
            font-size: 15px;
            font-weight: 600;
        }
        .exercise_coachTier{
        	width:30%;
            text-align: left;
            font-size: 10px;
            line-height: 15px;
        }
        #exerciseList>li:hover{
            opacity: .7;
        }
        .altong{
            padding-top: 5px;
            margin-left: 20px;
            width: 20px;
            height:20px;
            float: left;
        }
        .exercise_view,.exercise_sex{
            width: 40%;
        }
        .exercise_view{
            padding-left: 5px;
            text-align: left;
        }
        .exercise_sex{
            font-size: 20px;
        }
        .exercise_list_tab{
            width: 801px;
            height: 20px;
            position: relative;
            margin: 100px auto;
        }
        .active_tab li {
            width: 267px;
            height: 20px;
            float: left;
            text-align: center;
            cursor: pointer;
            border-bottom: 5px solid #424242;
        }
        .active_tab .on{
            color: #f91b4e;
            border-bottom: 5px solid #f91b4e;
        }
        #exerciseDetailBack{
            position: fixed;
            background-color: rgba(0,0,0,.75);
            left: 0;
            top: 0;
            width: 100%;
            height: 1000px;
            display: none;
            z-index: 1000;
        }
        #exerciseDetail{
            position: absolute;
            background-color: #fff;
            left: 50%;
            top: 50%;
            margin-left: -350px;
            margin-top: -490px;
            width: 700px;
            height: 690px;
        }
        #closeBtn{
            width: 30px;
            height: 30px;
            cursor: pointer;
            outline: none;
            border: none;
            background-color: transparent;
            font-size: 30px;
            margin-left: 650px;
            margin-top: 0;
        }
        #exerciseDetailHead{
            width: 700px;
        }
        #exerciseDetailHead h1{
            margin-left: 20px;
            font-size: 25px;
            font-weight: 700;
        }
        #exerciseDetailHead h3{
            color: rgb(249, 27, 78);
        }
        .difficulty_box{
            position: absolute;
            left: 50%;
            top: 30px ;
            border: 1px solid rgb(249, 27, 78);
            width: 80px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            color: rgb(249, 27, 78);
            font-weight: 700;
        }

        #viewCount{
            height: 50px;
            line-height: 25px;
        }
        #chkImg{
            width: 250px;
            height: 180px;
            float: left;
        }

        #exerciseInform td{
            width: 100px;
            font-size: 20px;
            padding: 20px;
        }
        #stickGraphArea{
            width: 500px;
            height: 120px;
            margin: 10px 100px;
        }
        /*단 CSS*/
        .bar {
            overflow: hidden;
        }

        /*단 수평블록 설정*/
        .bar_contents{
            float:left;
        }
        #lectureGenderRatio{
            width: 500px;
            height: 120px;
            left: 50%;
        }
        #chartHeader{
            width: 100%;
            height: 20%;
        }
        #boyRatio,#girlRatio{
            width: 15%;
            height: 100%;
            font-size: 14px;
            text-align: center;
        }
        #chartTitle{
            width:70%;
            height: 100%;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
        }
        #chartBody{
            width: 100%;
            height: 40%;
        }
        #boyEmotion,#girlEmotion{
            width: 15%;
            height: 100%;
            text-align: center;
            font-weight:bold;
            font-size: 40px;
        }
        #boyEmotion{
            color:blue;
        }
        #girlEmotion{
            color:#F91B4E;
        }
        #chartMainPart{
            width: 70%;
            height: 100%;
            background-color: #F91B4E;
        }
        #boyPart{
            height: 100%;
            background-color: blue;
        }
        #chartData{
            width: 100%;
            height: 20%;
        }
        #boyRatioData{
            width: 15%;
            height: 100%;
            text-align: left;
        }
        #chartData .empty_place{
            width: 70%;
            height: 100%;
            background-color: transparent;
        }
        #girlRatioData{
            width: 15%;
            height: 100%;
            text-align: right;
        }
        #chartKcal{
            width: 100%;
            height: 20%;
            color: #F91B4E;
            font-weight: bold;
        }
        #chartKcal #boyKcal{
            width: 20%;
            height: 100%;
            text-align: left;
        }
        #chartKcal .empty_place{
            width: 60%;
            height: 100%;
            background-color: transparent;
        }
        #chartKcal #girlKcal{
            width: 20%;
            height: 100%;
            text-align: right;
        }
        #profileArea{
            margin: auto;
            width: 660px;
            height: 110px;
            border-top: 1px solid #e0e0e0;
            border-bottom: 1px solid #e0e0e0;
            padding: 10px 20px;
            background-color: #e0e0e0;
            position: relative;
        }
        #profileImg{
            border-radius: 50%;
            width: 100px;
            height: 100px;
            margin: 5px;
        }
        #coachNameTier{
            position: absolute;
            left: 150px;
            top: 50px;
        }
        #profileArea .name{
            font-size: 25px;
            display: inline-block;
        }
        #profileArea .tier{
            font-size: 15px;
            display: inline-block;
        }
        .subscriber{
            position: absolute;
            color: #F91B4E;
            top: 80px;
            left: 150px;
        }
        #profileArea button{
            position: absolute;
            right: 20px;
            top: 50px;
            width: 100px;
            height: 40px;
            cursor: pointer;
            border-radius: 50px;
            border: 1px solid #F91B4E;
            color: #F91B4E;
            background-color: #fff;
        }

        #recommandLecturArea{
            text-align: center;
            margin: auto;
            padding: 10px;
        }
        #recommandLecturArea .btn{
            border: none;
            top: 0;
            width: 50px;
            height: 50px;
            margin-top: 15px;
            background-color: transparent;
            cursor: pointer;
            /*float: left;*/
            outline: none;
            position: absolute;
        }
        .prev{
            left: 0;
        }
        .next{
            right: 0;
        }
        #recommandLecturArea li{
            float: left;
        }
        #recomandLectureExpain{
            width: 700px;
            font-size: 20px;
            font-weight: 700;
            padding: 5px;
        }
        #recommandLecturArea img{
            width: 120px;
            height: 80px;
        }
        #box{
            width: 360px;
            height: 80px;
            left: 50px;
            position: relative;
            overflow: hidden;

        }
        #lectureList{
            width: 600px;
            height: 80px;
            position: absolute;
            transition: .6s ease;
        }
        #lectureScroll{
            position: relative;
            margin: auto;
            width: 460px;
        }
        #noneGraphBox{
        	width:100%;
        	height:100%;
        	background-color:#dddddd;
        	position:relative;
        }
        #noneTextBox{
        	width:300px;
        	height: 60px;
        	line-height: 60px;
        	text-align:center;
        	position:absolute;
        	margin: 30px 100px;
        	background-color:#aaaaaa;
        	font-size: 20px;
        	color:#fff;
        }
        #emptyBox{
        	width:100%;
        	height:100%;
        	background-color:#dddddd;
        	position:relative;
        }
        #emptyTextBox{
        	width: 60%;
        	height: 80px;
        	margin:auto;
        	line-height:80px;
        	font-weight: 700;
        	color:#ffffff;
        	text-align:center;
        }
        /*/////////////////////////////////////////////////////////////////////////////////////////////////*/
        #popUpBox{
            position: fixed;
            background-color: rgba(0,0,0,.75);
            left: 0;
            top: 0;
            width: 100%;
            height: 1000px;
            display: none;
            z-index: 2000;
        }
        
    </style>

</head>
<body>
<!--wrap 영역 -->
<div id="wrap">
	<%@ include file="/WEB-INF/template/header.jsp" %>
    <div id="container">
    <!-- fillter -->
    <div id="filter">
        <div>
            <img src=""/>
        </div><!-- 선택된 대표운동  -->
        <div id="exerciseTitle">
        <h1>#<%=reEx.getTitle() %></h1>
        <h2>운동수</h2><h3><%=reEx.getViewCount() %></h3>
        </div>
    </div>
    <!-- fillter end -->

    <!-- sort tab-->
    <div class="exercise_list_tab">
        <ul class="active_tab">
            <li class="on">칼로리순</li>
            <li>누적운동수</li>
            <li>최신등록순</li>
        </ul>
    </div><!-- sort tab end -->
    <div id="content">

        <!-- 운동 카드 리스트-->
        <ul id="exerciseList">
       
        </ul>  <!-- 운동 카드 리스트 end-->

    </div><!-- content end-->
    <div id="exerciseDetailBack">
        
    </div><!-- exerciseDetailBack end -->
	<div id="popUpBox">
		<!--구독팝업창-->
<div class="subscribe_pop_up">
    <div class="subscribe_title">
        구독
    </div>

    <!-- 문구 -->
    <div class="subscribe_text">
        <!-- 첫째줄  -->
        <div class="subtext first"><div class="coach_name">양치승이그렇게대단해</div>
            <div class="text">코치님의 운동영상을 구독하시겠습니까?</div></div>
        <!-- end 첫째 줄 -->

        <!-- 둘째줄 -->
        <p class="subtext second">구독시 트레이닝 룸에서 영상을 확인 하실 수 있습니다.</p>
        <!-- end 둘째줄 -->
    </div>
    <!--end 문구-->

    <!--에너지 표기-->
    <div class="energy_inform_box">
        <!--현재 에너지-->
        <div class="recent_energy energy">
            <div class="energy_title">현재에너지</div>
            <div class="energy_img_num">
                <div class="energy_img"></div>
                <div class="energy_num"><%=memEnergy %></div>
            </div>

        </div>
        <!--end 현재 에너지-->

        <!--구독 에너지-->
        <div class="subscribe_energy energy">
            <div class="energy_title">구독에너지</div>
            <div class="energy_img_num">
                <div class="energy_img"></div>
                <div class="energy_num">49</div>
            </div>
        </div>
        <!--end 구독 에너지-->

        <!--결제시 잔여 에너지-->
        <div class="result_energy energy">
            <div class="energy_title">결제시 잔여 에너지</div>
            <div class="energy_img_num">
                <div class="energy_img"></div>
                <div class="energy_num"><%=memEnergy-49 %></div>
            </div>

        </div>
        <!--end 결제시 잔여 에너지-->
    </div>
    <!--    end 에너지 표기-->

    <!--하단 버튼(취소, 구독하기)-->
    <div class="bottom_btn">
        <button class="cancel_btn">취소</button><!--
        --><%if(memEnergy>49 ){%><button class="ok_btn" data-no=-1>구독하기</button><%}else{ %><button class="charge_btn">충전하기</button><% }%>
    </div>
    <!--end 하단 버튼(취소, 구독하기)-->
</div>
<!--end 구독팝업창-->
	</div>
</div><!-- container end-->
</div><!-- wrap end-->

<script type="text/template" id=exerciseCardTmpl>
  <@ _.each(exerciseList, function(exercise) { @>
    <li data-no=<@=exercise.no @> >
            <img class="exercise_thumbnail" src="<@=exercise.thumbnail@>"/>
            <div class="exercise_kcal"><@=exercise.avgKcal@>Kcal</div>
            <div class="exercise_difiiculty"><@=exercise.levels@></div>
            <div class="exercise_title"><@=exercise.name@></div>
            <div class="exercise_coach"><@=exercise.coachNickname@></div>
            <div class="exercise_coachTier"><@=exercise.tierName@></div>
            <img src="img/곤욕몬.png" class="altong"/>
            <div class="exercise_view"><@=exercise.viewCount@></div>
			<div class="exercise_sex">
	        <@if(exercise.maleNum+exercise.femaleNum<10 ) { @>
	        	<@if(exercise.targetGender=="A") {@>
	            	<i class="fas fa-venus-mars"></i>
	            <@}else if(exercise.targetGender=="M"){@>
	            	<i class="fas fa-mars"></i>
	            <@}else{ @>
	            	<i class="fas fa-venus"></i>
	            <@} @>
	        <@} else { @>
	            <@if(exercise.maleNum/(exercise.maleNum+exercise.femaleNum) <= 0.3 ){ @>
	            	<i class="fas fa-venus"></i>
	            <@} else if(exercise.maleNum/(exercise.maleNum+exercise.femaleNum) >= 0.7 ){@>
	            	<i class="fas fa-mars"></i>
	            <@ } else { @>
	            	<i class="fas fa-venus-mars"></i>
	            <@ } @> 
	        <@ } @>
	      </div>
    </li>
 <@ } ) @>
</script>

<script type="text/template" id=exerciseDetailTmpl>
  <div id="exerciseDetail">
            <button id="closeBtn">X</button>
            <!-- 운동 제목관련 설명 -->
            <div id="exerciseDetailHead">
                <div id="exerciseExpalinArea">
                    <h1><@=e.exerciseDetail.name@></h1>
                    <div class="difficulty_box"><@=e.exerciseDetail.levels@></div>
                    <div id="viewCount">
                        <img class="altong" src="img/곤욕몬.png"><h3><@=e.exerciseDetail.viewCount@>회 운동</h3>
                    </div>
                </div><!--운동 제목관련 설명 end-->
                <img id="chkImg" src="img/<@=e.exerciseDetail.thumbnail@>">
                <!-- 운동 데이터 표 -->
				 <table id="exerciseInform">
                    <tr>
                        <td>횟수</td>
                        <td><@=e.exerciseDetail.exCount@>회</td>
                        <td>세트</td>
                        <td><@=e.exerciseDetail.setNum@>set</td>
                    </tr>
                    <tr>
                        <td colspan="2">소모 평균 칼로리</td>
                        <td colspan="2"><@=e.exerciseDetail.avgKcal@>kcal</td>
                    </tr>
                    <tr>
                        <td colspan="2">BM 사용여부</td>
						<@ if( e.exerciseDetail.bmOnOff  == "T" ) { @>
                        <td colspan="2">O</td>
						<@ } else { @>
                        <td colspan="2">X</td>
						<@ } @>
                    </tr>
                </table>
               
                <div>
                    <!-- 성비 막대그래프 영역-->
                    <div id="stickGraphArea">
						<@ if(e.exerciseDetail.viewCount > 9){ @>
                        <!-- 막대그래프 -->
                        <ul id="lectureGenderRatio">
                            <li id="chartHeader" class="bar">
                                <div id="boyRatio" class="bar_contents"><@=((e.exerciseDetail.maleNum/e.exerciseDetail.viewCount)*100).toFixed(0) @>%</div>
                                <div id="chartTitle" class="bar_contents">수강생 분포도</div>
                                <div id="girlRatio" class="bar_contents"><@=((e.exerciseDetail.femaleNum/e.exerciseDetail.viewCount)*100).toFixed(0) @>%</div>
                            </li>
                            <li id="chartBody" class="bar">
                                <div id="boyEmotion" class="bar_contents"><i class="fas fa-mars"></i></div>
                                <div id="chartMainPart" class="bar_contents bar">
                                    <div id="boyPart" class="bar_contents" style="width: <@=((e.exerciseDetail.maleNum/e.exerciseDetail.viewCount)*100).toFixed(0) @>%"></div>
                                </div>
                                <div id="girlEmotion" class="bar_contents"><i class="fas fa-venus"></i></div>
                            </li>
                            <li id="chartData" class="bar">
                                <div id="boyRatioData" class="bar_contents"><@=e.exerciseDetail.maleNum @>명</div>
                                <div class="empty_place bar_contents"> </div>
                                <div id="girlRatioData" class="bar_contents"><@=e.exerciseDetail.femaleNum @>명</div>
                            </li>
                            <li id="chartKcal" class="bar">
                                <div id="boyKcal" class="bar_contents"><@=e.exerciseDetail.maleKcal @>kcal</div>
                                <div class="empty_place bar_contents"> </div>
                                <div id="girlKcal"  class="bar_contents"><@=e.exerciseDetail.feKcal @>kcal</div>
                            </li>
                        </ul>
						<@ } else {@>
							<div id="noneGraphBox">
								<div id="noneTextBox">아직 통계가 되지 않았습니다.</div>
							</div>
						<@ } @>
                    </div>
                </div><!-- 막대그래프 end-->
            </div><!-- 그래프 영역 end -->
            <!-- 프로필 및 구독 -->
            <div id="profileArea">
                <div class="coach img">
                    <img id="profileImg" src="img/<@=e.exerciseDetail.coachImage @>">
                </div>
                <div>
                    <div id="coachNameTier">
                    <div class="coach name"><@=e.exerciseDetail.coachNickname @></div>
                    <div  class="coach tier"><@=e.exerciseDetail.tierName @></div>
                    </div>
                    <div class="subscriber">
                        <i class="fas fa-user-friends"></i> <@=e.subcribe.countResult @>명
                    </div>
					<@if(e.exerciseDetail.coachNo !=<%=no%>){ @>
						<@if(e.check.countResult == 0) { @>
                   		 	<button id="goSubscribe">구독하기</button>
						<@} else {@>
							<a href="/training_room.jsp"><button>운동가기</button></a>
						<@} @>
					<@ }@>
                </div>
            </div>
            <!-- 해당운동이 포함된 강의 추천 -->
            <div id="recommandLecturArea">
                        <div id="recomandLectureExpain">해당 운동이 포함된 강의</div>
                        <div id="lectureScroll">
							<@if(e.lectureList.length>0 ){ @>
								<@if(e.lectureList.length>3 ){ @>
                            		<button class="btn prev"><</button>
								<@}@>
                            	<div id="box">
                                	<ul id="lectureList"  style="width: <@=(e.lectureList.length * 120) @>px">
										<@ _.each(e.lectureList, function(lecture) { @><li><a href="/lecture_detail.jsp?no=<@=lecture.no @>"><img src="img/<@=lecture.thumbnail@>"></a></li><@ } ) @>
                               		</ul>
                            	</div>
								<@if(e.lectureList.length>3 ){ @>
                            		<button class="btn next">></button>
								<@ } @>
							<@} else { @>
								<div id="emptyBox">
									<div id="emptyTextBox">아직 운동이 사용된 강의가 없습니다.</div>
								<div>
							<@ } @>
                        </div>
            </div><!--recomandLecturArea end-->
   </div><!-- exerciseDetail end -->
</script>

<!-- script -->
<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script src="/js/header.js"></script>
<script>
	//mainIMG
	$mainImg = $("#filter img");
	 // 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    //운동템플릿
    const exerciseCardTmpl = _.template($("#exerciseCardTmpl").html());
    //운동상세템플릿
    const exerciseDetailTmpl = _.template($("#exerciseDetailTmpl").html());

    //운동목록(ul)
    const $exerciseList = $("#exerciseList");
	//운동상세박스
	const $exerciseDetailBack = $("#exerciseDetailBack");
	//운동 연관 강의 리스트
	const $lectureList = $("#lectureList");
	// 운동리스트이동제한
	let lectureListMovelimit = 0;
    //대표운동에 속하는 운동 총개수
    let maxNumberOfItem = 0;
    //소트인덱스 번호(기본값 0)
    let step=0;
    //페이지 번호(기본값 1)
    let page=1;
    //무한스크롤 추가 여부
    let loading = true;
    // 처음 페이지 로드시 작동
    getExerciseList();
    <% if( exerciseNo!=-1 ){%>
    	getExerciseDetail(<%=exerciseNo %>);
    <% } %>
    
    //소트에 따라서 강의목록을 불러오는 함수
    function getExerciseList() {
		let reEx = <%=reExNo%>;
		let jsonData ={
				"reEx": reEx,
				"step": step,
				"page": page
		}
		console.log(jsonData);
		$.ajax({
	        url:"/getExerciseCardListCount.json",
	        type:'get',
	        data:jsonData,
	        error:function() {
	            alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
	            loading=true;
	        },
	        success:function (json) {
	        	maxNumberOfItem = json.countResult;
	        	 $.ajax({
	 		        url:"/getExerciseCardList.json",
	 		        type:'get',
	 		        data:jsonData,
	 		        error:function() {
	 		            alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
	 		            loading=true;
	 		        },
	 		        success:function (json) {
	 		        	console.log(json);
	 		        	//maxNumberOfItem = json.countResult;
	 		        	if(page==1){
	 		        		$mainImg.attr("src", "url(/img/"+json[0].thumbnail+")");
	 		        	}
	 		        	$exerciseList.append(exerciseCardTmpl({exerciseList:json}));
	 		        	page++;
	 		        	
	 		        	if($('#exerciseList li').length == maxNumberOfItem){
	                		loading=false;//더이상 로딩 불가능
	                	}else{
	                		loading=true;
	                	}
	 		        }
	 	    	});//ajax end
	        	
	        }
   		});//ajax end
		
		
    }//getExerciseList end
	
    $(".active_tab li").on("click",function (e) {

        //1) 기존의 on 클래스를 제거
        $(".on").removeClass("on");

        // 2) 클릭한 그 li요소에 on 클래스를 더한다.
        $(this).addClass("on");
        //console.log($(this).index());
        //소트 인덱스 갱신
        step=$(this).index();
        //페이지 번호 초기화
        page=1;
        //무한스크롤도 가능하게 해주고
        loading = true;
        // 운동리스트 비우고
        $exerciseList.empty();
       	// 함수 호출을 해서 다시 갱신한다.
        getExerciseList();

    }); //.active_tab li click() end
    
    //해당 번호의 운동 상세를 불러오는 함수
    function getExerciseDetail(no){
    	let data={
    			"no":no,
    		};
   		$.ajax({
   			url:"/exerciseDetail.json",
   			type:'get',
   			data:data,
   			error:function(){
   				alert("서버점검중...");
   			},
   			success:function(json){
   				console.log(json);
   				console.log(json.exerciseDetail);
   				//운동 연관 강의리스트를 담을 ul의 크기 
   				lectureListMovelimit = json.lectureList.length *120;
   				$exerciseDetailBack.css("display","block");
   				$exerciseDetailBack.html(exerciseDetailTmpl({e:json}));
   				$("#popUpBox .coach_name").text(json.exerciseDetail.coachNickname);
   				$("#popUpBox .ok_btn").data("no",json.exerciseDetail.coachNo);
   			    $("html").css("overflow", "hidden");
   			}
   		});
    }
    
    $(document).on("click","#exerciseList li",function () {
		let no = $(this).data("no");
		console.log(no);
		// 함수 호출
		getExerciseDetail(no);
       
    })
	
    $(document).on("click","#closeBtn",function () {

        $("#exerciseDetailBack").css("display","none");
        $("html").css("overflow-y", "scroll")

    });

    let left=0;
    $(document).on("click",".prev",function (){
    	if(lectureListMovelimit<=360){
    		return;
    	} else{
    		if(left==((lectureListMovelimit*-1)+360)){
    			left=0;
    		}else{
    			left=left-120; 
    		}
    		 $("#lectureList").css("transform","translate("+left+"px,0px)")
    	}
    })
    $(document).on("click",".next",function (){
    	if(lectureListMovelimit<=360){
    		return;
    	} else{
    		if(left==0){
    			left=((lectureListMovelimit*-1)+360);
    		}else{
    			left=left+120;
    		}
    		$("#lectureList").css("transform","translate("+left+"px,0px)")
    	}
    })
   $(document).on("click","#goSubscribe",function(){
	   let memNo = <%=no%>;
	   console.log(memNo);
	   if(memNo != -1){
		   $("#popUpBox").css("display","block"); 
	   }else{
		   if(confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")){
			   location.href = "/login.jsp";
		   }
	   }
   });
 
    $(document).on("click","#popUpBox .cancel_btn",function(){
  	  $("#popUpBox").css("display","none"); 
     });
    $(document).on("click","#popUpBox .ok_btn",function(){
    	if(confirm("정말 구독하시겠습니까?")){
				$(this).attr("disabled","disabled");
    		   let coachNo=$(this).data("no");
    		   let memberNo = <%=no %>;
    		   let subscribeData = {
    				   "cno" : coachNo,
    				   "mno" : memberNo
    		   };
    		   console.log(subscribeData);
    		   $.ajax({
    				url:"/doSubscribe.json",
    				type:'post',
    				data:subscribeData,
    				error:function(){
    					alert("구독에 실패했습니다. 다시 시도해주세요");
      				   	$(this).attr("disabled","false");
    				},
    				success:function(json){
    					console.log(json);
    					if(json.result!=0){
    						location.href="/training_room.jsp"
    					}
    					location.href="/training_room.jsp"  
    				}
    			});
		}else{
			 $("#popUpBox").css("display","none");
		}
       });
    $(document).on("click","#popUpBox .charge_btn",function(){
    	if(confirm("충전을 위해 이동하시겠습니까?")){
    		location.href='/training_room.jsp'
    	}else{
    		 $("#popUpBox").css("display","none");
    	}
    });
	$(window).scroll(function(){
		if(page>1){
			if($(window).scrollTop()+200>=$(document).height() - $(window).height())
	        {
	            if(loading)    //실행 가능 상태라면?
	            {
	            	//비동기적 처리를 위해 로딩 정지
	            	loading=false;
	            	// 함수 호출을 해서 다음 페이지를 불러온다.
	                getExerciseList();
	            }
	        }
		}
    });  
    
</script>
<!--script END-->
</body>
</html>