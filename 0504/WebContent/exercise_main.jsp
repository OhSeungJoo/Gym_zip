<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
  String[] partArray={"","하체","가슴","등","어깨","팔","복부","전신"}; 
%>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>대표운동목록</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/header.css">
    <style>
        html{
            overflow-y: scroll;
        }
        #container{
            width: 1100px;
            position: relative;
            margin: auto;
            margin-bottom:10px;
        }
        #content ul{
        	width:1080px;
        	margin:auto;
        	position:relative;
        	overflow:hidden;
        }
        #content li{
            width: 300px;
            height: 300px;
            float: left;
            border-bottom: 1px solid #e0e0e0;
            margin: 30px;
            padding:0px;
            text-align: center;
            border-radius: 10px;
            cursor: pointer;
            box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
        }
        #content li div{
            float: left;
            line-height: 30px;
        }
        #content li img{
            width: 300px;
            height: 200px;
            border-radius: 10px 10px 0 0;
            margin:0;
            background-color:red;
            display:block;
        }
        #content a{
        	display:block;
        	width:300px;
        	height:300px;
        	overflow:hidden;

        }
        .exercise_kcal{
            width: 50%;
            font-weight: 700;
            height:30px;
        }
        .exercise_difiiculty{
            width: 25%;
            border-top:1px solid rgb(249,27,78);
            border-bottom:1px solid rgb(249,27,78);
            height:28px;
        }
        .exercise_part{
            width: 25%;
            height:30px;
        }
        .exercise_name{
            padding: 20px;
            width: 260px;
            font-size: 20px;
            font-weight: 700;

        }
        .exercise_name,.exercise_difiiculty{
            color: rgb(249, 27, 78);
        }
        .exercise_kcal,.exercise_part{
            color: #fff;
            background-color: rgb(249, 27, 78);
        }

        #filter{
            width: 1100px;
            padding: 20px 0;
            height: 170px;
             box-shadow: 1px 1px 5px 0 rgba(0,0,0,0.5);
        }
        .h{
            height: 50px;
            padding: 10px 0px 0px 20px;
        }
        #filter dt{
            width: 80px;
            height:40px;
            line-height: 40px;
            text-align: center;
            font-weight: 700;
            float: left;
        }
        #filter dd{
            background-color: #fff;
            margin: 0 10px;
            
            /*border: 1px solid #424242;*/
            border-radius: 25px;
            float: left;
            text-align: center;
            line-height: 40px;
            overflow:hidden;
        }
        #filter .h dd:hover{
            color: rgb(249, 27, 78);
            cursor: pointer;
        }
         /*라디오인풋 비활성화 */
        input[type=radio],input[type=checkbox]{
            display:none;
        }
        /*라디오인풋+라벨 CSS */
        /* +: 다음요소 선택자*/
        input[type=radio] + label,input[type=checkbox] + label {
            display:inline-block;
            width: 98px;
            height: 38px;
            cursor:pointer;
            user-select:none;
            text-align: center;
            border-radius: 25px;
            line-height: 40px;
            border: 1px solid #424242;
            font-weight:700;
        }
        
        input[type=radio] + label:hover, input[type=checkbox] + label:hover{
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border: 1px solid rgb(249, 27, 78);
        }
        input[type=radio]:checked + label, input[type=checkbox]:checked + label{
            color: rgb(249,27,78);
            border: 1px solid rgb(249, 27, 78);
        }
      /*더보기 버튼 CSS */
      #showMorePage{
      	width:900px;
      	height:40px;
      	line-height:40px;
      	background-color:#999999;
      	color:#fff;
      	position:relative;
      	text-align:center;
      	margin:20px 100px;
      	transition: .2s ease;
      }
      #showMorePage:hover{
      	background-color: rgb(249, 27, 78);
      	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
      }
    </style>
