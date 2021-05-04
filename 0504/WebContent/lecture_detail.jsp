<%@page import="com.joa.sht.gym_zip.dao.LectureAdImageDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.LectureAdImage"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.joa.sht.gym_zip.dao.ExerciseDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.Exercise"%>
<%@page import="com.joa.sht.gym_zip.vo.LectureListStd"%>
<%@page import="com.joa.sht.gym_zip.dao.LectureListStdDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.PageVO"%>
<%@page import="com.joa.sht.gym_zip.vo.LectureReview"%>
<%@page import="java.util.List"%>
<%@page import="com.joa.sht.gym_zip.dao.LectureReviewDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.LectureReviewContent"%>
<%@page import="com.joa.sht.gym_zip.vo.Lecture"%>
<%@page import="com.joa.sht.gym_zip.dao.LectureDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.LecturePayment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String noStr=request.getParameter("no");
    // 형변환
    	int no=Integer.parseInt(noStr);
    
    // 강의 정보를 가져온다. [-99]
    Lecture lecture=LectureDAO.selectLectureDetail(no);
    
    // 수강생 비율 구하기 
    double girlRatio, boyRatio,totalNum;
    
    totalNum=lecture.getFemaleNum()+lecture.getMaleNum();
    // 전체 수강생수가 0이면 
    if(totalNum==0){
    	girlRatio=0;
    	boyRatio=0;
    }// 그냥 0의 값을 넣어주고 
    else
    {
		girlRatio=Math.round((lecture.getFemaleNum()/totalNum)*100);
		boyRatio=Math.round((lecture.getMaleNum()/totalNum)*100);
    }
    // 아니면 그때서야 비율을 구해준다. 
    
    // 강의 평균 평점 
    LectureReview reviewAvg=LectureReviewDAO.selectLectureReviewAvg(no);
    // 강의 리뷰 총점의 평균 
    
    double reviewTotalAvg;
    if(reviewAvg.getTotalNum()==0){ // 강의 리뷰 개수가 0이면 
    	reviewTotalAvg=0.0;
    }else{
    	reviewTotalAvg=(reviewAvg.getAvgDelivery()
        		+reviewAvg.getAvgEffect()+reviewAvg.getAvgKindness()
        				+reviewAvg.getAvgPrepare()+reviewAvg.getAvgQuality())/5;
    }

// 강의 리뷰 ajax 페이징 처리 하기                                        
    int reviewNum=reviewAvg.getTotalNum();   // 강의 리뷰 개수 
//---------------------------------------------------------------

// 커리큘럼 구하기 
List<Exercise> curriculum=ExerciseDAO.selectCurriculum(no);
    
// 강의 홍보 이미지
List<LectureAdImage> adImages=LectureAdImageDAO.selectLectureAdImageList(no);
//int imageIdx=0;  // 이미지 출력용 인덱스 값

int adImageNum; // 강의 홍보 이미지의 수 

if(adImages!=null){
	adImageNum=adImages.size();
}else{
	adImageNum=0;
}



