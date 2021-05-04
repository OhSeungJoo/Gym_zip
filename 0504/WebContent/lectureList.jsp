<%@page import="com.joa.sht.gym_zip.dao.LectureDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Gym.zip</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/notosanskr.css"/>
    <link rel="stylesheet" href="css/all.min.css"/>
    <link rel="stylesheet" href="css/notosanskr.css">
    <link rel="stylesheet" href="css/rSlider.min.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="icon" href="/img/img/logo_coral.ico">
    <style>
        /*   컨테이너 CSS */
        #container{
            width: 1100px;
            min-height: 1600px;
            /*height: auto;*/
            /*border-left:1px solid #424242;*/
            /*border-right:1px solid #424242;*/
            margin: auto;
            padding-bottom:100px;

        }
        /*   강의 필터 CSS */
        #lectureFilter{
            width: 1100px;
            height: 300px;
            padding: 10px 0px;
            box-shadow: 1px 1px 5px 0 rgba(0,0,0,0.5);
            /*margin-bottom: 30px;*/
            /*background-color: aquamarine;*/
        }
        /*   필터 항목박스 CSS */
        #sort,#levelFilter,#lengthFilter,#genderFilter {
            width: 1000px;
            height:60px;
            line-height: 60px;
            margin: auto;
            /*background-color: red;*/
            vertical-align: center;
        }
        /*   필터 항목 CSS */
        #lectureFilter strong {
            width: 60px;
            height: 40px;
            margin: 0px 10px;
            line-height: 40px;
            font-size: 20px;
            font-weight:bold;

        }
        /*   라벨  CSS */
      .sort,.level,.gender {
            width: 118px;
            height: 38px;
            color: black;
            padding: 0px;
            border: 1px solid black;
            background-color: white;
            border-radius: 25px;
            font-size: 16px;
            font-weight: bold;
            outline: none;
        }

        /*필터 항목 제목 CSS*/
        #lectureFilter #sort strong,#lectureFilter #genderFilter strong,#lengthFilter strong, #levelFilter strong {
            padding-right: 20px;
        }

        /* 시간 필터 CSS */
        #container #lengthFilter {
            /*background-color: orangered;*/
            position: relative;

        }
        #container #lectureFilter #lengthFilter label{
            border: none;
            position: absolute;
            left: 500px;
            user-select: none;

        }
        #container #lengthFilter .rs-container{
            display: inline-block;
            vertical-align: middle;
            position: absolute;
            /*border: 1px solid red;*/

        }
        /*강의 리스트 */
        #container ul{
            width: 1000px;
            margin: auto;
            overflow: hidden;
        }
        /*강의 카드*/
        .lecture_card{
            width: 300px;
            height:300px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            border-radius: 15%;
            position: relative;
            float: left;
            overflow: hidden;
            margin: 40px 15px;
        }
        /*카드 내용 CSS*/
        .card_contents{
            width:300px;
            height: 130px;
            font-weight: bold;
            position: absolute;
            bottom: 0;
        }
        /*컨텐츠 단 설정*/
        .bar {
            overflow: hidden;
        }
        /*단 수평블록 설정*/
        .card_bar{
            float:left;
        }
        /*kcal 난이도 평점 단*/
        .card_contents .lecture_kcal,.card_contents .lecture_level ,.card_contents .lecture_score{
            /*position: absolute;*/
            font-size: 20px;
            font-weight: bold;
            text-align: center;
        }
        /*칼로리 박스*/
        .lecture_kcal {
            width: 120px;
            background-color: rgb(249,27,78);
            height:30px;
            line-height: 30px;
            color: white;
        }
        /*난이도 박스*/
        .lecture_level{
            width:60px;
            background-color: rgb(255,255,255);
            height:28px;
            line-height: 30px;
            border-bottom: 1px solid rgb(249,27,78);
            border-top: 1px solid rgb(249,27,78);
            color:  rgb(249,27,78);
        }
        /*평점 박스*/
        .lecture_score{
            width:120px;
            background-color: rgb(249,27,78);
            height:30px;
            line-height: 30px;
            color: white;
         }
        /*강의 타이틀 박스*/
        .lecture_title{
            width:300px;
            height:30px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            line-height: 30px;
        }
        /*깅의 강사 이름 */
        .lecture_name{
            width:150px;
            height:20px;
            line-height: 20px;
            margin:0px 0px 10px 40px;
            background-color: white;
            font-size: 15px;
            text-align: right;
            /*border: 1px solid #424242;*/
        }
        /*강사 티어*/
        .lecture_tier{
            width:50px;
            font-size: 12px;
            text-align: left;
            height: 20px;
            line-height: 20px;
            /*border: 1px solid #424242;*/
        }
        /*강의 판매 정보*/
        .lecture_sales_info{
            width: 200px;
            margin: auto;
            height: 34px;
            line-height: 32px;
            padding-right: 5px;
        }
        /*강의 가격*/
        .lecture_price{
            width: 100px;
            height: 28px;
            line-height: 30px;
            border: 1px solid rgb(249,27,78);
        }
        /*강의 기간*/
        .lecture_due{
            background-color: rgb(249,27,78);
            color: white;
            width: 60px;
            height:30px;
            text-align: center;
        }
        /*강의 선호 성별*/
        .lecture_gender{
           float:right;
            font-size: 30px;
            color: rgb(249,27,78);
        }

        /*라디오인풋 비활성화 */
        input[type=radio],input[type=checkbox]{
            display:none;
        }
        /*라디오인풋+라벨 CSS */
        /* +: 다음요소 선택자*/
        input[type=radio] + label {
             display:inline-block;
             /*padding: 8px 12px;*/
             border: 1px solid black;
             border-radius: 25px;
             cursor:pointer;
             user-select:none;
             margin:5px 0;
             text-align: center;
             line-height: 40px;
         }
        input[type=checkbox] + label {
            width: 100px;
            display:inline-block;
            /*padding: 8px 12px;*/
            border: 1px solid black;
            border-radius: 25px;
            cursor:pointer;
            user-select:none;
            margin:5px 0;
            text-align: center;
            line-height: 40px;
        }
        input[type=radio] + label:hover, input[type=checkbox] + label:hover{
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        input[type=radio]:checked + label, input[type=checkbox]:checked + label{
            color: rgb(249,27,78);
            border-color: rgb(249,27,78);
        }
        li a{
            display: block;
            cursor:pointer;
        }
        
        
        /*페이징 처리 ============================================================*/
        #pagingBtnBox{
        	position:relative;
        	bottom:0px;
        	/*====================================================================*/
        	/*width 값은 버튼의 크기에 따라 달라질 수 있습니다.
        	페이지 버튼의 박스 크기 * 보여지는 페이지 번호의 수 + 2(양 사이드 버튼 )
        	*/
        	width:250px;
        	/*====================================================================*/
        	height:40px;
        	margin-left: 425px;
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
   	 /*페이징 처리*/
   	 
   	  /*로딩이미지*/
   	 #loading { 
   	 width: 100%; 
   	 height: 100%; 
   	 top: 0px; 
   	 left: 0px; 
   	 position: fixed; 
   	 display: block; 
   	 opacity: 0.7; 
   	 background-color: #fff; 
   	 z-index: 99; 
   	 text-align: center; } 
   	 
   	 
   	 #loadingImage {
   	  position: absolute; 
   	  top: 50%; 
   	  left: 50%; 
   	  margin : -150px 0 0 -200px;
   	  z-index: 100; }


   	 
   	 
   	 /*end 로딩 이미지*/
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>