</head>
<body>
<!--wrap 영역-->
<div id="wrap">
	<%@ include file="/WEB-INF/template/header.jsp" %>
    <!-- container 영역-->
    <div id="container">
    <!--filter 영역 -->
    <div id="filter">
        <div id="sort" class="h">
        <!-- 정렬 필터 -->
            <div>
                <dl>
                    <dt>정렬</dt>
                    <dd><input id="radio_search" type="radio" name="sort" value="view" checked><label for="radio_search">조회순</label></input></dd>
                    <dd><input id="radio_kcal" type="radio" name="sort" value="kcal"><label for="radio_kcal">칼로리순</label></input></dd>
                    <dd><input id="radio_regi" type="radio" name="sort" value="regdate"><label for="radio_regi">등록순</label></input></dd>
                    <dd><input id="radio_name" type="radio" name="sort" value="name"><label for="radio_name">이름순</label></input></dd>
                </dl>
            </div>
        </div>
        <!-- 정렬필터 end-->
        <!-- 부위필터 end-->
        <div id="part" class="h">
            <div>
                <dl>
                    <dt>부위</dt>
                    <dd><input type="checkbox"  value="1" id="chk_bottom" name="chk"><label for="chk_bottom">하체</label></input></dd>
					<dd><input type="checkbox"  value="2" id="chk_chest" name="chk"><label for="chk_chest">가슴</label></input></dd>
                    <dd><input type="checkbox"  value="3" id="chk_back" name="chk"><label for="chk_back">등</label></input></dd>
                    <dd><input type="checkbox"  value="4" id="chk_sholder" name="chk"><label for="chk_sholder">어께</label></input></dd>
                    <dd><input type="checkbox"  value="5" id="chk_arms" name="chk"><label for="chk_arms">팔</label></input></dd>
                    <dd><input type="checkbox"  value="6" id="chk_stomach" name="chk"><label for="chk_stomach">복부</label></input></dd>
                    <dd><input type="checkbox"  value="7" id="chk_body" name="chk"><label for="chk_body">전신</label></input></dd>
                </dl>
            </div>
        </div>
        <!-- 부위 필터 end-->
        <!-- 난이도 필터 -->
        <div id="difficulty" class="h">
            <div>
                <dl>
                    <dt>난이도</dt>
                    <dd><input type="radio" value="all" id="difficulty_all" name="difficulty" checked><label for="difficulty_all">전체</label></input></dd>
                    <dd><input type="radio" value="low" id="difficulty_low" name="difficulty"><label for="difficulty_low">초급</label></input></dd>
                    <dd><input type="radio" value="middle" id="difficulty_middle" name="difficulty"><label for="difficulty_middle">중급</label></input></dd>
                    <dd><input type="radio" value="high" id="difficulty_high" name="difficulty"><label for="difficulty_high">고급</label></input></dd>
                </dl>
            </div>
        </div>
        <!-- 난이도필터 end-->
    </div>
    <!-- filter 영역 end-->
    <div id="content">
        <!-- 운동 카드 리스트-->
        <ul id="representExerciseList">
        <!-- 
            <li>
                <a href="">
                <img src="img/leg_raise.JPG"/>
                <div class="exercise_kcal">32Kcal</div>
                <div class="exercise_difiiculty">초급</div>
                <div class="exercise_part">하체</div>
                <div class="exercise_name">레그레이즈</div>
                </a>
            </li>
        -->   
        <!-- 운동 카드 리스트 end-->
        </ul>
        <div id="showMorePage">
        	더보기
        </div>
    </div><!-- content end -->
    </div><!-- container end-->
<script src="js/jquery.js"></script>
    <%@ include file="/WEB-INF/template/footer.jsp" %>
</div>
<!-- wrap end-->

<!-- 템플릿 양식 -->


<script type="text/template" id="representExerciseTmpl">
    <@ _.each(reExList, function(reEx){ @>
    <!--   코치 카드 -->
	<li>
    	<a href="/exercise_listl.jsp?no=<@=reEx.no@>">
        <img src="<@=reEx.thumbnail@>"/>
        <div class="exercise_kcal"><@=reEx.kcal@>Kcal</div>
        <div class="exercise_difiiculty"><@=reEx.levels@></div>
        <div class="exercise_part"><@=reEx.partName@></div>
        <div class="exercise_name"><@=reEx.title@></div>
        </a>
    </li>    
    <@})@>
</script>

<script src="/js/underscore-min.js"></script>
<script src="/js/header.js"></script>
<script>
$("#footer").removeClass("fixed");
//페이지 더보기 버튼
$showMorePage=$("#showMorePage");
//page 번호
let pageNo=1;
//필터에 따른 카드의 최대 수
let maxNumberOfItem=0;
//페이지 로드시에  카드 가져오기
getRepresentExerciseList();

// 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
const $representExerciseTmpl = _.template($("#representExerciseTmpl").html());
const $representExerciseList=$("#representExerciseList");
$.ajaxSettings.traditional = true;
function getRepresentExerciseList() {
    //정렬필터 값 가져오기
    let sort=$("input:radio[name='sort']:checked").val();
    
  	//난이도 필터 값 가져오기
    let difficulty=$("input:radio[name='difficulty']:checked").val();

    //부위 필터 값 가져오기
    let chks=[];
    //each 이용해 체크박스 중 체크된 것들의 value를 배열에 담는다.
    $("input:checkbox[name='chk']:checked").each(function (index) {
    	chks.push($(this).val());
    });
    //ajax로 전송할 데이터 (page,filter정보) 객체로 선언
    let jsonData ={
    	"pageNo":pageNo,
        "sort":sort,
        "part":chks,
        "level":difficulty
    }
    console.log(jsonData);
    // ajax
    $.ajax({
        url:"/searchRepresentExerciseCount.json",
        type:'get',
        data:jsonData,
        error:function() {
            alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
        },
        success:function (json) {
        	//console.log(json);
        	maxNumberOfItem = json.countResult;
        	$.ajax({
                url:"/searchRepresentExerciseList.json",
                type:'get',
                data:jsonData,
                error:function() {
                    alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
                },
                success:function (json) {
                	//console.log(json);
                	$representExerciseList.append($representExerciseTmpl({reExList : json}));
                	pageNo++;
                	if($('#representExerciseList li').length == maxNumberOfItem){
                		$showMorePage.css("display","none");
                	}
                }
            });//ajax end
        	
        }
    })//ajax end
    
}//getRepresentExerciseList() end

$("input[type=radio]").on("change",function(){
	pageNo=1;
	$representExerciseList.empty();
	$showMorePage.css("display","block");
	getRepresentExerciseList();
	
});
$( "input[type=checkbox]").on("change",function(){
	pageNo=1;
	$representExerciseList.empty();
	$showMorePage.css("display","block");
	getRepresentExerciseList();
});
$showMorePage.on("click",function(){
	getRepresentExerciseList();
});

</script>

</body>
</html>