%>

    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Gym.zip</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/notosanskr.css"/>
    <link rel="stylesheet" href="css/all.min.css"/>
    <link rel="stylesheet" href="css/lectureContents.css"/>
    <link rel="stylesheet" href="css/header.css"/>
    <link rel="icon" href="img/logo_coral.ico">
    <link rel="stylesheet" href="css/chartRatio.css"/>
    <link rel="stylesheet" href="css/footer.css"/>
    <style>

        /*///////////////////////////////////////////////////////////////////////////////////////////////////*/
        #container{
            width: 1100px;
            height: auto;
            /*border-left:1px solid #424242;*/
            /*border-right:1px solid #424242;*/
            margin: auto;
            margin-bottom:200px;

        }

        /*단 CSS*/
        .bar {
            overflow: hidden;
        }

        /*단 수평블록 설정*/
        .bar_contents{
            float:left;
        }
        /*강의상세페이지 상단부*/
        #lectureDetail{
            overflow: hidden;
            height: 650px;
            margin: 50px 50px 10px 50px;

        }
        /*이미지 파트*/
        #lectureImages{
            width: 640px;
            height: 600px;
            /*background-color: blue;*/
            position: relative;
            float:left;
            overflow: hidden;
        }
        /*썸네일 이미지*/
        #lectureThumbnail img{
            width: 640px;
            height: 320px;
            margin:1px solid #e0e0e0;
            /*background-color: skyblue;*/
            margin-bottom: 20px;
        }
        /*홍보사진박스*/
        #lectureAdvertiseImages{
            width: 640px;
            height: 240px;
            position: relative;
          /*  background-color: indigo;*/
            overflow: hidden;
        }
        /*홍보사진*/
        #lectureAdvertiseImages .AdvertiseImage{
        	display:inline-block;
            width: 200px;
            height: 200px;
            background-color: cadetblue;
            margin : 1px solid #e0e0e0;
            position: relative;
            float: left;
            top: 50%;
            margin: -100px 0px 0px 10px;
        }
        /*!*사진더보기 버튼 영역*!*/
        #showMoreView{
            width: 90px;
            height: 20px;
            position: relative;
            margin-left: 540px;
            margin-top: -40px;
            /*display: none;*/
        }
        /*사진더보기 버튼*/
        #showMoreView button{
            width: 90px;
            height: 20px;
            line-height: 20px;
            border:1px solid #424242;
            background-color:#fff;
            font-size:10px;
            display: none;
        }
        /*정보 파트*/
        #lectureDetailContents{
            width: 300px;
            height: 600px;
            /*background-color: antiquewhite;*/
            float:right;
            box-shadow: 1px 1px 10px #424242;
            margin-right: 10px;
            /*box-shadow: 0 27px 24px 0 rgba(0, 0, 0, 0.2), 0 40px 77px 0 rgba(0, 0, 0, 0.22);*/
            /*border: 1px solid #424242;*/
        }
        #kcalAndLevel{
            width: 300px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            font-weight: bold;
            font-size: 14px;
        }
        #kcal{
            width: 200px;
            height: 40px;
            background-color: #F91B4E;
            color:#fff;
        }
        #level{
            width: 98px;
            height: 38px;
            background-color: #fff;
            border: 1px solid #F91B4E;
            color:#f91b4e;
        }
        /*강의 타이틀 CSS*/
        #lectureTitle{
            width: 290px;
            height: 120px;
            margin: auto;
            font-size: 32px;
            font-weight: bold;
            line-height: 60px;
            /*text-align: center;*/
        }
        /*   강의 강사  CSS*/
        #lectureCoachProfile {
            width: 270px;
            height: 60px;
            margin: auto;
            text-align: center;
        }
        #coachProfileImage, #reviewProfile{
            width: 60px;
            height:60px;
            background-color: black;
            border-radius: 50%;
            margin-right: 10px;

        }
        #coachName{
            font-size: 18px;
            font-weight: bold ;
            line-height: 60px;

        }
        .coach_tier{
            font-size: 18px;
            line-height: 60px;
            font-weight:400;
        }

        /*//////////////////////////////////////////////////////////////////////////////////////////////////*/
        .hidden{
            display: none;
        }
        #initGenderchart{
            width: 290px;
            height: 200px;
            margin: 5px auto;
            background-color: #aaaaaa;
        }
        #initGenderchart>div{
            width: 200px;
            height: 100px;
            margin: auto;
            padding: 60px 0px;
            font-size: 18px;
            color: white;
            text-align: center;
            line-height: 60px;
        }
        /*#scoreAndStudents,#lectureGenderRatio{*/
        /*    display: none;*/
        /*}*/
        /*성비 정보차트/////////////////////////////////////////////////////////////////////////////////////////////////*/
        /*chartRatio.css 파일로 대체*/
        /*평점 및 수강생 단 CSS */
        #scoreAndStudents{
            width: 290px;
            height: 80px;
            margin: auto;
            /*background-color: lightpink;*/
        }

        #scoreImage,#studentsImage{
            width: 80px;
            height:80px;
            line-height: 80px;
        }
        #scoreImage{
            font-size: 40px;
            color: yellow;
            text-align: center;
        }
        #studentsImage img{
            margin: 10px;
        }

        #lectureScore,#lectureStudent{
            width: 60px;
            height: 80px;
            font-weight: bold;
            font-size: 18px;
            text-align: center;
        }
        #lectureScore{
            line-height: 40px;
        }
        #lectureStudent {
            line-height: 80px;
        }

        /* 강의 판매정보단 CSS */
        #lectureSalesInfo{
            width: 290px;
            height: 80px;
            margin: 4px auto;
            /*background-color: yellow;*/
            border: 1px solid #F91B4E;
        }
        #lecturePriceIcon{
            width: 80px;
            height: 80px;
        }
        #lecturePriceIcon img{
            margin: 10px;
        }
        #lecturePriceText{
            width:  100px;
            height: 80px;
            line-height: 80px;
            font-size: 40px;
        }
        #lectureDue{
            text-align: center;
            border-right: 1px solid #F91B4E ;
        }
        #dueText{
            font-size: 18px;
            height:20px;
            line-height: 20px;
            background-color: #F91B4E;
            color: white;
        }
        #dueData{
            font-weight: bold;
            font-size: 30px;
            height: 60px;
            line-height: 60px;
        }
        /* 강의 구매 요청 버튼(DIV) CSS */
        .lecture_request_box{
            width: 290px;
            height: 80px;
            margin:auto;
            background-color: #F91B4E;
            color:#fff;
            line-height: 80px;
            font-size: 25px;
            text-align: center;
        }


        /*  홍보이미지 팝업 CSS ///////////////////////////////////////////////////////////////////////////////////*/
        .cover{
            position: fixed;
            width: 100%;
            height: 100%;
            left:0;
            top:0;
            z-index: 200;
        }
        #coverWhite{
            background-color: rgba(255,255,255,.95);
            display: none;
        }
        #hiddenImageBox{
            width:600px;
            height: 600px;
            position:fixed;
            left:50%;
            top:50%;
            margin:-300px 0 0 -300px ;
            background-color: #F91B4E;
            overflow: hidden;
        }
        .image_btn{
            width: 100px;
            height: 100px;
            line-height: 100px;
            position: absolute;
            left:50%;
            top:50%;
            margin-top: -50px;
            text-align: center;
            font-size: 80px;
            outline: none;
            background-color: transparent;
            color:#dddddd;
            border: 0px;
        }
        .image_btn:hover{
            color:#F91B4E;
        }
        #prevImageBtn{
            margin-left:-400px;
        }
        #nextImageBtn{
            margin-left:300px;
        }

        #imageList{
            position: absolute;
            left:0;
            height: 600px;
            overflow: hidden;
        }
        .hiddenImage{
            width: 600px;
            height: 600px;
            background-color: #00969b;
            float:left;
        }
        .closeView{
            width: 40px;
            height: 40px;
            font-size: 40px;
            color: #fff;
            position: absolute;
            right:0px;
        }
        /* 강의 신청 팝업 CSS      ///////////////////////////////////////////////////////////////////////////////////*/
        #coverBlack{
            background-color: rgba(0,0,0,.9);
            display: none;
        }
        #requestBox{
            width: 498px;
            height: 398px;
            position:fixed;
            left:50%;
            top:50%;
            margin:-200px 0 0 -250px;
            border: 1px solid #F91B4E;
            background-color: white;
            text-align: center;
            font-weight: bold;
        }
        #titleBar{
            width: 498px;
            height: 50px;
            line-height: 50px;
            font-size: 30px;
        }
        #coachBar{
            width: 498px;
            height:68px;
            line-height: 50px;
            border-bottom: 1px solid #F91B4E;
            border-top: 1px solid #F91B4E;
            /*background-color: #00969b;*/
            font-size: 25px;
        }
        #coachBar div{
            margin: 10px 0px;
        }
        #coachBar div:nth-child(1){
            background-color: #424242;
            border-radius: 100%;
            width:50px;
            height: 50px;
            margin: 10px 50px;
            overflow: hidden;
        }
        #dueBar{
            width: 498px;
            height:40px;
            line-height: 40px;
            font-size: 20px;
        }
        #dueBar div:nth-child(1){
            width: 50%;
            height: 100%;
            background-color: #F91B4E;
            color:#FFF;
        }
        #dueBar div:nth-child(2){
            width: 50%;
            height: 100%;
            background-color: #FFF;
            color:#F91B4E;
        }
        #priceBar{
            width: 498px;
            height:180px;
            border-bottom: 1px solid #F91B4E;
            border-top: 1px solid #F91B4E;
        }
        .layer{
            width: 498px;
            height: 40px;
            line-height: 40px;
            font-size: 20px;
            margin: 10px 60px;
        }
        .explain{
            width:238px;
            height: 40px;
            /*background-color: #00969b;*/
            text-align: left;
        }
        .cost{
            width: 90px;
            height: 40px;
            /*background-color: azure;*/
            text-align: right;
        }
        .energy{
            width: 40px;
            height: 40px;
            background-image: url("img/energy.png");
            background-size: 40px;
        }
        .last_bar{
            width: 498px;
            height:55px;
            line-height: 55px;
            /*background-color: blue;*/
            font-size: 35px;
            position:absolute;
            bottom:0px;
            border-top: 1px solid #F91B4E;
        }
        .last_bar div:nth-child(1){
            width: 50%;
            height: 100%;
            background-color: #FFF;
            color:#F91B4E;
        }
        .last_bar div:nth-child(2){
            padding: 0px;
            margin: 0px;
            width: 50%;
            height: 100%;
            background-color: #F91B4E;
            color:#FFF;
        }
        .line{
            width: 460px;
            margin: auto;
            height: 1px;
            background-color: #F91B4E;
        }
        .highlight{
            color: #F91B4E;
        }
        .mypage_tab{
        /*/background-color: cornflowerblue;/*/
            width: 800px;
            height: 100px;
            position: relative;
            left: 50%;
            top: 50px;
            margin-left: -400px;
            font-weight: bold;
        }
        .active_tab{
            background-color: white;
            width: 800px;
            line-height: 40px;
            height: 40px;
        }
        .active_tab.fixed_tab {
            position: fixed;
            left:50%;
            top:80px;
            margin: 0px 0px 0px -400px;
        }
        .active_tab li {
            width: 266px;
            height: 40px;
            float: left;
            text-align: center;
            cursor: pointer;
            border-bottom: 5px solid #424242;
            background-color: white;
        }
        .active_tab .on{
            color: #f91b4e;
            border-bottom: 5px solid #f91b4e;
        }
        
        .cannot_request{
        	width:498px;
        	height:342px;
        	line-height:342px;
        	font-size:30px;
        	text-align:center;
        	font-weight:600;
        }

    /*    ////////////////////////////////////////////////////////////////////*/
        .review_init{
            width: 800px;
          height: 400px;
            margin: auto;
            padding-top: 100px;
            background-color: rgba(200,200,200,.5);
        }
        .review_init_box{
            width: 600px;
            height:300px;
            margin:auto;
            background-color: rgba(100,100,100,.5);
        }
        .review_init_text{
            font-size: 40px;
            text-align: center;
            line-height: 300px;
            color:#eeeeee;
        }
        
        
        .normal_review{
      
        
        }
        
        
        /*페이지 버튼 box*/
        #pagingBtnBox {
        	position:relative;
        	bottom:150px;
        	/*====================================================================*/
        	/*width 값은 버튼의 크기에 따라 달라질 수 있습니다.
        	페이지 버튼의 박스 크기 * 보여지는 페이지 번호의 수 + 2(양 사이드 버튼 )
        	*/
        	width:250px;
        	/*====================================================================*/
        	height:40px;
        	margin:auto;
        	overflow:hidden;
      }
 
 		
        /* ajax 페이징 처리 */
        #pagingBtnBox .side_btn, #pagingBtnBox #pagingBtnList div{
        	float:left;
        	width:40px;
        	height:40px;
        	font-size:25px;
        	font-weight:500;
        	line-height:40px;
        	text-align:center;
        	background-color:#e0e0e0;
        	margin-right:10px;
        	
        }
   #pagingBtnBox .side_btn{
 		position:absolute;
 		z-index:9999;
 		}

 		#pagingBtnBox #nextBtn{
 			right:0px;
 		}
        
   	 #pagingBtnBox #pagingBtnList{
   	 	position:absolute;
   	
   	 	left:50px;
   	 	transform:translateX(0px);
   	 }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div id="container">
    <div id="lectureDetail" class="">
        <div id="lectureImages" class="">
            <div id="lectureThumbnail">

           
            <img src="img/bigThumbnail/<%=lecture.getThumbnail()%>" 
            onerror="this.src='img/bigThumbnail/<%=lecture.getNo()%>'+'.JPG';">
         
            </div>
             <%if(adImageNum!=0) {%>
            <div id="lectureAdvertiseImages">
              
                <%for(int i=0;i<adImageNum;i++) {%>	
                	<%if(adImages.get(i)!=null) {%>
                <img class="AdvertiseImage" src="/img/advertise/<%=adImages.get(i).getUrl()%>" 
                onerror="this.src='img/advertise/<%=adImages.get(i).getNo()%>'+'.JPG';"></img>
                	<%}else{break;} %>
                <% if(i==2) {break;}%>
                <%}// for end  %>	
              
            </div>
            <%} // if end %>
            <%if(adImageNum>3) {%>
            <div id="showMoreView">
                <button>사진 더보기</button>
            </div>
            <%} %>
        </div><!--강의 이미지 커버 end-->
        <div id="lectureDetailContents" class="bar bar_contents">
            <div id="kcalAndLevel" class="bar">
            <!-- view count 10번 미만일때 더미에서 데이터 가져오기  -->
                <div id="kcal" class="bar_contents">
                <%if(lecture.getViewCount()<10) {%>
                <%=(LectureDAO.selectFemaleKcalDummy(no)+LectureDAO.selectMaleKcalDummy(no))/2 %>
                <%}else{ %>
                <%=lecture.getTotalKcal() %>
                <%} %>Kcal</div>
                <div id="level" class="bar_contents"><%=lecture.getLevels() %></div>
            </div>
            <div id="lectureTitle"><p><%=lecture.getTitle() %></p></div>
            <div id="lectureCoachProfile" class="bar">
                <img src="/img/member/<%=lecture.getProfileImg() %>" id="coachProfileImage" class="bar_contents">
        
                </img>
                <div id="coachName" class="bar_contents"><%=lecture.getNickname() %></div>
                <div class="bar_contents coach_tier"><%=lecture.getTierName() %></div>
            </div>
            <!--  성비차트& 평점 초기 이미지           -->
            <%if(totalNum==0.0){ %>
            <div id="initGenderchart" >
                <div>
                    아직 정보가 없습니다.
                </div>
            </div>
            <%}else{ %>
            <!-- 성비 차트 -->
            <ul id="lectureGenderRatio">
                <li id="chartHeader" class="bar">
                    <div id="boyRatio" class="bar_contents">
                   <%=boyRatio %>%</div>
                    <div id="chartTitle" class="bar_contents">수강생 분포도</div>
                    <div id="girlRatio" class="bar_contents">
                   <%=girlRatio %>%
                    </div>
                </li>
                <li id="chartBody" class="bar">
                    <div id="boyEmotion" class="bar_contents"><i class="fas fa-mars"></i></div>
                    <div id="chartMainPart" class="bar_contents bar">
                        <div id="boyPart" class="bar_contents" style="width:<%=boyRatio%>%"></div>
<!--                        <div id="girlPart" class="bar_contents"></div>-->
                    </div>
                    <div id="girlEmotion" class="bar_contents"><i class="fas fa-venus"></i></div>
                </li>
                <li id="chartData" class="bar">
                    <div id="boyRatioData" class="bar_contents">
                    <%=lecture.getMaleNum() %>
                    </div>
                    <div class="empty_place bar_contents"> </div>
                    <div id="girlRatioData" class="bar_contents">
                    <%=lecture.getFemaleNum() %>
                    </div>
                </li>
                <li id="chartKcal" class="bar">
                <!--  view count 기준으로 10 미만이면 운동 더미 데이터를 활용해야 한다. -->
                    <div id="boyKcal" class="bar_contents">
                    <%if(lecture.getViewCount()<10) {%>
                    <%= LectureDAO.selectMaleKcalDummy(no) %>
                    <%}else{ %>
                    <%=lecture.getMaleKcal() %>
                    <%} %>Kcal
                    </div>
                    <div class="empty_place bar_contents"> </div>
                    <div id="girlKcal"  class="bar_contents">
                    <%if(lecture.getViewCount()<10){%>
                    <%=LectureDAO.selectFemaleKcalDummy(no)%>
                    <%}else{ %>
                    <%=lecture.getFeKcal()%>
                    <%} %>Kcal
                    </div>
                 <!--  end  남여 칼로리 표기 ========================================== -->
                </li>
            </ul>
            <ul  id="scoreAndStudents" class="bar">
                <li id="scoreImage" class="bar_contents"><i class="fas fa-star"></i></li>
                <li id="lectureScore" class="bar_contents"><p><%=reviewTotalAvg %></p><p>(<%=reviewAvg.getTotalNum() %>)</p></li>
                <li id="studentsImage" class="bar_contents"><img src="img/muscle.png" width="60"/></li>
                <li id="lectureStudent" class="bar_contents"><%=lecture.getViewCount() %></li>
            </ul>
            <%} %>
