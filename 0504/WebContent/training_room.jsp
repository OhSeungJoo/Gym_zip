<%@page import="com.joa.sht.gym_zip.vo.ExRecordPhoto"%>
<%@page import="com.joa.sht.gym_zip.util.PaginateUtil"%>
<%@page import="com.joa.sht.gym_zip.vo.Lecture"%>
<%@page import="java.util.List"%>
<%@page import="com.joa.sht.gym_zip.dao.LectureDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.LectureListStd"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.joa.sht.gym_zip.vo.ExRecord"%>
<%@page import="com.joa.sht.gym_zip.dao.MemberDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>GYM.zip</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/all.min.css">
    <link rel="stylesheet" href="/css/notosanskr.css">
    <link href='/css/main.css' rel='stylesheet' />
	<link href="/css/diary.css" rel='stylesheet'/>
    <link rel="icon" href="img/logo_coral.ico">
    <link rel="stylesheet" href="/css/lecture_list.css">
    <link rel="stylesheet" href="css/review_check.css">
    <link rel="stylesheet" href="css/review_text.css">
    <link rel="stylesheet" href="css/subscribe_coach_list.css">
    <link rel="stylesheet" href="css/header.css">
    <style>
        #wrap{
            font-family: "Noto Sans KR",sans-serif;
        }
        #container{
            width: 100%;
        }
        #topBox{
            width:1100px;
            margin: auto;
        }
        .top_bar{
            height: 100px;
            background-color: #eeeeee;
        }
        .top_bar span{
            font-weight: 500;
            font-size: 30px;
            line-height: 100px;
            margin: 20px;
            user-select: none;
        }
        #profileBox{
            width: 1100px;
            height: 420px;
            /*background-color: lightskyblue;*/
            overflow: hidden;
        }
        #profile{
            width: 300px;
            height: 420px;
            /*background-color: lightpink;*/
        }

        #profileImage{
            width: 200px;
            height: 200px;
            border-radius: 100%;
            margin: 40px;
        }
        #userNickname strong{
            font-size: 26px;
            font-weight: 500;
            margin-left: 50px;
        }
        #userNickname span{
            margin-left: 10px;
            color: #0cdad5;
            font-weight: bold;
        }
        #tmi{
            width: 200px;
            height: 30px;
            margin: 50px;
            text-align: center;
            line-height: 30px;
        }

        #tmi span a{
            text-decoration: none;
            color: #424242;
        }
        #tmi span a:visited{
            text-decoration: none;
        }
        #userInfo{
            width: 600px;
            height: 400px;
            position: relative;
            left: 400px;
            top: -410px;
        }
        #bodyInfo{
            width: 590px;
            height: 90px;
            border-bottom: none;
            line-height: 90px;
            text-align: center;
        }
        #bodyInfo span{
            margin: 0 20px;
            font-size: 32px;
        }

        #infoList{
            width: 590px;
            overflow: hidden;
            margin: 30px;
        }
        #infoList dt{
            width: 150px;
            height: 50px;
            float: left;
        }
        #infoList dd:nth-child(3n+2){
            width: 100px;
            height: 50px;
            float: left;
        }
        #infoList dd:nth-child(3n+3){
            width: 320px;
            height: 50px;
            float: left;
        }
        #infoList dd:nth-child(3n+3) span{
            display: block;
            width: 220px;
            font-size: 8px;
            text-align: right;
            color: #f91b4e;
        }
        .bar_contents{
            width: 70%;
            height: 15px;
            background-color: #fff;
            border: 1px solid #f91b4e;
        }
        #bmiPart{
            width: 75%;
            height: 15px;
            background-color: #f91b4e;
        }
        #musclePart{
            width: 95%;
            height: 15px;
            background-color: #f91b4e;
        }
        #brmPart{
            width: 25%;
            height: 15px;
            background-color: #f91b4e;
        }

        .cover{
            border: 5px solid #f91b4e;
        }

        /* 트레이닝룸 탭*/
        #trainingTab{
            width: 800px;
            height: 100px;
            font-weight: bold;
            margin: auto;
        }
        .basic_active_tab li {
            width: 200px;
            height: 20px;
            float: left;
            text-align: center;
            cursor: pointer;
            border-bottom: 5px solid #424242;
            margin-top: 50px;
        }
        .basic_active_tab .on{
            color: #f91b4e;
            border-bottom: 5px solid #f91b4e;
        }

        /*content*/
        #content{
            width: 900px;
            height: 800px;
            position: relative;
            top: 50%;
            left: 50%;
            margin-left: -450px;
        }
        .basic_tab{
            display: none;
        }
        .basic_tab.on{
            display: block;
        }
        /*내 강의목록 탭*/
        #lectureTab{
            width: 800px;
            height: 200px;
            margin: 50px;
        }
        #lectureList{
            width: 600px;
            height: 70px;
            position: absolute;
            margin-left: 100px;
            margin-top: 85px;
        }
        #lectureList li{
            text-align: center;
            line-height: 70px;
        }
        #lectureList li h2{
            font-size: 28px;
            font-weight: bold;
        }
        /*강의 검색창 css*/
        #lectureSearch{
            position: absolute;
            left:50px;
            top: 10px;
        }
        #lectureSearch:hover{
            background-color: rgba(66,66,66,0);
            border-radius:50px 50px 50px 50px;
            box-shadow: 0 10px 10px rgba(0,0,0,0.15);
        }
        .search_text{
            width: 300px;
            height: 30px;
            border-color: rgb(204, 204, 204);
            border-radius:50px;
        }
        .search_btn {

            position: absolute;
            width: 35px;
            height: 35px;
            margin-left: -30px;
            border-radius: 45%;
            cursor: pointer;
        }

        /*강의 정렬*/
       #lectureSort{
           width: 100%;
           height: 40px;
           right: 50px;
           top: 5px;
       }
        #lectureSort select{
        	position:absolute;
            width: 100px;
            height: 40px;
            right:50px;
        }

        /*페이지 버튼*/
        #pagination{
            width: 200px;
            height: 40px;
            position: absolute;
            left: 350px;
        }


        /*내 운동기록*/


        /*상단 탭 버튼 css*/
        #tabButton div{
            display: inline-block;
            margin: 20px 30px;

        }
        #tabButton div.pick{
            border: 1px solid #f91b4e;
            color: #f91b4e;
        }

        .tab_button{
            width: 230px;
            height: 50px;
            border: 1px solid #424242;
            border-radius: 35px;
            text-align: center;
            line-height: 50px;
            font-size: 20px;
            cursor: pointer;
            user-select: none;
        }


        /*최근 운동 기록 */
        #exRecordList{
            width: 900px;
            overflow: hidden;
            margin-top: 50px;
        }
        #exRecordList li{
            float: left;
            width: 230px;
            height: 50px;
            font-size: 22px;
            color: #f91b4e;
            margin: 20px 30px;
        }
        #exRecordList li div{
            font-size: 26px;
            color: #424242;
            margin: 10px 0;
        }


        /*변화 그래프*/

        #changeGraph{
            width: 600px;
            height: 400px;
            margin: auto;
        }

        .basic_tab .inside{
            display: none;
        }
        .basic_tab .inside.show{
            display: block;
        }


        /*사진첩*/
