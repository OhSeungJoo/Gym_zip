<%@page import="com.joa.sht.gym_zip.dao.LectureReviewDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.LectureReview"%>
<%@page import="com.joa.sht.gym_zip.dao.LectureListStdDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.Lecture"%>
<%@page import="com.joa.sht.gym_zip.vo.Member"%>
<%@page import="com.joa.sht.gym_zip.dao.LectureDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.LectureListStd"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//LectureReview lectureReview = LectureReviewDAO.selectLectureReviewExist(loginMember.getNo());
%>
<div class="lecture_box">
    <ul id="lectureUlList">
		<!-- 템플릿 자리 -->
		
    </ul>

<div id="showMorePage">더보기</div>
</div>
<form action="/LectureReviewUpdate.joa" method="get">
<div class="popup">

    <div class="review_container">
        <!--리뷰 체크 박스 형식 컨테이너-->
        <div class="review_check_container">
            <div class="title_text">강의의 장점을 선택해주세요<p>중복 선택 가능 합니다.</p></div>
            <!--    리뷰 체크 박스들-->
            <div class="review_check_box">
           <input type="hidden" name="no" id="lectureNo"/>
           <label class="review_check"><input type="checkbox" name="reviewCheck_1" value="1"><span>강의내용</span></label><!--
        --><label class="review_check"><input type="checkbox" name="reviewCheck_2" value="1"><span>전달력</span></label><!--
        --><label class="review_check"><input type="checkbox" name="reviewCheck_3" value="1"><span>운동효과</span></label><!--
        --><label class="review_check"><input type="checkbox" name="reviewCheck_4" value="1"><span>준비성</span></label><!--
        --><label class="review_check"><input type="checkbox" name="reviewCheck_5" value="1"><span>친절도</span></label>
            </div>
            <!-- end    리뷰 체크 박스들-->


            <!--    버튼들-->
            <div class="button_box">
                <button class="close_btn"><i class="fas fa-times"></i></button>
                <button class="ok_btn">확인</button>
            </div>
            <!--    end 버튼 들-->
        </div>
        </form>
        <!--end 리뷰 체크 박스 형식 컨테이너-->
        <!--리뷰 텍스트 컨테이너-->
        <div class="review_text_container">
            <div class="title_text">강의 내용에 대해서 평가를 해주세요</div>
            <!--    리뷰 텍스트 박스-->
            <div class="review_text_box">
                <div class="write_review">리뷰 작성</div>
                <div><textarea class="review_text" placeholder="내용을 입력해주세요" name="reviewText"></textarea></div>
            </div>
            <!-- end 리뷰 텍스트 박스-->


            <!--    버튼들-->
            <div class="button_box">
                <button class="close_btn"><i class="fas fa-times"></i></button>
                <button class="ok_btn">작성완료</button>
            </div>
            <!--    end 버튼 들-->
        </div>
        <!--end 리뷰 텍스트 컨테이너-->
    </div>

</div>

<script type="text/template" id="dateAndReviewTmpl">
<!-- 기간과 리뷰 -->
    <div class="rest_day" >
        잔여기간
    </div>

    <div class="rest_day rest_data">
        D<span><@=moment(lectureCardList.startDate).diff(moment(lectureCardList.endDate), 'days')+1@></span>
    </div>
    <div class="bottom_btn">
		<@ if(lectureCardList.reviewNo==null) { @>
        <button data-no="lectureCardList.no" class="write_review_btn">리뷰작성</button>
		<@}else if(lectureCardList.reviewNo!=null) {@>
        <button data-no="lectureCardList.no" class="update_review_btn">리뷰수정</button>
		<@}@>
    </div>
<!--end 기간과리뷰-->
</script>


<script type="text/template" id="lectureListTmpl">
	<@ _.each(lectureList, function(lectureCardList){ @>
		<li class="lecture_list lecture">
            <!-- 강의 이미지 -->
            <div class="lecture_img">
                강의 이미지
            </div>
            <!-- end 강의 이미지 -->


            <!-- end 수강 여부-->

            <!-- 강의 이름 -->
            <div class="lecture_name">
               	<@=lectureCardList.title @>
            </div>
            <!-- end 강의 이름-->

            <!-- 강사정보-->
            <div class="coach_inform">
                <div class="coach_name coach">
                	<@=lectureCardList.nickname @>
                </div>
                <div class="coach_tier tier">
                    <@=lectureCardList.tierName@>
                </div>
            </div>
            <!-- end 강사정보-->

            <!-- 칼로리 정보-->
            <div class="kcal_inform">
                <div class="screen_out">
                    예상 소모 칼로리
                </div>
                <div>
                    내 소모 칼로리
                </div>
                <div>
                    400kcal
                </div>
            </div>
            <!-- end 칼로리 정보 -->

            <!--  운동 수 정보-->
            <div class="exercise_num_inform">
                <div>
                    <img src="img/muscles_white.png" width="20">
                </div>
                <div>
                    <@=lectureCardList.viewCount @>
                </div>
                회 수강
            </div>
            <!--end 운동 수 정보 -->

            <!--수강 여부 -->
            <@if(lectureCardList.startDate==null) {@>
            <div class="no_lesson">
                미수강
            <button class="take_lecture_btn" data-no="<@=lectureCardList.no@>">수강하기</button>
            </div>
            <@}else {@>
			
                <!-- 기간과 리뷰 -->
            <div class="date_and_review">
			
                <div class="rest_day" >
                    잔여기간
                </div>

                <div class="rest_day rest_data">
                    D<span><@=moment().diff(moment(lectureCardList.endDate), 'days')@></span>
                </div>
                <div class="bottom_btn">
					<@ if(lectureCardList.reviewNo==null) { @>
                    <button data-no="<@=lectureCardList.no@>" class="write_review_btn">리뷰작성</button>
					<@}else if(lectureCardList.reviewNo!=null) {@>
                    <button data-no="<@=lectureCardList.no@>" class="update_review_btn">리뷰수정</button>
					<@}@>
                </div>
            </div>
            <!--end 기간과리뷰-->
            <@} @>


        </li>
        <!-- end 강의 리스트-->
	

	<@})@>