<!--            </div>-->
            <ul id="lectureSalesInfo" class="bar">
                <li id="lectureDue" class="bar_contents"><div id="dueText">수강기간</div><div id="dueData">
                <%if(lecture.getPeriod()==99999){ %>
                	평생 
                	<%} 
                	else{ %>
                	<%=lecture.getPeriod() %>
                	<%} %>
                </div></li>
                <li id="lecturePrice" class="bar_contents bar">
                    <div id="lecturePriceIcon" class="bar_contents"><img src="img/energy.png" width="60"/></div>
                    <div id="lecturePriceText" class="bar_contents">
                    <%=lecture.getCost() %>
                    </div>
                </li>
            </ul>
            <!--  강의 신청 안했을 때만 보이게 하기 ---------------->
 <% if(loginMember==null||LectureListStdDAO.selectTakeLecture(new LectureListStd(no,loginMember.getNo()))<1){ %> 
            <div id="lectureRequest" class="lecture_request_box">강의 신청하기</div>
            <%} else{%>
            <div class="lecture_request_box">이미 수강중인 강의 입니다. </div>
            <%} %>
            <!-- ================================================= -->
        </div><!--강의상세 커버 end-->
    </div><!--강의 상세페이지 상단텝 end-->
    <div class="mypage_tab">
        <ul class="active_tab">
            <li class="on">강의 소개</li>
            <li>커리 큘럼</li>
            <li>리뷰&평점</li>
        </ul><!--탭 리스트 end-->
    </div><!--탭 div end-->