<div id="container">
<div id="lectureFilter"><!--필터-->
<!--    정렬필터-->
    <div id="sort">
        <strong>정렬</strong>
        <input id="kcal" type="radio" name="sort" value="kcal" checked/>
        <label for="kcal" class="sort">칼로리순</label>
        <input id="sales" type="radio" name="sort" value="sales"/>
        <label for="sales" class="sort">판매순</label>
        <input id="register" type="radio" name="sort" value="register"/>
        <label for="register" class="sort">등록순</label>
        <input id="coachTier" type="radio" name="sort" value="coachTier"/>
        <label for="coachTier" class="sort">코치티어순</label>
        <input id="score" type="radio" name="sort" value="score"/>
        <label for="score" class="sort">평점순</label>
        <input id="price" type="radio" name="sort" value="price"/>
        <label for="price" class="sort">가격순</label>
    </div>
<!--    난이도 필터-->
    <div id="levelFilter">
        <strong>난이도</strong>
        <input id="bigginer" type="checkbox" name="level" value="1">
        <label for="bigginer"  class="level">초급</label>
        <input id="intermediate" type="checkbox" name="level" value="2">
        <label for="intermediate"  class="level">중급</label>
        <input id="advanced" type="checkbox" name="level" value="3">
        <label for="advanced"  class="level"> 고급</label>
    </div>
