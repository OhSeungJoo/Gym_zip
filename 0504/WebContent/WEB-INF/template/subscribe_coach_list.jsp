<%@page import="com.joa.sht.gym_zip.vo.Exercise"%>
<%@page import="com.joa.sht.gym_zip.dao.SubscribeDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.Subscribe"%>
<%@page import="java.util.List"%>
<%@page import="com.joa.sht.gym_zip.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Subscribe> subscribeCoachList = SubscribeDAO.subscribeCoachList(loginMember.getNo());
	
%>

<!--구독한 코치 목록 박스-->
<div id="subscribeCoachBox">
<!--    구독한 코치 목록-->
    <ul>
    	<%for(Subscribe subscribe :	subscribeCoachList) {%>
        <!-- 구독한 코치 목록(코치 한명)-->
        <li id="subCoachList">
            <!-- 구독한 코치 목록 상단 프로필 -->
            <div class="coachProfile">
                <img class="coach_img" src="<%=subscribe.getProfileImg()%>">
                <div class="coach_name"><%=subscribe.getNickname() %></div>
                <button class="sub_cancel_btn" data-no="<%=subscribe.getNo() %>">구독 취소</button>
            </div>
            <!--end 구독한 코치 목록 상단 프로필-->

            <!-- 구독한 코치의 운동 목록 박스 -->
            <div class="exercise_list_box">
                <!-- 이전 버튼 -->
                <div class="side_btn"><button class="prev_btn"><</button></div><!--
                end 이전 버튼
                --><!--
                --><div class="exercise_item_list_box">
                    <!-- 구독한 코치의 운동 목록 -->
                    <ul class="exercise_item_list"><!-- 
                     -->
                     <%
                     
                     List<Exercise> subscribeCoachEx = SubscribeDAO.selectSubscribeEx(subscribe.getCoachNo());
                     
                     for(Exercise exercise : subscribeCoachEx) {%>
                     <!-- 
                         구독한 코치의 운동 목록(한 개)
                       --><li class="exercise_list">
                            <a>
                            <div>
                            	<img class="exercise_img" width="180" height="120" src="<%=exercise.getThumbnail()%>">
                           	</div>
                            <div class="exercise_name"><%=exercise.getName()%></div>
                            </a>
                        </li><!-- 
                     --><%}%><!-- 
                     --></ul>
                <!--end 구독한 코치의 운동 목록 -->
                </div><!--
                --><!-- 다음 버튼
                --><div class="side_btn"><button class="next_btn">&gt;</button></div>
                <!-- end 다음 버튼 -->

            </div>
            <!-- end 구독한 코치의 운동 목록 박스 -->
        </li>
        <!--end 구독한 코치 목록(코치 한 명)-->
        <%} %>
    </ul>
<!--    구독한 코치 목록-->

</div>
<!--end 구독한 코치 목록 박스-->
<!--구독 취소 팝업-->
<div class="popup">

    <div id="subscribeCancelBox">
        <div class="title">구독 취소</div>
        <div class="text">정말 구독을 취소하시겠어요?</div>
        <div class="bottomBtn">
            <button id="yes" >예</button><!--
        --><button id="no">아니오</button>
        </div>
    </div>

</div>
<!--end 구독 취소 팝업-->
<script src="/js/jquery.js"></script>
<script>
	let subscribeNo = 0;
    $(".sub_cancel_btn").on("click",function () {
    	subscribeNo = this.dataset.no;
       $(".popup").toggleClass("on");
    });

    // 구독 취소 -> 예
    $("#subscribeCancelBox #yes").on("click",function () {
        $(".popup").toggleClass("on");
    });

    // 구독취소 -> 아니오
    $("#subscribeCancelBox #no").on("click",function () {
       $(".popup").toggleClass("on");
    });
    
    $("#yes").on("click",function() {
    	location.href = '/deleteSubscribeCoach.joa?no='+subscribeNo;
    	console.log(subscribeNo);
    })
    
</script>