<!--    ///////////////////////////////////////////////////////////////////////////////////////////////////////-->
    <div id="lectureContentsListBox">
        <div id="lectureIntroduceBox" class="bar">
            <div class="bar">
                <div class="bar_contents">
                    <p>어떤</p>
                    <p>수업인가요?</p>
                </div>
                <div class="bar_contents pre_line">
<%=lecture.getIntroduction() %>
                </div>
            </div>
            <div class="bar">
                <div class="bar_contents">
                    <p>이런분들이</p>
                    <p>들으면 좋아요</p>
                </div>
                <div class="bar_contents pre_line">
     <%=lecture.getRecommand() %>
                </div>
            </div>
        </div><!--lectureIntroduceBox end-->
        <hr/>
        <div id="curriculumBox" class="bar">
            <div class="bar_contents">
                <p>수업은 이렇게 </p>
                <p>진행되요</p>
            </div>
            <div class="bar_contents">
                <table>
                    <thead>
                    <tr>
                        <th></th>
                        <th>운동명</th>
                        <th>시간</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%for(Exercise exercise:curriculum){ %>
                    <tr>
                        <td><img src="/img/exercise/<%=exercise.getThumbnail() %>"  height="90px"/></td>
                        <td><%=exercise.getName() %></td>
                        <td><%=exercise.getExerciseTime() %></td>
                    </tr>
                    <%} %>
                    
                    </tbody>
                </table>
            </div>
        </div><!--#curriculumBox end-->
        <hr>
        <div id="reviewBox" class="review_box">
        <%if(reviewAvg.getTotalNum()==0){ %>
            <div class="review_init">
                <div class="review_init_box">
                    <div class="review_init_text">
                        아직 리뷰가 없습니다~
                    </div>
                </div>
            </div><!-- review init box end-->
            <%} else{%>
            <div class="normal_review ">
                <div class="review_total bar">
                    <div id="tabTitle" class="bar_contents">강의평점</div>
                    <div id="starPoint"  class="bar_contents">
                        <div id="starIcon">
                            <i class="fas fa-star"></i>
                        </div>
                        <div id="starData">
                           <%=reviewTotalAvg %> (<%=reviewAvg.getTotalNum() %>)
                        </div>
                    </div>
                    <div class="bar_contents">
                        <canvas id="marksChart"  width="200" height="200"></canvas>
                    </div>
                </div>
<!--======================= reviewList============================================================================================= -->
                <div id="reviewList">
                </div><!--#reviewList--> 
<!--======================= reviewList============================================================================================= -->
                <div id="pagingBtnBox" class="paging"><!--  
                	--><div id="prevBtn" class="side_btn"><</div><!-- 
                 --><div id="pagingBtnList"calss="paging"></div><!--  
                	--><div id="nextBtn" class="side_btn">></div>
                </div>
            </div><!--normalreviewbox end-->
            <%} %>
        </div><!--.review_box end-->
    </div><!--#lectureContentsListBox end-->