<!--    선호 성별 필터-->
    <div id="genderFilter">
        <strong>대상</strong>
        <input id="male" type="checkbox" name="gender" value="1">
        <label for="male" class="gender">남자</label>
        <input id="female" type="checkbox" name="gender" value="2">
        <label for="female" class="gender">여자</label>
        <input id="middle" type="checkbox" name="gender" value="3">
        <label for="middle" class="gender">공용</label>
    </div>
<!--    강의시간 필터-->
    <div id="lengthFilter">
        <strong>시간</strong> <label for="sampleSlider">0</label>
        <input type="text" id="sampleSlider" />
    </div>
</div><!--lectureFilter end-->

<div id="lectureListBox"><!--lectureList-->
    <!--3단 첫줄 -->
    <ul id="lectureList">

    </ul>
</div><!--lectureList end-->
    <!-- 페이징 버튼  -->
<div id="pagingBtnBox" class="paging"><!--  
     --><div id="prevBtn" class="side_btn"><</div><!-- 
  --><div id="pagingBtnList"calss="paging"></div><!--  
     --><div id="nextBtn" class="side_btn">></div>
</div>
<!-- end 페이징 버튼 -->

</div><!--container end-->
<!-- 로딩 이미지 -->
<div id="loading">
	<img id="loadingImage" src="/img/loader.gif">
</div>

<!-- end 로딩 이미지 -->

<!-- 강의 템플릿 -->
<script type="text/template" id="lectureTmpl">
    <@ _.each(lectureList, function(lecture){ @>
    <li class="lecture_card"><!-- 강의 카드-->
		<a href="/lecture_detail.jsp?no=<@=lecture.no@>">
        <img src="/img/thumbnail/<@=lecture.thumbnail@>" width="300px" height="200px"
			 onerror="this.src='img/thumbnail/<@=lecture.no@>'+'.JPG';"/><!-- 강의 이미지-->
        <div class="card_contents"><!-- 강의 카드내용-->
            <div class="bar"><!-- kcal, 난이도, 평점 바-->
                <div class="card_bar lecture_kcal"><@=lecture.kcal@>kcal</div>
                <div class="card_bar lecture_level"><@=lecture.levels@></div>
                <div class="card_bar lecture_score"><@=lecture.avgRating@>(<@=lecture.reviewNo@>)</div>
            </div>
            <div class="lecture_title"><!-- 강의 타이틀 -->
                <@=lecture.title@>
            </div>
            <div class="bar"><!-- 강의 강사 이름 등급 바-->
                <div class="card_bar lecture_name" ><@=lecture.nickname@></div>
                <div class="card_bar lecture_tier"><@=lecture.tierName@></div>
            </div>
            <div class="bar lecture_sales_info"> <!-- 강의 판매 관련정보-->
                <div class="card_bar bar lecture_price"><!-- 강의 가격-->
                    <div class="card_bar">
                        <img src="img/energy.png" width="28"/> <!-- 에너지 이미지-->
                    </div>
                    <div class="card_bar"> <!-- 강의 가격-->
                        <@=lecture.cost@>
                    </div>
                </div>
                <div class="card_bar lecture_due"><@if(lecture.period==99999){@>
													평생<@}else{@>
															<@=lecture.period@>
															<@}@></div> <!-- 강의 기간-->
                <div class="card_bar lecture_gender">
                    <@ if(lecture.targetGender=="F") { @>
                    <i class="fas fa-venus"></i>
                    <@ }else if(lecture.targetGender=="M") { @>
                    <i class="fas fa-mars"></i>
                    <@ } else { @>
                    <i class="fas fa-venus-mars"></i>
                    <@} @>
                </div> <!-- 강의 선호성별-->
            </div>
        </div>
		</a>
    </li><!--강의 카드 end-->
    <@})@>