/*
        #panorama{
            width: 120px;
            height: 40px;
            border: 2px solid #424242;
            margin-top: 30px;
            font-size: 14px;
            text-align: center;
            line-height: 40px;
            position: relative;
            right: -650px;
        }

        #albumList{
            width: 900px;
            overflow: hidden;
            margin: auto;
        }
        #albumList li{
            float: left;
            width: 280px;
            height: 300px;
            margin: 10px;
        }
        .yg_hi{
        	position:relative;
        }
        
*/

        /*사진첩*/

        #panorama{
            width: 120px;
            height: 40px;
            border: 2px solid #424242;
            margin-top: 30px;
            font-size: 14px;
            text-align: center;
            line-height: 40px;
            position: relative;
            right: -650px;
           
        }

        #albumList{
            width: 900px;
            overflow: hidden;
            margin: auto;
            padding-bottom:100px;
            
        }
        #albumList li{
            float: left;
            width: 280px;
            height: 300px;
            margin: 10px;
        }
        #albumList li img{
        	position:absolute;
            width: 280px;
            height: 300px;
          	border: 1px solid #e0e0e0;
        }
        #albumList li div{
        	width:280px;
        	height:30px;
        	background-color:transparent;
        	color:transparent;
        	text-align:center;
        	line-height:30px;
        	position:absolute;
        }
        
        /*파노라마 사진 하나에 마우스 엔터시*/
        #albumList li div.on{
        	
        	background-color:rgba(0,0,0,0.7);
        	color:#fff;
        	
        }
       
        .yg_hi{
        	position:relative;
        }
        

          /*더보기 버튼 CSS */
      #showMorePage{
      	/*width:900px;*/
      	height:40px;
      	line-height:40px;
      	background-color:#999999;
      	color:#fff;
      	position:relative;
      	text-align:center;
      	margin:100px auto;
      	transition: .2s ease;
      }
      #showMorePage:hover{
      	background-color: rgb(249, 27, 78);
      	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
      }
      
      
 
       /*  파노라마 팝업 CSS ///////////////////////////////////////////////////////////////////////////////////*/
      
       #coverWhite{
       position: fixed;
           width: 100%;
           height: 100%;
           left:0;
           top:0;
           z-index: 200;
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
           /*background-color: red;*/
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
          /* background-color: blue;*/
           float:left;
       }
       .hiddenImage img{
           width: 600px;
           height: 600px;
          
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
        
        
        
           /*  파노라마 팝업 CSS ///////////////////////////////////////////////////////////////////////////////////*/
      
       #coverWhite{
       position: fixed;
           width: 100%;
           height: 100%;
           left:0;
           top:0;
           z-index: 200;
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
         
           float:left;
       }
       .hiddenImage img{
      	   margin-left:50px;
      	   display:inline-block;
      	 
           width: 500px;
           height: 600px;
          
       }
       
       .closeView{
           width: 40px;
           height: 40px;
           font-size: 40px;
           color: #424242;
           position: absolute;
           right:0px;
           
           
       }
     
    </style>