</div> <!-- container end-->

<!--    ///////////////////////////////////////////////////////////////////////////////////////////////////////-->


<div id="coverWhite" class="cover"><!--닫기표시 end-->
    <div id="prevImageBtn" class="image_btn"> <i class="fas fa-chevron-left"></i></div>
    <div id="hiddenImageBox">
    		<!-- 강의 홍보 이미지가 4개 이상일 경우에만 사진 더보기 가능  -->
    		<%if(adImageNum>3) {%>
            <ul id="imageList">
            	<%for(int i=3;i<adImageNum;i++) {%>
            		<%if(adImages.get(i)!=null) {%>
                <li class="hiddenImage"><img class="AdvertiseImage" src="/img/advertise/<%=adImages.get(i).getUrl()%>" 
                onerror="this.src='img/advertise/<%=adImages.get(i).getNo()%>'+'.JPG';"></img></li>
                	<%}else{break;}  // if~else end%>
                <%} // for end %>
            </ul><!--이미지리스트end-->
            <%} // if end%>
        <div class="closeView close"><i class="fas fa-times"></i></div>
    </div><!--이미지 더보기 end-->
    <div id="nextImageBtn" class="image_btn"> <i class="fas fa-chevron-right"></i></div>
</div><!--이미지 더보기 커버 end-->