</script>
<!--// 강의 템플릿 -->
<script src="js/jquery.js"></script>
<%@ include file="/WEB-INF/template/footer.jsp" %>
<script src="js/underscore-min.js"></script>
<script src="js/rSlider.min.js"></script>
<script>
// 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
$.ajaxSettings.traditional = true;


//================================================================================================
	/*강의  페이징 처리 */
	/*강의 수  (초기에는 전체로 설정 )*/
	let lectureNum;   
	const numBlock = 3;  // 한 번에 보일 페이지 버튼 개수 
	let pageNo=1; // 일단 첫 페이지는 1로 설정 
	const numPage=9; // 한 페이지에 보일 리뷰의 개수 
	let pageBtnNum; // 페이지 버튼 개수

	 // 페이지 버튼 목록
	 const $pagingBtnList=$("#pagingBtnList");
	 // 페이지 번호 버튼 양 사이드에 있는 버튼들 
	 const $sideBtn=$("#pagingBtnBox .side_btn");
	
//==================================================================================================
    //강의 템플릿
    const lectureTmpl = _.template($("#lectureTmpl").html());
    //강의 목록(ul)
    const $lectureList= $("#lectureList");
    // 로딩 이미지
	const $loading=$("#loading");
    getLectureList(); // 처음 입장 시 강의 카드들 출력
