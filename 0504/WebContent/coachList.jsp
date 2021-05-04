<%@page import="com.joa.sht.gym_zip.util.PaginateUtil"%>
<%@page import="com.joa.sht.gym_zip.dao.CoachDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>코치리스트</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/header.css"/>
    <link rel="stylesheet" href="/css/footer.css"/>

    <style>

/*   컨테이너 CSS */
#container {
	width: 1100px;
	min-height: 1600px;
	/*height: auto;*/
	/*border-left:1px solid #424242;*/
	/*border-right:1px solid #424242;*/
	margin: auto;
	/*padding-bottom:100px;*/
	/*background-color: red;*/
}
/* 코치 리스트 CSS*/
#coachFilter {
	width: 1100px;
	height: 200px;
	padding: 10px 0px;
	box-shadow: 1px 1px 5px 0 rgba(0, 0, 0, 0.5);
	/*margin-bottom: 30px;*/
	/*background-color: aquamarine;*/
}
/*코치필터 항목별 박스모델*/
#sort, #daysFilter, #timesFilter {
	width: 1000px;
	height: 60px;
	line-height: 60px;
	margin: auto;
	/*background-color: red;*/
	vertical-align: center;
}
/*필터항목이름*/
#coachFilter strong {
	width: 60px;
	height: 40px;
	margin: 0px 10px;
	line-height: 40px;
	font-size: 20px;
	font-weight: bold;
}
/*버튼 라벨 CSS*/
.sort, .days_filter {
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

.times {
	width: 148px;
	font-size: 10px;
	height: 38px;
	color: black;
	padding: 0px;
	border: 1px solid black;
	background-color: white;
	border-radius: 25px;
	font-weight: bold;
	outline: none;
}
/*정렬 라벨*/
#sort label {
	width: 118px;
	height: 38px;
}
/*요일 필터 버튼*/
#daysFilter button {
	width: 58px;
}
/*시간 필터 버튼*/
#timesFilter button {
	width: 148px;
}
/*라디오인풋 비활성화 */
input[type=radio], input[type=checkbox] {
	display: none;
}
/*라디오인풋+라벨 CSS */
/* +: 다음요소 선택자*/
input[type=radio]+label {
	display: inline-block;
	/*padding: 8px 12px;*/
	border: 1px solid black;
	border-radius: 25px;
	cursor: pointer;
	user-select: none;
	margin: 5px 0;
	text-align: center;
	line-height: 40px;
}

input[type=checkbox]+label {
	width: 100px;
	display: inline-block;
	/*padding: 8px 12px;*/
	border: 1px solid black;
	border-radius: 25px;
	cursor: pointer;
	user-select: none;
	margin: 5px 0;
	text-align: center;
	line-height: 40px;
}

input[type=radio]+label:hover, input[type=checkbox]+label:hover {
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

input[type=radio]:checked+label, input[type=checkbox]:checked+label {
	color: rgb(249, 27, 78);
	border-color: rgb(249, 27, 78);
}

li a {
	display: block;
	cursor: pointer;
}

/* 코치 리스트 CSS*/
#container ul {
	width: 1000px;
	margin: auto;
	overflow: hidden;
	
}
/*코치 카드 CSS*/
.coach_card {
	width: 300px;
	height: 300px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	border-radius: 15%;
	position: relative;
	float: left;
	overflow: hidden;
	margin: 40px 15px;
}
/*카드 컨텐츠 */
.card_contents {
	width: 300px;
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
.card_bar {
	float: left;
}
/*kcal & 평점 단 CSS*/
.card_contents .kcal, .card_contents .score {
	/*position: absolute;*/
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}
/*kcal박스 CSS설정*/
.kcal {
	width: 180px;
	background-color: rgb(249, 27, 78);
	height: 30px;
	color: white;
}
/*평점박스 CSS설정*/
.score {
	width: 117px;
	background-color: rgb(255, 255, 255);
	height: 28px;
	border: 1px solid rgb(249, 27, 78);
	color: rgb(249, 27, 78);
}
/*코치 이름 박스 CSS설정*/
.name {
	width: 140px;
	height: 30px;
	line-height: 30px;
	margin: 5px 0px 5px 40px;
	background-color: white;
	font-size: 15px;
	text-align: center;
	margin-right: 10px;
	/*border: 1px solid #424242;*/
}
/*tier 박스 CSS설정*/
.tier {
	width: 50px;
	font-size: 12px;
	text-align: left;
	height: 30px;
	margin: 5px 0px;
	line-height: 30px;
}
/*요일 박스 CSS설정*/
.days {
	width: 200px;
	margin: auto;
	text-align: center;
}
/*각 요일별 CSS*/
.days li {
	width: 20px;
	height: 20px;
	line-height: 20px;
	margin-left: 5px;
	border: 1px solid black;
}
/* 운동 수 박스 CSS설정*/
.muscle {
	width: 100px;
	height: 30px;
	text-align: center;
	/*border: 1px solid #424242;*/
	margin: 5px 100px 0px 100px;
}
/*운동 이미지 CSS설정*/
.muscle img {
	/*border: 1px solid #424242;*/
	
}
/*운동 숫자 영역 CSS설정*/
.muscle div {
	float: right;
	width: 60px;
	height: 30px;
	line-height: 30px;
	text-align: left;
}
/*on 설정*/
#container #coachList .on {
	color: rgb(249, 27, 78);
	border-color: rgb(249, 27, 78);
}