<div id="coverBlack" class="cover">
    <div id="requestBox" >
    <!-- 로그인 한 상태 이면서 돈이 충분 할 때  -->
    <%if(loginMember!=null&&(loginMember.getMyEnergy()>=lecture.getCost())){ %>
        <div id="titleBar"><%=lecture.getTitle() %></div>
        <div id="coachBar"class="bar">
             <img src="/img/member/<%=lecture.getProfileImg() %>" id="coachProfileImage" class="bar_contents"></img>
            <div class="bar_contents"><%=lecture.getNickname() %></div>
            <div class="bar_contents coach_tier"><%=lecture.getTierName() %></div>
        </div>
        <div id="dueBar">
            <div class="bar_contents">수강 기간</div>
            <div class="bar_contents"><%if(lecture.getPeriod()==99999){ %>
                	평생 
                	<%} 
                	else{ %>
                	<%=lecture.getPeriod() %>
                	<%} %></div>
        </div>
        <div id="priceBar">
            <div class="layer bar">
                <div class="bar_contents explain">
                    보유 에너지
                </div>
                <div class="bar_contents cost">
                   <%= loginMember.getMyEnergy() %>
                </div>
                <div class="bar_contents energy">
                </div>
            </div>
            <div class="layer bar">
                <div class="bar_contents explain highlight">
                    강의 에너지
                </div>
                <div class="bar_contents cost highlight">
                    <%=lecture.getCost() %>
                </div>
                <div class="bar_contents energy">
                </div>
            </div>
            <div class="line" ></div>
            <div class="layer bar">
                <div class="bar_contents explain">
                    결재 후 잔여 에너지
                </div>
                <div class="bar_contents cost highlight">
                    <%=loginMember.getMyEnergy()-lecture.getCost() %>
                </div>
                <div class="bar_contents energy">
                </div>
            </div>
        </div>
        <div class="last_bar bar">
            <div class="bar_contents close">취소</div>
            <div class="bar_contents request">수강하기</div>
        </div>
           <!-- end 로그인 한 상태 이면서 돈이 충분 할 때  -->
        <%}else if(loginMember!=null){ %>
         <!-- 로그인은 했지만 돈이 부족할 때  -->
         <div class="bar_contents cannot_request">
         	에너지가 부족합니다. 
         </div>
          <div class="last_bar bar">
            <div class="bar_contents close">취소</div>
            <div class="bar_contents "><a href="/mypage.html">에너지 충전하기</a></div>
        </div>
         <%}else if(loginMember==null){ %>
         <!-- 로그인 안했을 때 -->
         <div class="bar_contents cannot_request">
         	로그인 후 이용해주세요.
         </div>
         <div class="last_bar bar">
            <div class="bar_contents close">취소</div>
           <div class="bar_contents "><a href="/login.jsp">로그인 하러가기</a></div>
        </div>
         <%} %> 
        
    </div><!--결제창 박스 end-->
</div><!--결제창 커버 end-->



<!--  강의 리뷰 템플릿  -->

<script src="js/jquery.js"></script>
<script type="text/template" id="lectureReviewTmpl">
    <@ _.each(leReList, function(review){ @>
   <div class="review_card bar">
                        <div class="photo bar_contents">
                            <div><img id="reviewProfile" src="/img/member/<@=review.profileImg@>"></div>
                        </div>
                        <div class="bar_contents writer_explain">
                            <div class="bar writer_explain1">
                                <div class="bar_contents writer_tier">
                                   <@=review.tier@>
                                </div>
                                <div class="bar_contents writer_name">
                                    <@=review.nickname@>
                                </div>
                                <div class="bar_contents writer_kcal">
                                    소모칼로리 <@=review.myKcal@>
                                </div>

                                <div class="bar_contents report">
                                    <i class="fas fa-bullhorn"></i>
                                </div>
                            </div>
                            <div class="bar writer_explain2">
                                <div class="bar_contents writer_date">
                                    <@=review.regdate@>
                                </div>
                                <div class="bar_contents writer_lecture_name ">
                                   
                                </div>
                            </div>
                            <div class="review_contents on">
                                <@=review.contents@>
                            </div>
                            <div class="more"><i class="fas fa-angle-double-down"></i> 더보기</div>
                            <div class="little off"><i class="fas fa-angle-double-up"></i> 접 기</div>
                        </div>
                    </div><!--review card end-->
    <@})@>