//==================================================================================================

    //필터에 따라서 강의 목록을 불러오는 함수
    function getLectureList() {
    	$loading.show();
        //sort filter 값 가져오기
        let sort=$("input:radio[name='sort']:checked").val();

        //level filter 값 가져오기
        let level=[];
        //each 이용해 체크박스 중 체크된 것들의 value를 배열에 담는다.
        $("input:checkbox[name='level']:checked").each(function (index) {
            //each 이용해 체크된 value를 배열에 담는다.
            level.push($(this).val());
        });
        //gender filter 값 가져오기
        let gender=[];
        //each 이용해 체크박스 중 체크된 것들의 value를 배열에 담는다.
        $("input:checkbox[name='gender']:checked").each(function (index) {
            gender.push($(this).val());
        });
        //time filter 값 가져오기
        let time=$("#sampleSlider").val().split(',');
        
        // 초기의 null 값 설정
        if(time[1]==null){
        	time[0]=0;
        	time[1]=120;
        }
        
        //ajax로 서버로 보낼 데이터(JSON으로 작성)
        const data={
            sort:sort,
            level:level,
            gender:gender,
            timeRangeStart:time[0],
            timeRangeEnd:time[1],
            pageNo:pageNo,
            numPage:numPage
        };
       

        // 카드 수 구하기 
        // ajax
        $.ajax({
            url:"/ajax/getLectureCardCount.json",
            data:data,
            type:"get",
            error:function() {
                alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
            },
            success:function (json) {
            	
            	console.log(json.lectureNum);
            	lectureNum=json.lectureNum;
            	// end 카드 수 구하기 
            	// 카드가 하나도 없으면 
             	if(lectureNum==0){
             		$sideBtn.addClass("hidden");
             	}else{
             		$sideBtn.removeClass("hidden");
             	}
            	
            	$pagingBtnList.empty();
            	
            	/*강의 카드 수에 따른 페이지 번호 버튼 생성 하기 */
            	/*버튼의 개수 = (강의 수 / 한번에 보일 리뷰의 수) +1 (나머지가 있을 경우) */
            	if(lectureNum%numPage==0){
            		pageBtnNum=parseInt(lectureNum/numPage);
            	}else{
            		pageBtnNum=parseInt(lectureNum/numPage)+1;
            	}
            	 $pagingBtnList.css("width",50*pageBtnNum+"px");
            	 /*버튼의 개수 만큼 버튼 생성 */
            	 for(let i=0;i<pageBtnNum;i++){

            		 const $pageBtn=$("<div>").text(i+1);
            		 
            		 $pagingBtnList.append($pageBtn);
            	 }
            	
    
            	 
            	 
            	// 페이지 버튼들
            	 const $pagingBtnItem=$("#pagingBtnList div");
            	 
                    

            	 // 카드 출력 =================================================
            	$.ajax({
            		url:"ajax/lectureListFilter.json",
                    data:data,
                    type:"get",
                    error:function() {
                        alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
                    },
                    success:function (json) {
                    	 $lectureList.html(lectureTmpl({lectureList : json}));
                    	 $pagingBtnItem.eq(pageNo-1).css("background-color","rgb(249,27,78)");
                    	
                    }
            	})
            	// end 카드 출력 =================================================
               
            }
        })
        $loading.hide();
    }//getLectureList() end

    $("input[type=radio]").on("change",function(){
    	pageNo=1;
        getLectureList();
        $pagingBtnList.css("transform","translateX(0px)");
    });
    $("input[type=checkbox]").on("change",function(){
    	pageNo=1;
        getLectureList();
        $pagingBtnList.css("transform","translateX(0px)");
    });
  //  $("#sampleSlider").on("change",function () {
    //	
   // });

    //스크롤 기준 고정 탭
    $( document ).ready( function() {

        var headerOffset = $('#header').offset();
        $(window).scroll( function() {
            if($( document ).scrollTop() > headerOffset.top){
                $('#header').addClass('header_fixed');
            }else{
                $('#header').removeClass('header_fixed');
            }
        });
    } );
    
    //라이브러리 객체 선언
    var slider = new rSlider({
        target: '#sampleSlider',
        values: [0, 30, 60, 90, 120, 150, 180],
        range: true,
        width: 300,
        set: [0, 120],
        tooltip:false,
        onChange: function (vals) {
            // left,right  형식으로 묶여있는 value 값을  String 분할
            var times=vals.split(',');
            if(times[1]==180){ // right 커서가 180일 때
                $("#lengthFilter label").text(times[0]+"분부터 조회");
            }else{//right커서가 180이 아닐 때(max가 180이므로 180 이하)
                $("#lengthFilter label").text(times[0]+"분 부터 "+times[1]+"분까지 조회");
            }
            
            // 시간 필터 변경 시 ============================
            pageNo=1;
            getLectureList();
            $pagingBtnList.css("transform","translateX(0px)");

        }
    });
    
 //===================================================================================
 // 페이지 버튼 눌렀을 경우 
 
    $("#pagingBtnList ").on("click","div",function(e){
        pageNo=$(this).text();// 현재 페이지 번호
        getLectureList();
    
    });
    


    $sideBtn.on("click",function(){
    		 
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

   	 }else if($(this).text()==">"){
   		
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
   	 
   	getLectureList();
   	
   	

    });
    
    //========================================================

</script>
</body>
</html>