</head>
<body>
    <div id="wrap">
        <%@include file="/WEB-INF/template/header.jsp" %>
        <div id="container">
<%	

	String getMemberTier = MemberDAO.memberTier(loginMember.getNo());

	ExRecord exRecentRecord = MemberDAO.getRecentExRecord(loginMember.getNo());
	
	int sumKcal = MemberDAO.sumKcal(loginMember.getNo());

	
	List<Lecture> lectureListStd = LectureDAO.selectMemberLecture(loginMember.getNo());
	
	
	long diff = 0;
	long diffSeconds = 0;
	long diffHours =0;
	long diffMinutes = 0;
	
	if(exRecentRecord!=null) {
		Timestamp startTime = exRecentRecord.getStartTime();
	    Timestamp endTime =  exRecentRecord.getEndTime();
	    diff = endTime.getTime() - startTime.getTime();
	     diffSeconds = diff / 1000 % 60;
		 diffHours = diff / (60 * 60 * 1000) % 24;
		 diffMinutes = diff / (60 * 1000) % 60;
	}
	
	int coachNo=-1;

	// 0126 ================================================================================
	int exPhotoNum=MemberDAO.selectExRecordPhotoTotal(loginMember.getNo());
	// 파노라마에 들어갈 사진들
	List<ExRecordPhoto> photoInPano=MemberDAO.selectPanoramaList(loginMember.getNo());
	