/*paginate css*/
#pagingBox {
	position: relative;
	bottom: 0px;
	width: 1100px;
	height: 50px;
	text-align: center;
	line-height: 50px;
}

.paginate a{
	width:50px;
	height:50px;
	display: inline-block;
	font-size: 18px;
}
.paginate span{
	width:50px;
	height:50px;
	display: inline-block;
	font-size: 18px;
}
.paginate strong{
	width:50px;
	height:50px;
	display: inline-block;
	font-size: 22px;
	color: #f91b41;
}
.paginate i{
	width:50px;
	height:50px;
	display: inline-block;
	font-size: 18px;
}

</style>
     
</head>
<body>
<!--wrap 영역-->
<div id="wrap">

<!--header include  --> 
<%@ include file="/WEB-INF/template/header.jsp" %>


<div id="container">
<div id="coachFilter"><!--필터-->
<!--    정렬 필터-->
    <div id="sort">
        <strong>정렬</strong>
        <input id="kcal" type="radio" name="sort" value="kcal" checked="checked"/>
        <label for="kcal" class="sort">칼로리순</label>
        <input id="register" type="radio" name="sort" value="register"/>
        <label for="register" class="sort">등록순</label>
        <input id="score" type="radio" name="sort" value="score"/>
        <label for="score" class="sort">평점순</label>
        <input id="coachTier" type="radio" name="sort" value="coachTier"/>
        <label for="coachTier" class="sort">코치티어순</label>
        <input id="subscription" type="radio" name="sort" value="subscription"/>
        <label for="subscription" class="sort">구독순</label>
    </div>
<!--    요일 필터-->
    <div id="daysFilter">
        <strong>요일</strong>
        <input type="checkbox" id="monday" name="days" value="1">
        <label for="monday" class="days_filter">월</label>
        <input type="checkbox" id="tuesday" name="days" value="2">
        <label for="tuesday" class="days_filter">화</label>
        <input type="checkbox" id="wednesday" name="days" value="3">
        <label for="wednesday" class="days_filter">수</label>
        <input type="checkbox" id="thursday" name="days" value="4">
        <label for="thursday" class="days_filter">목</label>
        <input type="checkbox" id="friday" name="days" value="5">
        <label for="friday" class="days_filter">금</label>
        <input type="checkbox" id="saturday" name="days" value="6">
        <label for="saturday" class="days_filter">토</label>
        <input type="checkbox" id="sunday" name="days" value="0">
        <label for="sunday" class="days_filter">일</label>
    </div>
<!--    시간필터-->
    <div id="timesFilter">
        <strong>시간</strong>
        <input type="checkbox" id="dawn" name="times" value="1">
        <label for="dawn" class="times">새벽(03:00~05:00)</label>
        <input type="checkbox" id="morning" name="times" value="2">
        <label for="morning" class="times">오전(06:00~12:00)</label>
        <input type="checkbox" id="afternoon" name="times" value="3">
        <label for="afternoon" class="times">오후(13:00~18:00)</label>
        <input type="checkbox" id="evening" name="times" value="4">
        <label for="evening" class="times">저녁(19:00~22:00)</label>
        <input type="checkbox" id="night" name="times" value="5">
        <label for="night" class="times">심야(23:00~02:00)</label>
    </div>
</div><!--coachFilter end-->

<div id="coachListBox"><!--coachList-->
<!--3단 첫줄 -->


</div><!--coachListBox end-->


</div><!--container end-->