</script>

<script src="/js/jquery.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script src="/js/underscore-min.js"></script>
<SCRIPT>

const $showMorePage=$("#showMorePage");
//페이지 로드시에  카드 가져오기
getLectureList();
const $lectureUlList = $("#lectureUlList");
let $dateAndReview;

//언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
const $lectureListTmpl = _.template($("#lectureListTmpl").html());
const $dateAndReviewTmpl = _.template($("#dateAndReviewTmpl").html());


function getLectureList() {
	let memberNo = <%= loginMember.getNo()%>
	let pageNo = 1
	let maxNumberOfItem=0;

	//보낼 파라미터 값 
	let jsonData = {
			"pageNo" : pageNo,
			"memberNo" : memberNo
		}
	//ajax 페이징
//	$.ajax({
//		url:"",
//		type:"GET",
//		data:jsonData,
//		error:function(){
//			alert("해당 서비스를 점검중입니다. 나중에 시도해주세요.")
//		},
//		success:function(json){
//			//console.log(json);
//			//maxNumberOfItem = json.count;
//		}
//	})
	//내강의 ajax
	$.ajax({
        url:"/lectureList.json",
        type:'GET',
        data: jsonData,
        error:function() {
            alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
        },
        success:function (json) {
        	console.log(json);
        	$lectureUlList.append($lectureListTmpl({ lectureList : json }));
        	pageNo++;
        	if($('.lecture_list.lecture').length == maxNumberOfItem){
        		$showMorePage.css("display","none");
        	}
        }
    })
    

}
	//버튼클릭시 날짜 보내기
	$(document).on("click", ".take_lecture_btn", function(){
		alert("ㅎㅇ");
		let memberNo = <%= loginMember.getNo()%>
		let no = $(this).data('no');
		let startDate = moment().format('YYYY-MM-DD');
		$temp = $(this).parents('.lecture_list.lecture').children('.no_lesson');
		$dateAndReview = $("<div>").addClass('date_and_review');
		$temp.after($dateAndReview);
		$temp.remove();
		console.log(no);
		console.log(startDate);
		let jsonData = {
				"memberNo" : memberNo,
				"startDate" : startDate,
				"no" : no
			}
		
		$.ajax({
			url:'/addStartDateLecture.json',
			type:'GET',
			data:jsonData,
			error:function(){
				alert("현재 해당기능은 점검중입니다. 나중에 다시시도해주세요.")
			},
			success:function(json){
				console.log(json);
				$dateAndReview.append($dateAndReviewTmpl({ lectureCardList : json }));
				
			}
		})
		
		
	})
	// 리뷰 쓰기 버튼 클릭
	$(document).on("click",'.write_review_btn',function (){
		$("#lectureNo").val(this.dataset.no);
		$(".popup").toggleClass("on");
		console.log("ㅎㅇ");
	})
    // end 리뷰 쓰기 버튼 클릭
	
    //리뷰 수정 버튼
	$(document).on("click",'.update_review_btn',function (){
		const no = $("#lectureNo").val(this.dataset.no);
		$(".popup").toggleClass("on");
        $("html").css("overflow","hidden");
		console.log(no);
	})
	//리뷰 수정 end
	


    // 리뷰 체크 박스 누르고 나서
    $(".review_check_container .ok_btn").on("click",function (e) {
    	e.preventDefault();
        $(".review_text_container").css("display","block");
        $(".button_box i").css("display","block");
        $(html).css("overflow-y","scroll");

    });
    // end 리뷰 체크 박스 누르고 나서


    // 리뷰 확인 버튼
    $(".review_text_container .ok_btn").on("click",function () {
        $(".popup").toggleClass("on");
        $(".review_text_container").css("display","hidden");
        console.log($(".review_check"));
    });


    // 리뷰 x 버튼
    $(".button_box i").on("click",function () {
        $(".popup").toggleClass("on");
    });

</SCRIPT>