%>
            <!--topBox-->
            <div id="topBox">
                <!--top_bar-->
                <div class="top_bar">
                    <span>Training Room</span>
                </div>
                <!--top_bar END-->

                <!--profile_box -->
                <div id="profileBox">

                    <div id="profile">
                    <!--프로필 사진-->
                     <img id="profileImage" src="<%=loginMember.getProfileImg()%>">

                    <!--회원 닉네임-->
                     <div id="userNickname">
                        <strong><%=loginMember.getNickname()%></strong>
                        <!--회원 티어-->
                        <span class="userTier"><%=getMemberTier %></span>
                     </div>
                    <!--누르면 페이지 이동-->
                     <div id="tmi" class="cover">
                         <span><a href="tmi.html">운동 몇 시간했는지 궁금해?</a></span>
                     </div>

                    </div>
                    <!--profile END-->
                    <div id="userInfo">
                        <div id="bodyInfo" class="cover">
                            <span class="women">
                            <%if(loginMember.getGender()=="F"){%>
                           	<%="여" %><%}else{%><%="남" %><%} %>
                            </span>
                            <span><%=loginMember.getHeight() %>cm</span>
                            <span><%=loginMember.getWeight() %>kg</span>
                        </div>
                        <div id="exerciseInfo" class="cover">
                            <dl id="infoList">
                                <dt>BMI</dt>
                                <dd><span><%if(exRecentRecord!=null) {%>
                                	<%=exRecentRecord.getBmiAfter() %>
                                	<%}else { %>0<%} %>
                                	</span></dd>
                                <dd>
                                    <span>표준체형</span>
                                    <div class="bar_contents">
                                    <div id="bmiPart"></div> </div>
                                </dd>

                                <dt>근골격량</dt>
                                <dd><span><%if(exRecentRecord!=null) {%>
                                <%=exRecentRecord.getMuscleBone() %>
                                <%}else{ %>0<%} %>
                                </span></dd>
                                <dd>
                                    <span>상위90%</span>
                                    <div class="bar_contents">
                                    <div id="musclePart" ></div> </div>
                                </dd>

                                <dt>기초대사량</dt>
                                <dd><span><%if(exRecentRecord!=null) {%>
                                <%=exRecentRecord.getBmm() %>
                                <%}else{ %>0<%} %>
                                </span></dd>
                                <dd>
                                    <span>상위70%</span>
                                    <div class="bar_contents">
                                    <div id="brmPart" ></div></div>
                                </dd>

                                <dt>총 소모 칼로리</dt>
                                <dd>
                                <%if(sumKcal!=0) {%>
                                <%= sumKcal %>
                                <%}else{ %>0<%} %>
                                 Kcal</dd>
                           </dl>
                        </div>
                    </div>
                    <!--user_info END-->
                </div>
                <!--profile_box END-->

                <!--trainingTab -->
                <div id="trainingTab">
                    <ul class="basic_active_tab">
                        <li class="on">내 다이어리</li>
                        <li>내 운동기록</li>
                        <li>내 강의목록</li>
                        <li>구독한 코치 목록</li>
                    </ul>
                </div>
                <!--trainingTab END-->
            </div>
            <!--topBox END-->

            <!--content-->
            <div id="content">
                <div class="basic_tab on">
                	<%@include file="/WEB-INF/template/my_diary.jsp" %>
                </div>
					


                <!--내운동 기록-->
                <div class="basic_tab">

                    <div id="tabButton" class="active_tab_button">
                        <div class="tab_button pick">최근 운동 기록</div>
                        <div  class="tab_button">변화 그래프</div>
                        <div  class="tab_button">사진첩</div>
                    </div>
                    <!--tabButton END 최근운동기록 변화그래프 사진첩-->

                    <div class="inside show">

                    <div  id="recentRecord" >

                        <ul id="exRecordList">
                            <li><div>최근 운동일</div>
                            <%if(exRecentRecord!=null) {%>
                            <%=exRecentRecord.getEndTime() %>
                            <%}else{ %>0<%} %>
                            </li>
                            <li><div>소모칼로리</div>
                            <%if(exRecentRecord!=null) {%>
                            <%=exRecentRecord.getKcal() %>
                            <%}else{ %>0<%} %>
                            </li>
                            <li><div>시즌 소모 칼로리</div><%=sumKcal %></li>
                            <li><div>최근 BMI</div> 
                            <%if(exRecentRecord!=null) {%>
                            <%=exRecentRecord.getBmiAfter() %>
                            <%}else{ %>0<%} %>
                            </li>
                            <li><div>운동시간</div><%=diffHours %>:<%=diffMinutes %>:<%=diffSeconds %></li>
                            <li><div>시즌 운동 시간</div>0:55:20</li>
                            <li><div>시즌최고중량</div>
							<%if(exRecentRecord!=null) {%>
                            <%=exRecentRecord.getHeaviest() %>
                            <%}else{ %>0<%} %>
                            kg</li>
                            <li><div>평균심박수</div>
                            <%if(exRecentRecord!=null) {%>
                            <%=exRecentRecord.getAvgBpm() %>
                            <%}else{ %>0<%} %>
                            BPM</li>
                            <li><div>최고심박수</div>
                            <%if(exRecentRecord!=null) {%>
                            <%=exRecentRecord.getHighBpm() %>
                            <%}else{ %>0<%} %>
                            BPM</li>
                        </ul>
                    </div>

                        <div>
                            <img src="img/inbody_example.PNG">
                        </div>

                    </div>


                    <!--변화 그래프-->
                    <div id="changeGraph" class="inside">
                        <div>
                            <canvas id="myChart"></canvas>
                        </div>
                    </div>


                    <!--사진첩-->
                    <div id="album" class="inside">
                        <div id="albumBox">
                            <div id="panorama">파노라마</div>
                            <ul id="albumList">
                            </ul>
                            <!-- 띄울 사진이 9개 이상일 때만 더보기 버튼 가능  -->
                            <%if(exPhotoNum>9) {%>
                             <div id="showMorePage">
        					더보기
        					</div> 
        					<%} %>
                        </div>
                    </div>

                </div>
                <!--내운동 기록 tab END-->


                <!--내 강의 목록-->
                <div class="basic_tab">					

                    <!--lectureTab-->
                    <%if(lectureListStd==null) {%>
                    <div id="lectureTab">
                        <ul id="lectureList">
                            <li>
                                <h2>"등록된 강의가 없습니다."</h2>
                                <hr/>
                            </li>
                            <li>
                            </li>
                        </ul>
                    </div>
                    <%}else {%>
                        <%@include file="/WEB-INF/template/lecture_list.jsp" %>
                    <!--lectureTab END-->
					<%} %>

                </div>
                <!--내 강의 목록 END-->
					<div class="basic_tab">
						<%@ include file="/WEB-INF/template/subscribe_coach_list.jsp" %>
					</div>
            </div>
            <!--content END-->

        </div>
        <!--container END-->
    </div>
    <!--wrap END-->