</script>
<!--  강의 리뷰 템플릿  -->


 	<%@ include file="/WEB-INF/template/footer.jsp" %>
<script src="js/Chart.js"></script>
<script src="js/underscore-min.js"></script>
<script>





// 강의 홍보 사진이 없을 경우
 if(<%=adImageNum%>==0){
	 $("#lectureThumbnail img").css("padding-top","150px");
 }



//================================================================================================
/*강의 리뷰 페이징 처리 */
 /*강의 리뷰 수 */
const reviewNum="<%=reviewNum%>" ;   
const numBlock = 3;  // 한 번에 보일 페이지 버튼 개수 
let pageNo=1; // 일단 첫 페이지는 1로 설정 
const numPage=3; // 한 페이지에 보일 리뷰의 개수 

/*강의 리뷰 수에 따른 페이지 번호 버튼 생성 하기 */
/*버튼의 개수 = (강의 리뷰수 / 한번에 보일 리뷰의 수) +1 */
 let pageBtnNum=0;
 
 if((reviewNum/numPage)==0){
	 pageBtnNum=parseInt(reviewNum/numPage);
 }else{
	 pageBtnNum=parseInt(reviewNum/numPage)+1;
 }
 
 
 // 페이지 버튼 목록
 const $pagingBtnList=$("#pagingBtnList");
// 버튼의 수만큼 페이지 버튼 목록의 width 값 설정 
$pagingBtnList.css("width",50*pageBtnNum+"px");

 /*버튼의 개수 만큼 버튼 생성 */
 for(let i=0;i<pageBtnNum;i++){

	 const $pageBtn=$("<div>").text(i+1);
	 
	 $pagingBtnList.append($pageBtn);
 }
 // 페이징 하는 버튼 생성 하기 
 
 // 페이지 버튼들
 const $pagingBtnItem=$("#pagingBtnList div");

 
//언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
const $lectureReviewTmpl = _.template($("#lectureReviewTmpl").html()); 
 
 const $reviewList=$("#reviewList");
 
 
 // 첫 페이지는 그냥 출력 
 printReviewList();
 
 function printReviewList(){
	 // ajax에 보내줄 데이터 
	 let jsonData={
				"pageNo":pageNo,
				"no":"<%=no%>",
				"numPage":numPage
		};

		 // 페이지 번호와 한 페이지에 표시될 게시글의 수 그리고 강의 번호를 get 방식으로 넘겨주자 
		 $.ajax({
			url:"/ajax/lectureReviewPage.json",
			type:"get",
			data:jsonData,
			error:function(){
			alert("서비스 점검중 입니다. 나중에 다시 이용해주세요");
			},
			success:function(json){
				console.log(json);
				$reviewList.append($lectureReviewTmpl({leReList : json}));
				$pagingBtnItem.css("background-color","#e0e0e0");
				$pagingBtnItem.eq(pageNo-1).css("background-color","rgb(249,27,78)");
			}
			
		 });// end ajax
		 
 }
 
 // 페이지 버튼 눌렀을 경우 
 $("#pagingBtnList ").on("click","div",function(e){
	 $reviewList.empty();
	 
     pageNo=$(this).text();// 현재 페이지 번호
	
	printReviewList();

 });
 
 // 페이지 번호 버튼 양 사이드에 있는 버튼들 
 const $sideBtn=$("#pagingBtnBox .side_btn");

 $sideBtn.on("click",function(){
 $reviewList.empty();
	 
	 // 이전 버튼 이거나 다음 버튼 일때 
	if($(this).text()=="<"){
		// 현재 페이지 번호를 보여지는 페이지 번호의 수만큼
		// 나눈 나머지가 1이면 페이지 번호들을 이동시킨다. 
		if(pageNo!=1&&pageNo%numBlock==1){
			$pagingBtnList.css("transform","translateX(-"+((parseInt(pageNo/numBlock))-1)*(numBlock*50)+"px)");
		}
	
		pageNo--;
				
		if(pageNo<1){
			pageNo=1;
		}
		
	 }
	else if($(this).text()==">"){
		// 현재 페이지 번호를 보여지는 페이지 번호의 수만큼
		// 나눈 나머지가 0이면 페이지 번호들을 이동시킨다. 
		if(pageNo<pageBtnNum&&pageNo%numBlock==0){
			
			$pagingBtnList.css("transform","translateX(-"+(parseInt(pageNo/numBlock))*(numBlock*50)+"px)");
		}
	
		pageNo++;
		
		if(pageNo>pageBtnNum){
			pageNo=pageBtnNum;
			
		}
	}
	 
	printReviewList();

 });
 