<!-- footer include -->
<%@ include file="/WEB-INF/template/footer.jsp" %>

</div>
<!--wrap END-->
<script type="text/template" id="coachCardTmpl">
<ul id="coachList">
    <@ _.each(coachList, function(coach){ @>
    <!--   코치 카드 -->
	<a href="/coach_mypage.jsp?no=<@=coach.no@>">
    <li class="coach_card">
        <!--        코치 이미지-->
        <img src="/img/coach/<@=coach.coachImage@>" width="300px" height="200px"/>
        <!--        카드 컨텐츠 -->
        <div class="card_contents">
            <!--            칼로리,평점 바-->
            <div class="bar">
                <div class="card_bar kcal"><@=coach.kcalTotal@>kcal</div>
                <div class="card_bar score"><@=(coach.avgScore).toFixed(1)@>(<@=coach.reviewNum@>)</div>
            </div>
            <!--            코치명, 등급-->
            <div class="bar">
                <div class="card_bar name" ><@=coach.nickname@></div>
                <div class="card_bar tier"><@=coach.tier@></div>
            </div>
            <!--            근무일 표기-->
            <div class="bar days">
                <ul>
                    <li class="card_bar <@if(coach.mondayOnOff != 0){@> on <@}@>">월</li>
                    <li class="card_bar <@if(coach.tuesdayOnOff != 0){@> on <@}@>">화</li>
                    <li class="card_bar <@if(coach.wednesdayOnOff != 0){@> on <@}@>">수</li>
                    <li class="card_bar <@if(coach.thursdayOnOff != 0){@> on <@}@>">목</li>
                    <li class="card_bar <@if(coach.fridayOnOff != 0){@> on <@}@>">금</li>
                    <li class="card_bar <@if(coach.saturdayOnOff != 0){@> on <@}@>">토</li>
                    <li class="card_bar <@if(coach.sundayOnOff != 0){@> on <@}@>">일</li> 
                </ul>
            </div>
            <!--운동한사람 수 표기-->
            <div class="bar muscle">
                <img src="img/muscle.png" width="30"/><div><@=coach.viewCountSum@></div>
            </div>
        </div>
    </li><!-- 코치 카드 끝-->
	</a>
    <@})@>
</ul>

<div id="pagingBox">
<@=paginate@>
</div>

</script>
<script src="/js/header.js"></script>
<script>

	const $coachListBox=$("#coachListBox");
	const $pagingBox=$(".paginate a");
	let page=1;

	    // 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};


    $.ajaxSettings.traditional = true;
    
    $('button').click(function (){
        $(this).toggleClass('on');
    });//click;

   
    const $coachListTmpl = _.template($("#coachCardTmpl").html());
 
    
    $(document).on("click",".paginate a",function(e){
    	
    	e.preventDefault();
    	
    	page = this.dataset.page;
    	//page= $(this).html();
    	console.log("클릭시: "+page);
    	
    	 //코치리스트 호출
        getCoachList();
    	 
    });

    function getCoachList() {
        //sort filter 값 가져오기
        let sort=$("input:radio[name='sort']:checked").val();

        //days filter 값 가져오기
        let days=[];
        //each 이용해 체크박스 중 체크된 것들의 value를 배열에 담는다.
        $("input:checkbox[name='days']:checked").each(function (index) {
            //each 이용해 체크된 value를 배열에 담는다.
            days.push($(this).val());
        });
        
        
        //times filter 값 가져오기
        let times=[];
        //each 이용해 체크박스 중 체크된 것들의 value를 배열에 담는다.
        $("input:checkbox[name='times']:checked").each(function (index) {
            times.push($(this).val());
        });
        
        
        let data ={
            "sort":sort,
            "days":days,
            "times":times,
            "page":page,
        }
        
        // ajax
        $.ajax({
            url:"/ajax/getCoachList.json",
            type:"get",
            data:data,
            error:function() {
            	
                alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
                
            },
            success:function (json) {
            	console.log(json);
                $coachListBox.html($coachListTmpl(json));
                
            }
        })
    }//getCoachList() end
    
    //코치리스트 호출
    getCoachList(); 
    
    
    
 

    $("input[type=radio]").on("change",function(){
    
    	page = 1;
    	getCoachList();
    
    });//input[type=radio] change() END
    
    
    $("input[type=checkbox]").on("change",function(){
    	page = 1;
    	getCoachList();
        
    });//input[type=checkbox] change() END
    
</script>
</body>
</html>