<!-- 파노라마 /////////////////////////////////////////////////////////////////////////// -->
<%if(photoInPano!=null) {%>
<div id="coverWhite" ><!--닫기표시 end-->
    <div id="prevImageBtn" class="image_btn"> <i class="fas fa-chevron-left"></i></div>
    <div id="hiddenImageBox">
    		
            <ul id="imageList">
            	<%for(ExRecordPhoto photo:photoInPano) {%>
                <li class="hiddenImage">
                <img src="img/exRecordPhoto/<%=photo.getImgUrl()%>"></li>
                <%} %>
            </ul><!--이미지리스트end-->
        
        <div class="closeView close"><i class="fas fa-times"></i></div>
    </div><!--이미지 더보기 end-->
    <div id="nextImageBtn" class="image_btn"> <i class="fas fa-chevron-right"></i></div>
</div><!--파노라마 커버 end-->
<%}else{%>
<script>alert("등록된 사진이 없습니다.")</script>
<%} %>

<!-- end 파노라마 ////////////////////////////////////////////////////////////////////// -->


<!-- 0131 파노라마 수정 -->
<!-- 0126 :  파노라마 사진 템플릿  -->
<script type="text/template" id="photoListTmpl">
<@ _.each(photoList,function(photo){ @>
 <li><div><@=photo.regdate@></div><img src="img/exRecordPhoto/<@=photo.imgUrl@>"
	></li>
<@ })@>
</script>
<!-- end 파노라마  -->