//=============================================================================================================

    /* 이미지 홍보영상 넘기기 JS */
    let left=0;
    $("#nextImageBtn").click(function () {
        let numOfImage=$('#imageList li').length;
        let limit = -600 * (numOfImage-1);
        if(left>limit){
            left+= -600;
            $("#imageList").css("left",left);
        }
    });
    $("#prevImageBtn").click(function () {
        if(left<0){
            left+= 600;
            $("#imageList").css("left",left);
        }
    });

    /*홍보사진 더보기 JS*/
    $('#lectureImages').on("mouseenter",function () {
        $('#showMoreView button').css("display","block");
    });
    $('#lectureImages').on("mouseleave",function () {
        $('#showMoreView button').css("display","none");
    });

    /*닫기 버튼 클릭시 화면 닫힘*/
    $('.close').on("click",function () {
        $(".cover").css("display","none");
    });
    /*결제 버튼 클릭시 확인창 뜨고 페이지 이동*/
    $('.request').on("click",function () {
        $(".cover").css("display","none");
        /*결제 결제 결제 결제 결제는 여기서 하는 거에요 */
        if(confirm("정말 결제하시겠습니까?")){
        	
        	let memberNo=0;
        	
        	<%if(loginMember!=null){%>
        	memberNo="<%=loginMember.getNo()%>";
        	<%}%>
        	const lectureNo="<%=no%>"; // 강의 번호 
        	
            location.href="/lecturePay.joa?leNo="+lectureNo+"&meNo="+memberNo;
        }
        /*//////////////////////////////////////////////*/
    });

    /* 사진 더보기 클릭시 홍보 사진 팝업 */
    $('#showMoreView').on("click",function () {
        $("#coverWhite").css("display","block");
    });
    /* 수강하기클릭시 강의 신청 팝업  */
    $('#lectureRequest').on("click",function () {
    	 $("#coverBlack").css("display","block");
    });

    /* 강의 네비게이션 효과*/
    $(".active_tab li").on("click",function (e) {

        //1) 기존의 on 클래스를 제거
        $(".on").removeClass("on");

        // 2) 클릭한 그 li요소에 on 클래스를 더한다.
        $(this).addClass("on");

    }); //.active_tab li click() end


    /* Chart JS  설정*/
    var marksCanvas = document.getElementById("marksChart");
    var ScoreData=['<%=reviewAvg.getAvgQuality()%>', '<%=reviewAvg.getAvgPrepare()%>',
    	'<%=reviewAvg.getAvgKindness()%>', '<%=reviewAvg.getAvgEffect()%>', '<%=reviewAvg.getAvgDelivery()%>'];
    var ScoreLabel=["강의내용", "준비성", "친절도", "운동효과", "전달력"];
    var marksData = {
        labels: ScoreLabel,
        datasets: [{
            backgroundColor: "transparent",
            borderColor: "rgb(249,27,78)",
            fill: false,
            radius: 5,
            pointRadius: 2,
            pointBorderWidth: 1,
            pointBackgroundColor: "rgb(249,27,78)",
            pointBorderColor: "rgb(249,27,78)",
            pointHoverRadius: 10,
            data: ScoreData
        }]
    };
    var chartOptions = {
        responsive: false,//크기 조정 마음대로 하려면 false
        scale: {
            gridLines: {
                color: "black",
                lineWidth: 1
            },
            angleLines: {
                display: false
            },
            ticks: {
                beginAtZero: true,
                min: 0,
                max: 5,
                stepSize: 1
            },
            pointLabels: {
                fontSize: 10,
                fontColor: "rgb(249,27,78)"
            }
        },
        legend: {
            display: false
        }
    };
    var radarChart = new Chart(marksCanvas, {
        type: 'radar',
        data: marksData,
        options: chartOptions
    });


    /*강의 카드 */
    $(".more").click(function () {
        let $more = $(this);
        $more.addClass("off");
        $more.next().removeClass("off");
        $more.prev().removeClass("on")
    });//더보기 눌렀을때
    $(".little").click(function () {
        let $little = $(this);
        $little.addClass("off");
        $little.prev().removeClass("off");
        $little.prev().prev().addClass("on");
    });//접기  눌렀을때


    //탭 눌렀을때 스크롤 이동 이벤트
    $('.active_tab li:nth-child(1)').on("click",function (){
        var scrollPosition = $("#lectureIntroduceBox").offset().top;
        if($( document ).scrollTop() ==0){
            scrollPosition-=200;
        }else{
            scrollPosition-=140;
        }
        // alert(scrollPosition);
        $('html, body').animate({
            scrollTop: scrollPosition
        }, 500);
    });
    $('.active_tab li:nth-child(2)').on("click",function (){
        var scrollPosition = $("#curriculumBox").offset().top;
        // alert(scrollPosition);
        if($( document ).scrollTop() ==0){
            scrollPosition-=200;
        }else{
            scrollPosition-=130;
        }

        $('html, body').animate({
            scrollTop: scrollPosition
        }, 500);
    });
    $('.active_tab li:nth-child(3)').on("click",function (){
        var scrollPosition = $("#reviewBox").offset().top;
        // alert(scrollPosition);
        if($( document ).scrollTop() ==0){
            scrollPosition-=200;
        }else{
            scrollPosition-=140;
        }
        $('html, body').animate({
            scrollTop: scrollPosition
        }, 500);
    });

    //스크롤 기준 고정 탭
    $( document ).ready( function() {
        var Offset = $( '.active_tab' ).offset();
        // var Offset = $( '#lectureIntroduceBox' ).offset();

        var headerOffset = $('#header').offset();
        $(window).scroll( function() {
            if($( document ).scrollTop() > headerOffset.top){
                $('#header').addClass('header_fixed');
            }else{
                $('#header').removeClass('header_fixed');
            }
            if ( $( document ).scrollTop()+160> Offset.top) {
                $( '.active_tab' ).addClass( 'fixed_tab' );
            }
            else {
                $( '.active_tab' ).removeClass( 'fixed_tab' );
            }
        });
    } );
</script>
</body>
</html>
