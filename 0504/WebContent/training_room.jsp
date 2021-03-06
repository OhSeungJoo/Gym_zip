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

        /* ??????????????? ???*/
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
        /*??? ???????????? ???*/
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
        /*?????? ????????? css*/
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

        /*?????? ??????*/
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

        /*????????? ??????*/
        #pagination{
            width: 200px;
            height: 40px;
            position: absolute;
            left: 350px;
        }


        /*??? ????????????*/


        /*?????? ??? ?????? css*/
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


        /*?????? ?????? ?????? */
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


        /*?????? ?????????*/

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


        /*?????????*/
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

        /*?????????*/

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
        
        /*???????????? ?????? ????????? ????????? ?????????*/
        #albumList li div.on{
        	
        	background-color:rgba(0,0,0,0.7);
        	color:#fff;
        	
        }
       
        .yg_hi{
        	position:relative;
        }
        

          /*????????? ?????? CSS */
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
      
      
 
       /*  ???????????? ?????? CSS ///////////////////////////////////////////////////////////////////////////////////*/
      
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
       /* ?????? ?????? ?????? CSS      ///////////////////////////////////////////////////////////////////////////////////*/
        
        
        
           /*  ???????????? ?????? CSS ///////////////////////////////////////////////////////////////////////////////////*/
      
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
	// ??????????????? ????????? ?????????
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
                    <!--????????? ??????-->
                     <img id="profileImage" src="<%=loginMember.getProfileImg()%>">

                    <!--?????? ?????????-->
                     <div id="userNickname">
                        <strong><%=loginMember.getNickname()%></strong>
                        <!--?????? ??????-->
                        <span class="userTier"><%=getMemberTier %></span>
                     </div>
                    <!--????????? ????????? ??????-->
                     <div id="tmi" class="cover">
                         <span><a href="tmi.html">?????? ??? ??????????????? ??????????</a></span>
                     </div>

                    </div>
                    <!--profile END-->
                    <div id="userInfo">
                        <div id="bodyInfo" class="cover">
                            <span class="women">
                            <%if(loginMember.getGender()=="F"){%>
                           	<%="???" %><%}else{%><%="???" %><%} %>
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
                                    <span>????????????</span>
                                    <div class="bar_contents">
                                    <div id="bmiPart"></div> </div>
                                </dd>

                                <dt>????????????</dt>
                                <dd><span><%if(exRecentRecord!=null) {%>
                                <%=exRecentRecord.getMuscleBone() %>
                                <%}else{ %>0<%} %>
                                </span></dd>
                                <dd>
                                    <span>??????90%</span>
                                    <div class="bar_contents">
                                    <div id="musclePart" ></div> </div>
                                </dd>

                                <dt>???????????????</dt>
                                <dd><span><%if(exRecentRecord!=null) {%>
                                <%=exRecentRecord.getBmm() %>
                                <%}else{ %>0<%} %>
                                </span></dd>
                                <dd>
                                    <span>??????70%</span>
                                    <div class="bar_contents">
                                    <div id="brmPart" ></div></div>
                                </dd>

                                <dt>??? ?????? ?????????</dt>
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
                        <li class="on">??? ????????????</li>
                        <li>??? ????????????</li>
                        <li>??? ????????????</li>
                        <li>????????? ?????? ??????</li>
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
					


                <!--????????? ??????-->
                <div class="basic_tab">

                    <div id="tabButton" class="active_tab_button">
                        <div class="tab_button pick">?????? ?????? ??????</div>
                        <div  class="tab_button">?????? ?????????</div>
                        <div  class="tab_button">?????????</div>
                    </div>
                    <!--tabButton END ?????????????????? ??????????????? ?????????-->

                    <div class="inside show">

                    <div  id="recentRecord" >

                        <ul id="exRecordList">
                            <li><div>?????? ?????????</div>
                            <%if(exRecentRecord!=null) {%>
                            <%=exRecentRecord.getEndTime() %>
                            <%}else{ %>0<%} %>
                            </li>
                            <li><div>???????????????</div>
                            <%if(exRecentRecord!=null) {%>
                            <%=exRecentRecord.getKcal() %>
                            <%}else{ %>0<%} %>
                            </li>
                            <li><div>?????? ?????? ?????????</div><%=sumKcal %></li>
                            <li><div>?????? BMI</div> 
                            <%if(exRecentRecord!=null) {%>
                            <%=exRecentRecord.getBmiAfter() %>
                            <%}else{ %>0<%} %>
                            </li>
                            <li><div>????????????</div><%=diffHours %>:<%=diffMinutes %>:<%=diffSeconds %></li>
                            <li><div>?????? ?????? ??????</div>0:55:20</li>
                            <li><div>??????????????????</div>
							<%if(exRecentRecord!=null) {%>
                            <%=exRecentRecord.getHeaviest() %>
                            <%}else{ %>0<%} %>
                            kg</li>
                            <li><div>???????????????</div>
                            <%if(exRecentRecord!=null) {%>
                            <%=exRecentRecord.getAvgBpm() %>
                            <%}else{ %>0<%} %>
                            BPM</li>
                            <li><div>???????????????</div>
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


                    <!--?????? ?????????-->
                    <div id="changeGraph" class="inside">
                        <div>
                            <canvas id="myChart"></canvas>
                        </div>
                    </div>


                    <!--?????????-->
                    <div id="album" class="inside">
                        <div id="albumBox">
                            <div id="panorama">????????????</div>
                            <ul id="albumList">
                            </ul>
                            <!-- ?????? ????????? 9??? ????????? ?????? ????????? ?????? ??????  -->
                            <%if(exPhotoNum>9) {%>
                             <div id="showMorePage">
        					?????????
        					</div> 
        					<%} %>
                        </div>
                    </div>

                </div>
                <!--????????? ?????? tab END-->


                <!--??? ?????? ??????-->
                <div class="basic_tab">					

                    <!--lectureTab-->
                    <%if(lectureListStd==null) {%>
                    <div id="lectureTab">
                        <ul id="lectureList">
                            <li>
                                <h2>"????????? ????????? ????????????."</h2>
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
                <!--??? ?????? ?????? END-->
					<div class="basic_tab">
						<%@ include file="/WEB-INF/template/subscribe_coach_list.jsp" %>
					</div>
            </div>
            <!--content END-->

        </div>
        <!--container END-->
    </div>
    <!--wrap END-->
<!-- ???????????? /////////////////////////////////////////////////////////////////////////// -->
<%if(photoInPano!=null) {%>
<div id="coverWhite" ><!--???????????? end-->
    <div id="prevImageBtn" class="image_btn"> <i class="fas fa-chevron-left"></i></div>
    <div id="hiddenImageBox">
    		
            <ul id="imageList">
            	<%for(ExRecordPhoto photo:photoInPano) {%>
                <li class="hiddenImage">
                <img src="img/exRecordPhoto/<%=photo.getImgUrl()%>"></li>
                <%} %>
            </ul><!--??????????????????end-->
        
        <div class="closeView close"><i class="fas fa-times"></i></div>
    </div><!--????????? ????????? end-->
    <div id="nextImageBtn" class="image_btn"> <i class="fas fa-chevron-right"></i></div>
</div><!--???????????? ?????? end-->
<%}else{%>
<script>alert("????????? ????????? ????????????.")</script>
<%} %>

<!-- end ???????????? ////////////////////////////////////////////////////////////////////// -->


<!-- 0131 ???????????? ?????? -->
<!-- 0126 :  ???????????? ?????? ?????????  -->
<script type="text/template" id="photoListTmpl">
<@ _.each(photoList,function(photo){ @>
 <li><div><@=photo.regdate@></div><img src="img/exRecordPhoto/<@=photo.imgUrl@>"
	></li>
<@ })@>
</script>
<!-- end ????????????  -->



<!--  chart.js  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
<script src="/js/jquery.js"></script>
<script src="/js/header.js"></script>
    <script>
    
  
    
    
        $(".basic_active_tab li").on("click",function (e) {
        
         //1) ????????? on ???????????? ??????
         $(".on").removeClass("on");

         // 2) ????????? ??? li????????? on ???????????? ?????????.
         $(this).addClass("on");

         // 4) ????????? ????????? ??? ????????? index??? ?????????
         const idx =$(this).index();
         // console.log(idx);

         // 5) .tab ????????? ??? ?????? index??? ?????? ?????????
         //     on ???????????? ?????????.
         $(".basic_tab").eq(idx).addClass("on");
         
         
         //calendar.render();
     	

        }); //.active_tab li click() end



        $("#tabButton div").on("click",function (e) {

            //1) ????????? on ???????????? ??????
            $(".pick").removeClass("pick");

            // 2) ????????? ??? li????????? on ???????????? ?????????.
            $(this).addClass("pick");

            // 4) ????????? ????????? ??? ????????? index??? ?????????
            const idx =$(this).index();
            console.log(idx);

            // 5) .tab ????????? ??? ?????? index??? ?????? ?????????
            //     on ???????????? ?????????.
            $(".inside").removeClass("show");

            $(".inside").eq(idx).addClass("show");

        }); //.active_tab li click() end


        <%--chart.js??? ???????????? ????????? ??????????????? ?????? --%>

        const ctx = $("#myChart");

        const labels =['20.11.20', '20.11.20', '20.11.20', '20.11.20', '20.11.20'];
        const data=[100,120,89,85];

        new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: '??????(kg)',
                    data: data,
                    borderColor: "rgba(224, 224, 224, 0.75)", // ?????? ??????
                    backgroundColor: "rgba(249, 27, 78, 1)", // ???????????? ??????
                    fill: false, //????????? ??????????????? ????????? ??????
                    lineTension: 0
                }]
            },
            options: {
                responsive: true,
                title: {
                    display: false,
                    text: '?????? ?????? ?????????'
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
                            labelString: '?????? ??? ??????'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        ticks: {
                            suggestedMin: 30, //?????????
                        },
                        scaleLabel: {
                            display: true,
                            labelString: '??????'
                        }
                    }]
                }
            }
        });
        
        
        
        
        // 0126 ================================================================================
        _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
        // ?????? ????????? 
        const photoListTmpl = _.template($("#photoListTmpl").html());
        
       
        // ?????? ??????
        const $albumList=$("#albumList");

        
        // 0126 ???????????? ?????? ?????? ????????? ????????? 
        $albumList.on("mouseenter","li",function(){
        	$(this).find("div").toggleClass("on");
        });
        // ?????????????????? ????????? ????????? 
        $albumList.on("mouseleave","li",function(){
        	$(this).find("div").toggleClass("on");
        });
      
        
        
        const exPhotoNum=<%=exPhotoNum%>; // ????????? ??????
        let pageNo=1; // ????????? ??????
        let numPage=9; // ???????????? ????????? ????????? ???
        // ?????? ????????? ??????
        let maxPageNo;

     	if(exPhotoNum%9==0){
     		maxPageNo=exPhotoNum/numPage;
     	}else{
     		maxPageNo=parseInt(exPhotoNum/numPage)+1;
     	}
     	
     
        
        // ?????? ?????? ??????
        getExRecordPhotos();
        
        
        // ????????? ????????? ????????? ??? 
        $showMorePage.on("click",function(){
        	pageNo++;
        	if(pageNo>=maxPageNo){
        		pageNo=maxPageNo;
        		$showMorePage.addClass("hidden");
        	}
        	getExRecordPhotos();
        });
        
        
        
        
        // ?????? ?????? ???????????? ???????????? ?????? 
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
        			alert("????????? ????????? ?????????. ");
        		},
        		success:function(json){
        			console.log(json);
        			$albumList.html(photoListTmpl({photoList : json}));
        		}
        	});
        	
        	
        }
        
        
        
        
        
        
        // ??????????????? ???????????? //////////////////////////////////////////////////////////////////
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