<!--  chart.js  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
<script src="/js/jquery.js"></script>
<script src="/js/header.js"></script>
    <script>
    
  
    
    
        $(".basic_active_tab li").on("click",function (e) {
        
         //1) 기존의 on 클래스를 제거
         $(".on").removeClass("on");

         // 2) 클릭한 그 li요소에 on 클래스를 더한다.
         $(this).addClass("on");

         // 4) 우리가 클릭한 그 요소의 index를 얻어옴
         const idx =$(this).index();
         // console.log(idx);

         // 5) .tab 요소들 중 해당 index에 있는 요소에
         //     on 클래스를 더한다.
         $(".basic_tab").eq(idx).addClass("on");
         
         
         //calendar.render();
     	

        }); //.active_tab li click() end



        $("#tabButton div").on("click",function (e) {

            //1) 기존의 on 클래스를 제거
            $(".pick").removeClass("pick");

            // 2) 클릭한 그 li요소에 on 클래스를 더한다.
            $(this).addClass("pick");

            // 4) 우리가 클릭한 그 요소의 index를 얻어옴
            const idx =$(this).index();
            console.log(idx);

            // 5) .tab 요소들 중 해당 index에 있는 요소에
            //     on 클래스를 더한다.
            $(".inside").removeClass("show");

            $(".inside").eq(idx).addClass("show");

        }); //.active_tab li click() end


        <%--chart.js를 사용해서 차트를 만들어주는 부분 --%>

        const ctx = $("#myChart");

        const labels =['20.11.20', '20.11.20', '20.11.20', '20.11.20', '20.11.20'];
        const data=[100,120,89,85];

        new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: '체중(kg)',
                    data: data,
                    borderColor: "rgba(224, 224, 224, 0.75)", // 선의 색깔
                    backgroundColor: "rgba(249, 27, 78, 1)", // 포인터의 색깔
                    fill: false, //꺾은선 아랫부분을 채울지 말지
                    lineTension: 0
                }]
            },
            options: {
                responsive: true,
                title: {
                    display: false,
                    text: '라인 차트 테스트'
                },
                legend:{
                    display:false
                },
                tooltips: {
                    mode: 'index',
                    intersect: false,
                },
                hover: {
                    mode: 'nearest',
                    intersect: true
                },
                scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: '날짜 및 시간'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        ticks: {
                            suggestedMin: 30, //시작점
                        },
                        scaleLabel: {
                            display: true,
                            labelString: '체중'
                        }
                    }]
                }
            }
        });
        
        
        
        
        // 0126 ================================================================================
        _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
        // 사진 템플릿 
        const photoListTmpl = _.template($("#photoListTmpl").html());
        
       
        // 사진 전체
        const $albumList=$("#albumList");

        
        // 0126 파노라마 에서 사진 마우스 엔터시 
        $albumList.on("mouseenter","li",function(){
        	$(this).find("div").toggleClass("on");
        });
        // 파노라마에서 마우스 나가면 
        $albumList.on("mouseleave","li",function(){
        	$(this).find("div").toggleClass("on");
        });
      
        
        
        const exPhotoNum=<%=exPhotoNum%>; // 사진의 개수
        let pageNo=1; // 페이지 번호
        let numPage=9; // 페이지에 표시할 카드의 수
        // 최대 페이지 번호
        let maxPageNo;

     	if(exPhotoNum%9==0){
     		maxPageNo=exPhotoNum/numPage;
     	}else{
     		maxPageNo=parseInt(exPhotoNum/numPage)+1;
     	}
     	
     
        
        // 한번 일단 출력
        getExRecordPhotos();
        
        
        // 더보기 버튼을 눌렀을 때 
        $showMorePage.on("click",function(){
        	pageNo++;
        	if(pageNo>=maxPageNo){
        		pageNo=maxPageNo;
        		$showMorePage.addClass("hidden");
        	}
        	getExRecordPhotos();
        });
        
        
        
        
        // 운동 기록 사진들을 불러오는 함수 
        function getExRecordPhotos(){
        	

            let jsonData ={
                	"pageNo":pageNo,
                    "numPage":numPage,
                };
        	
        	
        	$.ajax({
        		url:"/ajax/ExRecordPhotos.json",
        		type:"get",
        		data:jsonData,
        		error:function(){
        			alert("서비스 점검중 입니다. ");
        		},
        		success:function(json){
        			console.log(json);
        			$albumList.html(photoListTmpl({photoList : json}));
        		}
        	});
        	
        	
        }
        
        
        
        
        
        
        // 파노라마를 클릭하면 //////////////////////////////////////////////////////////////////
        const $panoramaBtn=$("#panorama");
        const $closePanoramaBtn=$(".close");
        $panoramaBtn.on("click",function(){
        	$("#coverWhite").css("display","block");
        })
        $closePanoramaBtn.on("click",function(){
        	$("#coverWhite").css("display","none");
        })
        
        let left=0;
        $("#nextImageBtn").click(function () {
            let numOfImage=$('#imageList li').length;
            let limit = -600 * (numOfImage-1);
            if(left>limit){
                left+= -600*(numOfImage-1);
                $("#imageList").css({"left":left
                	,"transition":numOfImage+"s linear"
                	});
                
            }
     
        });
        $("#prevImageBtn").click(function () {
        	
            if(left<0){
                left= 0;
                $("#imageList").css({"left":left
                	,"transition":"10s ease"
                	});
            }
        });

        // ===========================================================================================
        
     </script>

</body>
</html>