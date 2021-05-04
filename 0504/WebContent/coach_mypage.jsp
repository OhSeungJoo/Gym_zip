<%@page import="com.joa.sht.gym_zip.vo.Lecture"%>
<%@page import="com.joa.sht.gym_zip.util.PaginateUtil"%>
<%@page import="com.joa.sht.gym_zip.vo.PageVO"%>
<%@page import="com.joa.sht.gym_zip.dao.LectureDAO"%>
<%@page import="com.joa.sht.gym_zip.dao.ExerciseDAO"%>
<%@page import="com.joa.sht.gym_zip.dao.CoachDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.Coach"%>
<%@page import="java.util.List"%>
<%@page import="com.joa.sht.gym_zip.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String coachNoStr = request.getParameter("no");
    int coachNo = Integer.parseInt(coachNoStr);
    
    
    //0206 박해원 
    //강의목록 페이징
       
   String pageStr = 
         request.getParameter("page");
   
   int pageNo = 1;
   int numPage = 5;
   
   try {
      pageNo = 
         Integer.parseInt(pageStr);
   }catch(Exception e) {
      
   }
   
   PageVO pageVO = 
         new PageVO(pageNo,numPage,coachNo);
   
   //코치가 올린 운동목록을 페이징하기위한 select 
  	List<Lecture> lectureList = LectureDAO.selectCoachLecturePagingList(pageVO);
   
  //코치가 올린 운동목록을 페이징하기위한 select count
   int total = 
		   LectureDAO.selectCoachLectureListCount(coachNo);
   
   String paginate = 
         PaginateUtil.getPaginate(pageNo, total, numPage, 3, "/coach_mypage.jsp","no="+coachNo+"&page=");
   
  
   //코칭 가능한 요일 coaching on
   List<Coach> caList= CoachDAO.selectCoachingAvailable(coachNo);
   
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>coach_mypage</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/notosanskr.css">
    <link rel="stylesheet" href="css/coach_lecture_exercies_null.css">
    <link rel="icon" href="img/logo_coral.ico">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/diary.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
    <link rel="stylesheet" href="/css/coachExerciseList.css">
    <link rel="stylesheet" href="/css/lecture_list_coach.css">
    <link rel="stylesheet" href="/css/review_coach.css">
    <link rel="stylesheet" href="css/Chart.css"/>
    <link rel="stylesheet" href="css/prize.css"/>
    <style>

       

        #container{
            width:1100px;
            position:relative;
            left:50%;
            margin-left: -550px;


        }
        /*end #container*/

        /*코치 상단*/
        #coachHeader{
            height:200px;
            width:1100px;


           background-color: #ECEFF1;

            position: relative;
        }
        /*end #coachHeader*/

        /*코치 상단 */
        #coachHeader>div{

            position: absolute;
        }
        /*end #coachHeader div */


        /*코치 프로필*/
        #coachProfileBox{
            width:370px;
            height:60px;
            top:30px;
            left:40px;

        }
        /*end #coachProfileBox*/

        /*코치 이름, 티어*/
        .name, .tier{
            display: inline-block;
            /*position:absolute;*/


        }
        /*end .name, .tier*/


        /*코치 이름*/
         .name{
            width:240px;
            height:60px;
            left:60px;
            font-size: 25px;
            font-weight: 500;
            line-height: 65px;
            text-align: center;

        }
        /*end .name*/


        /*코치 티어*/
         .tier{
            width:60px;
            height:60px;
            /*right:0px;*/
            line-height: 70px;
            color: rgb(163, 206, 235);

        }
        /*end .tier*/

        /*코치 이미지*/
        #coachProfileBox .coach_img{
            border-radius: 100%;
            top:40px;
        }
        /*end .coach_img*/

        /*구독하기*/
       #container .subscribe{
            width:80px;
            height:30px;
            top:80px;
            left:440px;
            text-align: center;
            line-height: 30px;
            background-color: #283593;
            color:#fff;

        }
        /*end .subscribe*/

        /*평균 평점*/
        .avg_score_box{
            width:150px;
            height:50px;
            top:60px;
            left:540px;

        }
        /*end .avg_score*/

        /*평균 평점(별과 평점)*/
        .avg_score_box>div{
            display: inline-block;
            position: absolute;
        }
        /*end .avg_score_box>div*/


        /*평균 평점 별*/
        .avg_score_box #avgStar{
            color:#FFEB3B;
            font-size: 40px;
            line-height: 50px;
            width:50px;
        }
        /*end .avg_score_box #avgStar*/

        /*평균 평점 점수*/
        .avg_score_box #avgScore{
            font-weight: 400;
            width:100px;
            height:50px;
            right: 0px;
            line-height: 50px;

        }
        /*end .avg_score_box #avgScore*/

        /*sns 리스트*/
        #snsListBox{
            width:350px;
            height:160px;
            top:20px;
            right:20px;

        }
        /*end #snsListBox*/

        /*sns 추가하기 버튼*/
        #snsListBox #plusSNSBtn{

            font-family: "Noto Sans KR",sans-serif;
            border: 1px solid #424242;
            /*border-bottom: 3px solid #424242;*/
            width:100%;
            height:30px;
            background-color: transparent;
        }
        /*end #snsListBox #plusSNSBtn*/

        /*sns 추가하는 팝업*/
        #snsListBox #addSNSArea{
            position:absolute;
            top:30px;
            width:350px;
            height:130px;
            background-color: #fff;
            display: none;
        }
        /*end sns 추가하는 팝업*/

        /*sns 추가 취소 등록 버튼*/
        #addSNSArea button{
            position:absolute;
            border:none;
            right:0px;
        }
        #addSNSArea .cancel_btn{
            top:0px;
            background-color: #fff;
            color: #F91B4E;
        }
        #addSNSArea .upload_btn{
            bottom:0px;
            background-color: #F91B4E;
            color: #fff;
            font-family: "Noto Sans KR", sans-serif;
            width:60px;
            height:20px;

        }
        /*end sns 추가 취소 등록 버튼*/

        /*sns종류들*/
        #snsListBox #snsTypeBox{
            height:40px;
            margin-top:20px;
            padding-left: 30px;
            padding-right: 20px;

        }
        #snsListBox .sns_type_li{
            display: inline-block;

        }
        /*end sns 종류들*/

        /*라디오 인풋 숨기기*/
        #snsListBox .sns_type_li input{
            display: none;
        }
        /*end 라디오 인풋 숨기기*/


        /*sns 선택 라디오 스타일*/
        #snsListBox .sns_type_li span{
            display: inline-block;
            width:38px;
            height:38px;
            border: 1px solid #fff;
            background-color: #fff;
            margin-right: 10px;
        }
        /* end sns 선택 라디오 스타일  */

        /*sns 선택 이미지들*/
        #snsListBox .sns_type_li .sns_img{
            width:38px;
            height:38px;
        }
        /*end sns 선택 이미지들*/


        /*sns 선택 되었을 경우*/
        #snsListBox .sns_type_li input:checked+span{
            color: #f91b4e;
            border: 1px solid #f91b4e;
        }
        /*sns 선택 되었을 경우*/

        /*sns 링크 입력 부분*/
        #snsInputBox{
            width:300px;
            height:40px;

            margin:20px auto;

        }
        /* end sns 링크 입력 부분*/

        /*sns 링크 입력 input*/
        #snsInputBox #inputSnsLink{
            width:200px;
            border: none;
            border-bottom: 2px solid #F91B4E;
            font-family: "Noto Sans KR", sans-serif;
            margin-left: 10px;
        }
        /* end sns 링크 입력  input  */

        /*강사 홍보 문구 */
        #adText{
            width:330px;
            height:30px;
            left:80px;
            bottom:40px;
            color: #757575;

        }
        /*end adText*/

        /*강사 홍보 문구 입력창과 텍스트*/
        #adText>div{
            position: absolute;
        }
        /*end 강사 홍보 문구 입력창과 텍스트*/

        /*강사 홍보 문구 입력창*/
        #adText #inputAdText{
            width:330px;
            height:30px;
            border: none;
            background-color: #ECEFF1;
            border-bottom: 3px solid #F91B4E;
            font-family: "Noto Sans KR", sans-serif;
        }
        /*end 강사 홍보 문구 입력창*/

        /*입력된 홍보 문구*/
        #adText #savedAdText{
            line-height: 30px;
        }
        /*end 입력된 홍보 문구*/

        /*홍보 문구 텍스트와 인풋 토글*/
        #adText .ad{
            display: none;
        }

        #adText .ad.ad_on{
            display: block;
        }
        /*end 홍보 문구 텍스트와 인풋 토글 */

        /*코치 사진*/
        #coachPhoto{
            height:250px;
            width:1000px;
            margin: 25px auto;
            position:relative;
        }
        /*end coachPhoto*/

        /*코치 사진 목록*/
        #coachPhoto ul li{
            width:248px;
            height:248px;
            display: inline-block;
            text-align: center;
            border: 1px solid #424242;
            line-height: 250px;

        }
        /*end #coachPhoto ul li */

        /*코치 사진들*/
        #coachPhoto ul li img{
            width:248px;
            height:248px;
        }
        /*end 코치 사진들 */

        /*코치 사진*/
        #coachPhoto ul{
            position: absolute;
        }
        /*end #coachPhoto ul*/

        /*코치 사진 수정하기, 더보기*/
        .coach_photo_btn{
            position: absolute;
            font-family: "Noto Sans KR",sans-serif;
            border: none;
            color:#fff;
        }
        /*end .coach_photo_btn*/

        /*코치 사진 수정하기*/
        #photoUpdate{
            right:0px;
            background-color: #000;

        }
        /*end #photoUpdate*/

        /*코치 사진 더보기*/
        #viewMore{
            right:0px;
            bottom: 0px;
            background-color: #f91b4e;
        }
        /*end #viewMore*/


        /*코치 상세정보들*/
        #coachDetail{
            height:250px;
            width:1100px;


            position: relative;
        }
        /*end coachDetail*/


        /*코치 상세 정보에 관한 세부 사항들*/
        #coachDetail>div{

            position:absolute;
        }
        /*end #coachDetail>div*/

        /*코치 운동 정보*/
        #coachExercise{
            width:498px;
            height:180px;
            top:25px;
            left:65px;
            border: 1px solid #f91b4e;
        }
        /*end #coachExercise*/

        /*코치 운동 정보 내 div*/
        #coachExercise>div{
            float: left;
            position: absolute;
        }
        /*end #coachExercise>div*/

        /*코치 운동 정보->성별 box*/
        #genderBox{
            margin:10px;
        }


        /*코치 운동 정보 -> 성별*/
        #genderBox>div{
            display: inline-block;
        }
        /*end #genderBox>div*/


        /*성별 남, 여*/
        #genderBox .gender{
            display: none;
            width:20px;
            height:20px;
            line-height: 20px;
            text-align: center;
            color: #fff;
        }
        /*end #genderBox .gender.coachGender*/

        /*코치의 성별*/
        #genderBox .gender.coachGender{
            display: inline-block;
        }
        /*end #genderBox .gender.coachGender*/

        /*코치 성별 남자*/
        #genderBox .gender.male{
            background-color: #283593;

        }
        /*end #genderBox .gender.male*/

        /*코치 성별 여자*/
        #genderBox .gender.female{
            background-color: #f91b4e;
        }
        /*end #genderBox .gender.female*/

        /*코치 최대 무게와 시간*/
        #maxWeightBox,#maxExercise{
            top:40px;
            width:200px;
            height:120px;
        }
        /*end #maxWeightBox.#maxExercise*/

        /*코치 운동 정보 -> 최대 무게*/
        #maxWeightBox{
            left:20px;
        }
        /*end #maxWeightBox*/

       /*최대 무게수*/
       .max_weight{
           position: absolute;
       }
        /*end .max_weight*/

        /*최대 무게수 text*/
        .max_weight.text{
            top:90px;
            left:5px;

        }
        /*end .max_weight.text*/

        /*최대 무게수 data*/
        .max_weight.data, .max_exercise.data{
            top:40px;
            left:110px;
            font-weight: 400;
            font-size: 25px;
            color: #f91b4e;
        }
        /*end .max_weight.data*/

        /*최대 운동 시간*/
        #maxExercise{
            left:230px;
            background-color: transparent;
        }
        /*end #maxExercise*/

        /*최대 운동 */
        .max_exercise{
            position: absolute;
        }
        /*end .max_exercises*/

        /*최대 운동 text*/
        .max_exercise.text{
            top:90px;
        }
        /*end .max_exercise.text*/

        /*코치 신체 정보 더보기*/
        #coachExercise #exerciseDetail{

            text-align: center;
            top:180px;
            left:-1px;
            width:500px;
            height:20px;

            background-color: #f91b4e;
            color: #fff;
        }
        /*end #coachExercise #exerciseDetail*/


        /*코치 신체 상세 펼치기*/
        #exerciseDetail #coachTmi{
            width:498px;
            height:150px;
            background-color: #fff;
            position:absolute;
            top:-20px;
            border: 1px solid #F91B4E;
            display: none;
        }
        /*end 코치 신체 상세 펼치기*/

        /*코치 신체 상세 접기*/
        #exerciseDetail #coachTmi .popup_up{
            width:498px;
            height:20px;
            background-color: #F91B4E;
            position: absolute;
            bottom:0px;
        }
        /*end 코치 신체 상세 접기*/

        /*코치 신체 정보들 (문자 자료 막대그래프)*/
        #coachPhysical>dl .coach_physical_items{
            display: inline-block;
        }
        /*코치 신체 정보들 (문자 자료 막대그래프)*/

        /*코치 신체 정보들 dl*/
        #coachPhysical>dl{
            width:480px;
            height:30px;
            margin:10px;

            position: relative;
        }
        /*end 코치 신체 정보들 dl*/

        /*코치 신체 정보들 내부 요소들*/
        #coachPhysical>dl>.coach_physical_items{
            position: absolute;
            color: #000;
        }
        /*end 코치 신체 정보들 내부 요소들*/

        /*코치 신체 정보들 dt*/
        #coachPhysical>dl>dt.coach_physical_items{
            left:0px;
        }
        /*end 코치 신체 정보들 dt*/

        /*코치 신체 정보들(수치)*/
        #coachPhysical>dl>dd.data{
            right:320px;
        }
        /*end 코치 신체 정보들(수치)*/

        /*코치 신체 정보들(그래프)*/
        #coachPhysical>dl>dd.graph{
            left:180px;
            width:298px;
            height:25px;
            border: 1px solid #F91B4E;
        }
        /*end 코치 신체 정보들(그래프)*/

        /*그래프 채우는 것들*/
        #coachPhysical>dl>dd.graph .data_graph{
            height:25px;
            position: absolute;
            background-color: #F91B4E;
        }

        #bmi .data_graph{
            width:15px;
        }
        /*end 그래프 채우는 것들*/


        /*수업 가능요일*/
        .coaching_box{

            width:450px;
            height:50px;
            right:65px;
            top:10px;

        }
        /*end .coaching_box*/



        /*수업 가능 요일 -> 내부 div*/
        .coaching_box .coaching{
            display: inline-block;
        }
        /*end .coaching_box .coaching*/


        /*수업 가능요일, 월화수목금토일*/
        .coaching_box>.coaching{
            position: absolute;
        }
        /*end .coaching_box>.coaching*/

        /*수업 가능 요일*/
        .coaching_box>.coaching.title{
            top:11px;
            left:60px;
        }
        /*end .coaching_box>.coaching.title*/

        /*월화수목금토일 div*/
        .coaching_box .day_list {
            top: 10px;
            left: 170px;
        }
        /*end .coaching_box .day_list*/

        /*요일 li*/
        .coaching_box .day_list li{
            margin-right:2px;
            padding:2px;
            border:1px solid #f91b4e;
            color: #f91b4e;
        }
        /*end .coaching_box .day_list li*/

        /* 수업가능 요일 일때*/
        .coaching_box .day_list li.coaching_on{
            color: #fff;
            background-color: #f91b4e;
        }
        /*end .coaching_box .day_list li.on*/

        /*수업 가능 요일 -> 수정하기*/
        .coaching_box .coaching.update{
            right:20px;
            top:10px;

        }
        /*end 수업가능 요일 -> 수정하기*/

        /*수업가능 요일 -> 수정하기 버튼*/
        .coaching_box .coaching .update_btn{
            color: #e0e0e0;
            border: 1px solid #e0e0e0;
            background-color: #fff;
            border-radius: 50px;
        }
        /*end 수업가능 요일 -> 수정하기 버튼*/


        /*코칭 가격설정 박스*/
        .coaching_cost_box{
            right:65px;
            width:450px;
            height:30px;
            /*background-color: #F91B4E;*/
            top:70px;
        }
        /*end 코칭 가격 설정박스*/

        /*코칭 가격설정 텍스트*/
        .coaching_cost_box span{
            position:absolute;
            left:65px;
        }
        /*end 코칭 가격설정 텍스트*/
 	 /*코칭 가격 설정 폼*/
        .coaching_cost_box div{
            position:absolute;
            left:170px;
        }
        /*end 코칭 가격 설정 폼*/

        /*코칭 가격설정 인풋*/
        .coaching_cost_box input{
            border:none;
            border-bottom: 2px solid #F91B4E;
            font_size:22px;
            
        }

       /* end 코칭 가격 설정 인풋*/

       /*수강생 분포도*/
        .student_data{
            width:450px;
            height:150px;
            right:65px;
            bottom:-20px;
        }
        /*end .student_data*/

        /*수강생 분포도 -> 남자 여자 아이콘*/
        .student_data .icon i{
            font-size: 40px;
            font-weight: 600;

        }

        .student_data #girlData .icon{
            color: #F91B4E;
        }

        .student_data #boyData .icon{
            color: #283593;
        }
        /*end 수강생 분포도 -> 남자 여자 아이콘*/

        /*수강생 분포도 (이름, 막대바, 남자 정보, 여자정보)*/
        .student_data>div{
            position:absolute;
        }
        /*end .student_data>div*/

        /*수강생 분포도*/
        .student_data #studentTitle{
            top:10px;
            left:175px;
            text-align: center;
            width:100px;
            height:20px;
        }
        /*end .student_data #studentTitle*/


        /*여자정보, 남자정보(공통)*/
        .student_data #boyData,.student_data #girlData{
            width:70px;
            height:100px;
            top:30px;
        }
        /*end .student_data #boyData,.student_data #girlData*/


        /*남자 정보*/
        .student_data #boyData{
            left:5px;
        }
        /*end .student_data #boyData*/

        /*남녀 수강생 정보의 li들*/
        #boyData .boy, #girlData .girl{
            text-align: center;
        }
        /* end  #boyData .boy, #girlData .girl*/

        /*수강생의 칼로리*/
        .student_data .kcal{
            color: #f91b4e;
            font-size: 18px;
            font-weight: 400;
        }
        /* end  .student_data .kcal */

        /*여자 정보*/
        .student_data #girlData{
            right: 5px;
        }
        /*end .student_data #girlData*/

        /*수강생 성비 비율 막대 그래프(전체)*/
        .student_data #ratioBar{
            width: 280px;
            height:40px;
            top:45px;
            left:85px;

        }
        /*end .student_data #ratioBar*/

        /*수강생 막대 그래프 남자*/
        .student_data #ratioBar #boyRatioBar{
            float: left;
            height: 40px;
            width:75%;
            background-color: #283593;
        }

        /*수강생 막대 그래프 여자*/
        .student_data #ratioBar #girlRatioBar{
            float: right;
            height:40px;
            width:25%;
            background-color: #f91b4e;
        }
        /*코치 마이페이지 탭*/
        #coachTab{
            width:800px;
            height:50px;
            margin:25px auto;

        }
        /*end #coachTab*/

        /*코치 탭*/
        #coachTab ul li{
            display: inline-block;
            width:160px;
            text-align: center;
            line-height: 50px;
            border-bottom: 5px solid #424242;
        }
        /*end #coachTab ul li*/

        /*코치탭 호버시*/
        #coachTab ul li:hover{
            color:#f91b4e;
            border-bottom: 5px solid #f91b4e;
        }
        /*end #coachTab ul li:hover end*/

        /*선택된 탭*/
        #coachTab .coach_tap .tap_on{
            color:#f91b4e;
            border-bottom: 5px solid #f91b4e;
        }
        /*end #coachTab .coach_tap .on   */


        /* 팝업 창 */
        .pop_up{
            width: 100%;
            height:100%;
            position: fixed;
            top:0px;
            left:0px;
            background-color: rgba(0,0,0,0.7);
            display: none;
        }
        /* end 팝업창 */

        .pop_up.pop_bg_on{
            display: block;
        }

/*========================================================================================================================*/
    /*    구독하기 팝업*/
        /*구독 팝업 창*/
        .subscribe_pop_up{
            width:800px;
            height:600px;
            border: 1px solid #f91b4e;
            position:fixed;
            margin:-301px 0 0 -401px;
            top:50%;
            left:50%;
            background-color: #fff;
            display: none;
        }
        /*    end 구독 팝업 창*/

        .subscribe_pop_up.pop_up_on{
            display: block;
        }

        /*    구독*/
        .subscribe_pop_up .subscribe_title{
            width:800px;
            height:60px;
            line-height: 60px;
            font-size: 30px;
            color: #f91b4e;
            font-weight: 600;
            text-align: center;
        }
        /*    end 구독*/


        /*    구독 안내 문구*/
        .subscribe_pop_up .subscribe_text{
            width:760px;
            height:160px;
            margin-top:50px;
            padding:20px;
            text-align: center;
        }
        /*    end 구독 안내 문구*/


        /*    코치 이름 및 문구*/
        .subtext.first>div{
            display: inline-block;
        }
        /*    end 코치 이름 및 문구*/

        /*    문구첫째 줄*/
        .subscribe_pop_up .subtext.first{
            margin-top: 30px;
        }
        /*    end 문구첫째 줄*/

        /*    코치이름*/
        .subtext.first .coach_name{
            font-size: 30px;
            font-weight: 600;
        }
        /*    end 코치이름*/

        /*    코치 이름 옆 문구*/
        .subtext.first .text{
            font-size:25px;
            font-weight: 500;
        }
        /*    end 코치 이름 옆 문구*/

        /*    두번째 안내 문구*/
        .subtext.second{
            margin-top:20px;
            font-size: 25px;
            font-weight: 400;
        }
        /*    end 두번째 안내 문구*/

        /*    에너지 표기 box*/
        .subscribe_pop_up .energy_inform_box{
            height:200px;

        }
        /*    end 에너지 표기 box*/

        /*    하단 버튼 div (취소, 구독하기)*/
        .bottom_btn{
            height:60px;

            position:absolute;
            bottom:0px;
        }
        /*    end 하단 버튼 div(취소, 구독하기*/


        /*    취소 버튼과 구독하기 버튼*/
        .bottom_btn>button{
            font-family: "Noto Sans KR", sans-serif;
            font-weight: 500;
            font-size: 18px;
            width:400px;
        }
        /*    end  취소 버튼과 구독하기 버튼*/

        /*    취소 버튼*/
        .bottom_btn .cancel_btn{

            height:59px;
            border: none;
            background-color: #fff;
            color:#f91b4e;
            border-top: 1px solid #f91b4e;
        }
        /*    end 취소 버튼*/

        /*    구독하기 버튼*/
        .bottom_btn .ok_btn{
            border: none;
            background-color: #f91b4e;
            height:60px;
            color: #fff;
        }
        /*    end 구독하기 버튼*/

        /*    에너지 표기 내부 div*/
        .energy_inform_box>div{
            width:250px;
            height:200px;
            margin:0 5px;
            background-color: #fff;
            display: inline-block;
        }
        /*    end 에너지 표기 내부 div*/



        /*!*  현재 에너지, 구독에너지, 결제시 잔여 에너지*!*/
        .energy_inform_box .energy .energy_title{
            color: #f91b4e;
            height:40px;
            font-size: 18px;
            line-height: 40px;
            text-align: center;
        }
        /*!*    end 현재 에너지, 구독 에너지, 결제시 잔여 에너지*!*/

        /*    에너지 이미지와 수 담은 div*/
        .energy_inform_box .energy_img_num{
            width:230px;
            height:120px;
            margin:20px 10px;


        }
        /*    end 에너지 이미지와 수 담은 div*/


        /*    에너지 이미지와 수*/
        .energy_inform_box .energy_img_num>div{
            float: left;
        }
        /*    end 에너지 이미지와 수*/

        /*    에너지 이미지*/
        .energy_inform_box .energy_img{
            width:100px;
            height:100px;
            background-image: url("img/energy_large.png");
        }
        /*    end 에너지 이미지*/

        /*    에너지 수*/
        .energy_inform_box .energy_num{

            width:110px;
            margin-left:20px;
            height:100px;
            color: #f91b4e;
            font-size: 30px;
            line-height: 100px;
            text-align: center;
        }
        /*    end 에너지 수*/


    /* end 구독하기 팝업*/

    /*    사진 더보기*/
        .white_pop_up{
            width:100%;
            height:100%;
            overflow: auto;
            position: fixed;
            background-color: #fff;
            display: none;
             z-index:9999;
        }
        .white_pop_up.pop_up_on{
            display: block;
        }

        #photoBox{
            width:800px;
            background-color: #f91b4e;
            margin: 100px auto;
        }

        #photoBox .photo_list{
            float: left;
            width:390px;
            height:390px;
            padding: 5px;

        }

        #photoBox .photo_list .photo{
            width:390px;
            height:390px;
        }

        .white_pop_up .close_btn{
            position: fixed;
            top:100px;
            left:60%;
            width:40px;
            height:40px;
            margin-left: 400px;
            background-color: #fff;
            color: #757575;
            border: none;
            z-index:9999;
            font-size: 25px;
            cursor: potinter;

        }

        /*    end 사진 더보기*/

    /*    시간 선택 팝업*/

        /*    시간 선택 창*/
        #timeChoiceContainer.time_choice{
            width:600px;
            height:600px;
            border: 1px solid #F91B4E;
            position:fixed;
            top:50%;
            left:50%;
            margin : -301px 0 0 -301px;
            display: none;
            background-color: #fff;
        }
        /*    end 시간 선택 창*/

        #timeChoiceContainer.time_choice.pop_up_on{
            display: block;
        }

        /*    요일들*/
       #timeChoiceContainer .days{
            height:60px;

            margin-top: 20px;
        }
        /*    end 요일들*/

        /*    시간들*/
        #timeChoiceContainer .times{
            height:450px;

            margin-top:20px;
        }
        /*    end 시간들*/

        /*요일들 ul*/
        #timeChoiceContainer .days>ul{
            width:400px;
            height:40px;
            margin:auto;

        }
        /*end 요일들 ul*/

        /*일월화수목금토*/
        #timeChoiceContainer .days>ul>li{
            display: inline-block;
            width:38px;
            height:38px;
            border: 1px solid #F91B4E;
            margin-right: 15px;
            font-size: 18px;
            font-weight:500;
            line-height: 40px;
            text-align: center;
            background-color: #fff;
        }
        /*end 일월화수목금토*/
        /*일요일*/
        #timeChoiceContainer  .days>ul>li.sunday{
            margin-left:15px;
        }
        /*end 일요일*/

        /*선택된 요일*/
        #timeChoiceContainer  .days>ul>li.day_on{
            background-color: #F91B4E;
            color: #fff;
        }
        /*end 선택된 요일*/


        /*시간들*/
        #timeChoiceContainer .times>ul{
            width:450px;
            height:450px;

            margin:auto;
        }
        /*end 시간들*/

        /*시간들 li*/
        #timeChoiceContainer .times>ul>li{

            width:450px;
            height:450px;
            display: none;
            position:absolute;

        }
        /*end 시간들*/

        /*선택된 요일의 시간들*/
        #timeChoiceContainer .times ul .days.time_on{
            display: block;
        }
        /*end 선택된 요일의 시간들*/

        /*    확인 버튼, 닫기 버튼*/
        #timeChoiceContainer  .button_box button{
            border: none;

            position:absolute;
        }
        /*    end 확인 버튼, 닫기 버튼*/

        /*    확인 버튼*/
        #timeChoiceContainer  .ok_btn{
            width:100px;
            height:40px;
            right:0px;
            bottom:0px;
            font-family:"Noto Sans KR", sans-serif;
            font-size: 20px;
            font-weight: 500;
            color: #fff;
            background-color: #f91b4e;

        }
        /*    end 확인버튼*/

        /*    취소 버튼*/
        #timeChoiceContainer .close_btn{
            width:30px;
            height:30px;
            right:0px;
            top:0px;
            font-size: 20px;

            color: #F91B4E;
            background-color: #fff;
        }
        /*    end 취소 버튼*/


        /*=============================================시간들*/

        #timeChoiceContainer .time_area{
            width: 250px;
            height:400px;
            margin:40px auto;
            padding-left:5px;
        }

        /*    시간 한개 li*/
        #timeChoiceContainer .time_area>ul>li{
            width:50px;
            height:25px;
            display: inline-block;
            margin:5px;
        }
        /*    end 시간 한개 li*/

        /*    시간 체크 박스 숨기기*/
        #timeChoiceContainer  .time_area input[type=checkbox]{
            display: none;
        }
        /*   end 시간 체크 박스 숨기기 */

        /*    시간 문구(체크 전)*/
        #timeChoiceContainer .time_area span{
            width:50px;
            height:25px;
            border: 1px solid #e0e0e0;
            color: #e0e0e0;
            margin:5px;
        }
        /*    end 시간 문구 (체크 전)*/

        /*    시간 문구(체크 후)*/
        #timeChoiceContainer .time_area input:checked+span{
            border: 1px solid #F91B4E;
            color: #000;
        }
        /*    end 시간 문구(체크 후)*/

        /*    오전 오후*/
        #timeChoiceContainer .time_area>ul>div{
            margin-top:20px;
            margin-bottom: 10px;
            font-size: 20px;
            font-weight: 500;
        }
        /*    end 오전 오후*/


        /*end 시간들 =========================================*/

        /*    코칭 시간대 안내문구*/
        #timeChoiceContainer  .sub_text{
            margin:auto;
            font-size: 12px;
            font-weight: 400;
            color: #F91B4E;

            text-align: center;
        }
        /*    end 코칭 시간대 안내 문구*/

        /*    end 시간 선택 팝업*/


    /*    텝 아래 내용들*/
        #tabContent{

            margin-top:80px;
            /*height:500px;*/
            margin-bottom: 300px;
        }

        #tabContent ul li{
            position: relative;
            display: none;
           margin:auto;

            /*background-color: #F91B4E;*/
            width:800px;
        }

        #tabContent ul li.tab_content_on{
            display: block;
        }

	  #coachExerciseTab{
       		width:800px;
       		overflow: hidden;
       		       
       }
        #tabContent ul li.tab_content_on #coachExerciseTab li{
       		display: block;
       }
       
         #coachLectureTab{
       		width:800px;
       		overflow: hidden;
       		       
       }
        #tabContent ul li.tab_content_on #coachLectureTab li{
       		display: block;
       }
   
    </style>
</head>
<body >

<%@ include file="/WEB-INF/template/exRegister.jsp" %>

<div id="wrap">



<%@ include file="/WEB-INF/template/header.jsp" %>
<%

	System.out.println("loginMember:"+loginMember);

	//코치의 기본정보 select
	List<Coach> coachList= CoachDAO.selectCoachMyPage(coachNo);

	//코치가 올린 운동목록을 페이징 하기 위한 select count
	int result =ExerciseDAO.selectCoachExListCount(coachNo);
	
	
	//코치의 최대,최고 운동기록
	List<ExRecord> exRecordList = CoachDAO.selectBestExrecord(coachNo);	
	//코치의 최신 운동기록
	List<ExRecord> lastRecordList = CoachDAO.selectLastExrecord(coachNo);
	//코치의 사진
	List<Coach> adImageList = CoachDAO.selectCoachImage(coachNo);

%>


<!-- 강사 마이페이지 상단의 전체를 감싸는 container-->
<div id="container">


<%for(Coach coach : coachList){ %>
    <!--코치 상단-->
    <div id="coachHeader">

        <form method="post" action="" type="mul">
        <!--코치 프로필-->
        <div id="coachProfileBox">
            <img class="profile coach_img" src="/img/coach/<%=coach.getCoachImage()%>" width="60px" height="60px">
            <div class="profile name"><%=coach.getNickname() %></div>
            <div class="profile tier"><%=coach.getTier() %></div>
        </div>
        </form>
        <!--end coach profile-->

        <!--구독하기-->
        <div class="subscribe">
            구독하기
        </div>
        <!--end subscribe -->

        <!--홍보문구-->
        <div id="adText">
            <div><input class="ad ad_on"  maxlength="25" id="inputAdText" type="text" name="adText" placeholder="홍보 문구를 입력후 엔터"></div>
            <div class="ad" id="savedAdText">고급 헬스를 당신에게 주입식으로 바로바로 쓱쓱</div>
        </div>
        <!--end adText-->

        <!--평균평점-->
          
        <!--  <div class="avg_score_box"> <!-- 
            <!--별 모양 -->
             <!-- <div id="avgStar">
            <i class="fas fa-star"></i>
            </div>
            <!--평점-->
            <!--  <div id="avgScore">
                4.8(1000)
            </div>
        </div>
      	-->
        <!--end avg_score-->

        <!--sns 리스트-->
        <div id="snsListBox">
       
         <%if(coachNo == loginMember.getNo()){ %>
            <button id="plusSNSBtn">SNS 등록하기</button>
        <%}%>
            <ul id="snsList">

            </ul>
            <!-- sns 추가 팝업 -->
            <div id="addSNSArea">
                <!--창 닫기와 등록 버튼-->
                <button class="cancel_btn"><i class="fas fa-times"></i></button>
                <button class="upload_btn">등록</button>
                <!--end 창 닫기와 등록 버튼-->

                <!--sns 종류들-->
                <ul id="snsTypeBox">
                    <li class="sns_type_li" id="insta">
                        <label><input type="radio" name="snsType" class="sns_type" value="insta">
                            <span><img src="img/insta.PNG"class="sns_img"></span></label></li><!--
                    --><li class="sns_type_li" id="facebook">
                    <label><input type="radio" name="snsType" class="sns_type" value="facebook">
                        <span><img src="img/facebook.PNG"class="sns_img"></span></label></li><!--
                    --><li class="sns_type_li" id="youtube">
                    <label><input type="radio" name="snsType" class="sns_type" value="youtube">
                        <span><img src="img/youtube.PNG"class="sns_img"></span></label></li><!--
                    --><li class="sns_type_li" id="blog">
                    <label><input type="radio" name="snsType" class="sns_type" value="blog">
                        <span><img src="img/blog.PNG"class="sns_img"></span></label></li><!--
                    --><li class="sns_type_li" id="kakao">
                    <label><input type="radio" name="snsType" class="sns_type" value="kakao">
                        <span><img src="img/kakao.PNG"class="sns_img"></span></label></li><!--
                    --><li class="sns_type_li" id="twitter">
                    <label><input type="radio" name="snsType" class="sns_type" value="twitter">
                        <span><img src="img/twitter.PNG"class="sns_img"></span></label></li>
                </ul>
                <!--end sns 종류들-->

                <!--입력하는 곳-->
                <div id="snsInputBox">
                    <img class="sns_img" src="/img/default_sns.png" width="30" height="30">
                    <input id="inputSnsLink" name="snsLink" type="text" placeholder="링크를 입력해주세요.">
                </div>
                <!--end 입력하는 곳-->

            </div>
            <!--end sns 추가 팝업-->
        </div>
        <!--end snsList-->

    </div>
    <!--end coachHeader-->
     <%} %>

    <!--코치 사진(4장)-->
    <div id="coachPhoto">

        <ul>
        	<%for(Coach adImage:adImageList) {%>
            <li><img src="/img/coach/<%=adImage.getCoachAdImage()%>"></li><!--
            --><%} %>
            <!--  
            <li><img src="img/coach_ex1.PNG"></li>
            <li><img src="img/lecture_ex1.JPG"></li>
            <li><img src="img/lecture_ex2.JPG"></li>
            -->
        </ul>
         <%if(coachNo == loginMember.getNo()){ %>
        <button id="photoUpdate" class="coach_photo_btn">수정하기</button>
        <%} %>
        <button id="viewMore" class="coach_photo_btn">더보기</button>

    </div>
    <!-- end coachPhoto-->

    <!--코치 상세-->
    <div id="coachDetail">

        <!--코치 운동 정보-->
        <div id="coachExercise">
            <!--성별정보-->
            <div id="genderBox">
                <div>성별</div>
                  <%for(Coach coach:coachList){ %>
                   <%if((coach.getGender()).equals("M")){ %>
                <div class="gender coachGender male" >남</div>
                	<%}else{ %>	
                <div class="gender female" >여</div>
                 <%} %>
                <%} %>
            </div>
            <!--end genderBox-->

            <!--최대무게-->
            <%for(ExRecord exRecord:exRecordList){ %>
            <div id="maxWeightBox">
                <img class="max_weight" src="img/coach_weight.png" width="90" height="90">
                <div class="max_weight text">최대 무게 수</div>
                <div class="max_weight data"><%=exRecord.getTotalWeight() %>kg</div>
            </div>
            <!--end maxWeightBox-->


            <!--최대 운동 시간-->
            <div id="maxExercise">
                <img class="max_exercise" src="img/coach_exercise.png" width="90" height="90">
                <div class="max_exercise text">최대 운동 시간</div>
                <div class="max_exercise data"><%=exRecord.getSumSecond() %></div>
            </div>
            <!--end maxExercise-->
              <%} %>

            <!--코치 신체 정보 펼치기-->
            <div id="exerciseDetail">
                <i class="fas fa-angle-down"></i>
                <!--신체 정보 펼친 창-->
                <div id="coachTmi">
                    <!-- 코치 신체 내역-->
                    <div id="coachPhysical">
                    <% for(ExRecord last:lastRecordList){%>
                        <!--BMI-->
                        <dl id="bmi">
                            <dt class="coach_physical_items">BMI</dt>
                            <dd class="coach_physical_items data"><%=last.getBmiAfter() %></dd>
                            <dd class="coach_physical_items graph">
                                <div class="data_graph"></div>
                            </dd>
                        </dl>
                        <!--end BMI-->

                        <!--근골격량-->
                        <dl id="musculoskeletalMass">
                            <dt class="coach_physical_items">근골격량</dt>
                            <dd class="coach_physical_items data"><%=last.getMuscleBone() %>kg</dd>
                            <dd class="coach_physical_items graph">
                                <div class="data_graph"></div>
                            </dd>
                        </dl>
                        <!--end 근골격량-->

                        <!--기초 대사량-->
                        <dl id="basicMetabolism">
                            <dt class="coach_physical_items">기초대사량</dt>
                            <dd class="coach_physical_items data"><%=last.getBmm()%>kcal</dd>
                            <dd class="coach_physical_items graph">
                                <div class="data_graph"></div>
                            </dd>
                        </dl>
                        <!--end 기초 대사량-->
                        <%} %>
                    </div>
                    <!--end 코치 신체 내역-->
                    <!--코치 신체 접기-->
                    <div class="popup_up"><i class="fas fa-chevron-up"></i></div>
                    <!--end 코치 신체 접기-->
                </div>
                <!--end 코치 신체 정보 펼친 창-->
            </div>
        </div>
        <!--end coachExercise-->

        <!--코칭 가능 요일-->
        <div class="coaching_box">
            <div class="coaching title">코칭 가능 요일</div>
            <div class="coaching day_list">
                <ul>
             <%for(Coach ca:caList){ %>
                    <li class="coaching sunday <% if(ca.getSundayOnOff()!=0){%>coaching_on<%}%>">일</li><!--
                    --><li class="coaching monday <% if(ca.getMondayOnOff()!=0){%>coaching_on<%}%>">월</li><!--
                    --><li class="coaching tuesday <% if(ca.getTuesdayOnOff()!=0){%>coaching_on<%}%>">화</li><!--
                    --><li class="coaching wednesday <% if(ca.getWednesdayOnOff()!=0){%>coaching_on<%}%>">수</li><!--
                    --><li class="coaching thursday <% if(ca.getThursdayOnOff()!=0){%>coaching_on<%}%>">목</li><!--
                    --><li class="coaching friday <% if(ca.getFridayOnOff()!=0){%>coaching_on<%}%>">금</li><!--
                    --><li class="coaching saturday <% if(ca.getSaturdayOnOff()!=0){%>coaching_on<%}%>">토</li>
                    <% }%>
                </ul>
            </div>
                     <%if(coachNo == loginMember.getNo()){ %>
            <div class="coaching update"><button class="coaching update_btn">수정하기</button></div>
			<%} %>
        </div>
        <!--end coaching_on-->

        <!--코칭 가격 설정-->
        <div class="coaching_cost_box">
        <span>코칭 가격 설정</span>
        		<%for(Coach coach : coachList){ %>
        	<div>
                <input type="text" maxlength="10" name="coachingCost" value="<%=coach.getCost()%>">
                <img src="img/energy_large.png" width="20">
                         <%if(coachNo == loginMember.getNo()){ %>
                <button id="setCostBtn">완료</button>
                <%} %>
            </div>
            <%}%>
        </div>
        <!--end 코칭 가격 설정-->



        <!--수강생 분포도-->
        <div class="student_data">
            <div  id="studentTitle">수강생 분포도</div>
            <!-- 여자 남자 사진으로 해야 하나 폰트 어썸으로 해야 하나 모르겠다. -->
            <!-- 남자 -->
            <div id="boyData">
                <ul>
                    <li class="boy icon"><i class="fas fa-mars"></i></li>
                    <li class="boy percent">75%</li>
                    <li class="boy number">9390명</li>
                    <li class="boy kcal">420kcal</li>
                </ul>
            </div>
            <!--end boyData-->

            <!--여자-->
            <div id="girlData">
                <ul>
                    <li class="girl icon"><i class="fas fa-venus"></i></li>
                    <li class="girl percent">25%</li>
                    <li class="girl number">2131명</li>
                    <li class="girl kcal">320kcal</li>
                </ul>
            </div>
            <!--end girlData-->

            <!--막대그래프-->
            <div id="ratioBar">
                <div id="boyRatioBar">

                </div>
                <div id="girlRatioBar">

                </div>
            </div>
            <!--end ratioBar-->
        </div>
        <!--end student_data-->
    </div>
    <!--end coachDetail-->

    <!--코치탭-->
    <div id="coachTab">

        <ul class="coach_tap">
            <li class="tap_on" id="lectureList">강의목록</li><!--
            --><li id="exerciseList">운동목록</li><!--
            --><li id="reviewAndScore">리뷰 및 평점</li><!--
            --><li id="prizeAndCareer">수상 및 경력</li><!--
            --><li id="coachingBook">코칭 예약</li>
        </ul>
    </div>
    <!--end coachTab-->

    <div id="tabContent">
        <ul>
<!--            강의 목록-->
            <li id="lectureContent" class="tab_content_on">
           
                <div class="content">
                <%if(total==0){ %>
                    <div id="lectureBox" class="updatedBox">
                        등록된 강의가 없습니다.
                        <div class="addBtnBox">
                                 <%if(coachNo == loginMember.getNo()){ %>
                            <button id="addLecture" class="add_btn">+추가하기</button>
                            <%} %>
                        </div>
                    </div>
                    <%} %>
                    
          <div id="coachLectureTab">
          
               <%if(coachNo == loginMember.getNo()){ %>
                <div id="registerMyLecture">
                   <a href="/lectureRegisterForm.jsp" ><button>강의등록</button></a>
                </div>
                 <%} %>
          
        
			<div class="lecture_box">
			<ul>
			  <%for(Lecture lecture : lectureList){ %>
				<!-- 강의 리스트 -->
				<li class="lecture_list" class="lecture">
					
					<!-- 강의 이미지 -->
					<div class="lecture_img">
						<img  src="/img/thumbnail/<%=lecture.getThumbnail()%>">
					</div>
					<!-- end 강의 이미지 -->
					
					 <!-- 강의 이름 -->
					<div class="lecture_name"><%=lecture.getTitle()%></div>
					 <!-- end 강의 이름-->
			
		 <!-- 공개여부-->
		 <%if(coachNo == loginMember.getNo()){ %>
        <div class="l_open_toggle">
            <div >
                <label class="l_toggle" >
                    <input type="checkbox" name="open" data-on-off=<%=lecture.getOnOff() %> <%if(lecture.getOnOff().equals("T")){%> checked <%} %>>
                    	<span data-no=<%=lecture.getNo() %>></span>
					</input>
                </label>
            </div>
        </div>
	 <!-- end 공개여부-->
	 <%} %>
            </li>
            <%} %>
		</ul>
				
			</div>
			<div id="pagination"><%=paginate %></div>
			<!-- .lecture_box END -->
              </div>
              <!-- #coachLectureTab END-->	      
                </div>
                <!--end content-->

            </li>
<!--            end 강의 목록-->

<!--            운동 목록-->
            <li id="exerciseContent">

                <div class="content">
                <%if(result==0){ %>
                    <div id="exerciseBox" class="updatedBox">
                        등록된 운동이 없습니다.
                        <div class="addBtnBox">
                                 <%if(coachNo == loginMember.getNo()){ %>
                            <button id="addExercise" class="add_btn">+추가하기</button>
                            <%} %>
                        </div>

                    </div> 
                    <%}else{ %>
                    
            <!--코치 내 운동 목록-->
            <div class="tab2">

                <div id="searchAndSort">

                <%if(coachNo == loginMember.getNo()){ %>
                <div id="registerMyEx">
                   <button>운동등록</button>
                </div>
                 <%} %>

                <div id="exerciseSort">

                    <select id="sort" name="sort">
                        <option value="1" >칼로리순</option>
                        <option value="2">조회수순</option>
                        <option value="3">이름순</option>
                        <option value="4">최신순</option>
                    </select>
                </div>

                </div>
                <!-- searchAndSort END-->

                <!--coachExerciseTab-->
                <div id="coachExerciseTab">
                
                		
				  <!-- exerciseList -->
				                
				   
                   
                </div>
                <!--coachExerciseTab END-->

            </div>
            <%} %>
            <!--내 운동 목록 END-->
                    
                </div>
                <!--end content-->
            </li>
<!--            end 운동 목록-->
            <li id="reviewContent">
            	
            	<div class="review_box">
    <div class="review_init hidden">
        <div class="review_init_box">
            <div class="review_init_text">
                 아직 리뷰가 없습니다~
            </div>
        </div>
    </div>
    <div class="normal_review ">
        <div class="review_total bar">
            <div id="tabTitle" class="bar_contents">코치평점</div>
            <div id="starPoint"  class="bar_contents">
                <div id="starIcon">
                    <i class="fas fa-star"></i>
                </div>
                <div id="starData">
                    3.8 (3244)
                </div>
            </div>
            <div class="bar_contents">
                <canvas id="marksChart"  width="200" height="200"></canvas>
            </div>
        </div>
        <div id="reviewList">
            <div class="review_card bar">
                <div class="photo bar_contents">
                    <div></div>
                </div>
                <div class="bar_contents writer_explain">
                    <div class="bar writer_explain1">
                        <div class="bar_contents writer_tier">
                            골드골드
                        </div>
                        <div class="bar_contents writer_name">
                            김수현수현수현
                        </div>
                        <div class="bar_contents writer_kcal">
                            소모칼로리150kcal
                        </div>

                        <div class="bar_contents report">
                            <i class="fas fa-bullhorn"></i>
                        </div>
                    </div>
                    <div class="bar writer_explain2">
                        <div class="bar_contents writer_date">
                            2020-12-01 21:39:27
                        </div>
                        <div class="bar_contents writer_lecture_name ">
                            스무글자스무글자스무글자스무글자스무글자 수강
                        </div>
                    </div>
                    <div class="review_contents on">
                        양치승 트레이너 코치님은 완전 친절하시고
                        운동방법이나 운동에 대해서 정확하게 알려주십니다~
                        감사합니다♡♡♡
                        또한 운동에 대해 잘 모르거나 자세에 대해 의문의 들때도 항상 친절하게 답변해주시고 시간때에 상관없이
                        항상 밝은 미소로 응대해주십니다.
                        양치승 트레이너 코치님은 완전 친절하시고
                        운동방법이나 운동에 대해서 정확하게 알려주십니다~
                        감사합니다♡♡♡
                        또한 운동에 대해 잘 모르거나 자세에 대해 의문의 들때도 항상 친절하게 답변해주시고 시간때에 상관없이
                        항상 밝은 미소로 응대해주십니다.
                    </div>
                    <div class="more"><i class="fas fa-angle-double-down"></i> 더보기</div>
                    <div class="little off"><i class="fas fa-angle-double-up"></i> 접 기</div>
                </div>
            </div><!--review card end-->
            
        </div><!--#reviewList-->
    </div>
</div><!--.review_box end-->

            	
            </li>
            <li id="prizeContent">
            
            	 <!------------- 수상--------------------------->
    <div id="prize">
        <div class="line_div">
        <h4>수상</h4>
        <div class="line"></div>
        </div>
        <ul>

        <!--추가하기를 통해 누르면 li 요소가 append 된다. -->
        </ul>

        <!--수상을 추가하는 div -->
        <div class="plus_area">
            <button id="plusPrizeBtn">추가하기</button>
            <!--수상을 추가하는 입력 폼-->
            <form id="plusPrize">

                <input placeholder="대회명과 순위를 기재해주세요" name="prize" type="text">
                <button id="prizeInputBtn" type="button">등록</button>
            </form>
        </div>
        <!-- 수상을 추가하는 div end -->

    </div>
    <!--prize end -->


    <!---------------경력-------------------------------->
    <div id="career">
        <div class="line_div">
        <h4>경력</h4>
        <div class="line"></div>
        </div>
        <ul>


            <!--추가하기를 통해 누르면 li 요소가 append 된다. -->
        </ul>

        <!-- 경력을 추가하는 div-->
        <div class="plus_area">
            <button id="plusCareerBtn">추가하기</button>
            <!--경력을 추가하는 입력 폼-->
            <form id="plusCareer">

                <!--창 닫힘 표시-->
                <div><i class="fas fa-times"></i></div>
                <!---------------->

                <div>
                    <input name="companyName" id="companyName" placeholder="업체 명과 직위를 입력해주세요.">
                </div>

                <p>근무기간</p>


                <!--근무 시작일 -->
                <div id="firstDate">

                    <select name="firstDateYear" id="firstDateYear"></select>년
                    <select name="firstDateMonth" id="firstDateMonth"></select>월
                    <select name="firstDateDay" id="firstDateDay"></select>일

                    <p>부터</p>
                </div>
<!--                    <p class="caution">제대로된 숫자를 입력해주세요.</p>-->

                <!-- firstDate div end (근무 시작일) -->

                <!--근무 종료일 -->
                <div id="lastDate">
                    <select name="lastDateYear" id="lastDateYear"></select>년
                    <select name="lastDateMonth" id="lastDateMonth"></select>월
                    <select name="lastDateDay" id="lastDateDay"></select>일

                    <p>까지</p>

<!--                    <p class="caution">제대로된 숫자를 입력해주세요.</p>-->
                </div>
                <!-- lastDate div end (근무 종료일) -->


                <button id="careerInputBtn" type="button">등록완료!</button>


            </form>
        </div>
        <!-- 경력을 추가하는 div end-->
    </div>
    <!--career end-->


    <!--------------자격-------------------------------->
    <div id="qualification">
        <div class="line_div">
        <h4>자격</h4>
        <div class="line"></div>
        </div>
        <ul>

            <!--추가하기를 통해 누르면 li 요소가 append 된다. -->
        </ul>

        <!-- 자격을 추가하는 div-->
        <div class="plus_area">
            <button id="plusQualificationBtn">추가하기</button>
            <!--자격을 추가하는 입력 폼-->
            <form id="plusQualification">

                <input id="Inputqualification" placeholder="자격증 명을 기재해주세요" name="qualification" type="text">
                <button id="qualifiInputBtn" type="button">등록</button>
                <div id="autocompleteArea">과연 어디에 나타날까요</div>
            </form>

        </div>
        <!-- 자격을 추가하는 div end-->

    </div>
    <!--자격 end qualification div end-->
            
            </li>
            <li id="coachingContent">

				<%@ include file="/WEB-INF/template/my_diary.jsp" %>
				
			</li>
        </ul>
    </div>


</div>
<!--end container-->

<!-- 팝업들 ===============================================================================-->

<div class="pop_up">

<!--    구독하기-->
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
                    <div class="energy_num">4374</div>
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
                    <div class="energy_num">4325</div>
                </div>

            </div>
            <!--end 결제시 잔여 에너지-->
        </div>
        <!--    end 에너지 표기-->

        <!--하단 버튼(취소, 구독하기)-->
        <div class="bottom_btn">
            <button class="cancel_btn">취소</button><!--
        --><button class="ok_btn">구독하기</button>
        </div>
        <!--end 하단 버튼(취소, 구독하기)-->
    </div>
    <!--end 구독팝업창-->
<!--    구독하기-->

<!--    사진 더보기-->
    <div class="white_pop_up">
        <div id="photoBox">
            <ul>
                <li class="photo_list"><img src="" class="photo"></li>
                <li class="photo_list"><img src="" class="photo"></li>
                <li class="photo_list"><img src="" class="photo"></li>
                <li class="photo_list"><img src="" class="photo"></li>
            </ul>

        </div>
        <!--end photoBox-->


        <!--    -->
        <button class="close_btn">X</button>
        <!--end 닫기 버튼-->

    </div>
<!--    end 사진 더보기-->

<!--    시간 선택 팝업-->
    <div id="timeChoiceContainer" class="time_choice">
<form id="timeForm">



        <!--    요일들 -->
        <div class="days">
            <ul>
            
                <li class="sunday ">일</li><!--
            --><li class="monday day_on">월</li><!--
            --><li class="tuesday">화</li><!--
            --><li class="wednesday">수</li><!--
            --><li class="thursday">목</li><!--
            --><li class="friday">금</li><!--
            --><li class="saturday">토</li>
           
            </ul>
        </div>
        <!--end 요일 들-->

        <!--    시간들-->
        <div class="times">
            <div class="sub_text">코칭을 원하지 않는 시간대가 있다면 선택해주세요.</div>
            <ul>
                <li class="sunday days"></li><!--
            --><li class="monday time_on days"></li><!--
            --><li class="tuesday days"></li><!--
            --><li class="wednesday days"></li><!--
            --><li class="thursday days"></li><!--
            --><li class="friday days"></li><!--
            --><li class="saturday days"></li>
            </ul>
        </div>
        <!--    end 시간들-->

        <!--    버튼들-->
        <div class="button_box">
            <button type="button" class="close_btn"><i class="fas fa-times"></i></button>
            <button class="ok_btn">확인</button>
        </div>
        <!--    end 버튼 들-->
</form>
    </div>


    <!--    end 시간 선택 팝업-->

</div>
<!--end 팝업-->
<!--    ===============================================================================-->

<!--footer-->
<div id="footer">
    <div class="footer_aux">

        <!--footer logo-->
        <h1 class="footer_logo">
            <a href=""><img src="img/logo_gray.png"><strong> GYM.zip</strong></a>
        </h1>
        <!--footer logo END-->

        <!--footer menu-->
        <div class="footer_nav">
            <ul>
                <li><a href="">공지사항</a></li>
                <li><a href="">이용약관</a></li>
                <li><a href="">개인정보처리방침</a></li>
                <li><a href="">고객센터</a></li>
            </ul>
        </div>
        <!--footer menu END-->

        <address>Copyright &copy; JOA corp All right reserved</address>
    </div>
</div>
<!--footer END-->
</div>
<!--wrap end-->
<!--시간들 템플릿-->
<script type="text/template" id="timeTmpl">

    <!-- 시간들-->
    <div class="time_area">
<label>오전<input type="checkbox" name="am" class="check_all_am"></label>
<label>오후<input type="checkbox" name="pm" class="check_all_pm"></label>
        <!-- 오전 -->

        <ul class="am"> <div>오전</div>

            <li><label><input type="checkbox" name="workingTime" value="<@=day@>00" class="hour0 time" checked><span>00:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>01" class="hour1 time" checked><span>01:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>02" class="hour2 time" checked><span>02:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>03" class="hour3 time" checked><span>03:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>04" class="hour4 time" checked><span>04:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>05" class="hour5 time" checked><span>05:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>06" class="hour6 time" checked><span>06:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>07" class="hour7 time" checked><span>07:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>08" class="hour8 time" checked><span>08:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>09" class="hour9 time" checked><span>09:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>10" class="hour10 time" checked><span>10:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>11" class="hour11 time" checked><span>11:00</span></label></li>
        </ul>
        <!--오후-->
        <ul class="pm"> <div>오후</div>
            <li><label><input type="checkbox" name="workingTime" value="<@=day@>12" class="hour12 time" checked><span>12:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>13" class="hour13 time" checked><span>13:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>14" class="hour14 time" checked><span>14:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>15" class="hour15 time" checked><span>15:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>16" class="hour16 time" checked><span>16:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>17" class="hour17 time" checked><span>17:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>18" class="hour18 time" checked><span>18:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>19" class="hour19 time" checked><span>19:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>20" class="hour20 time" checked><span>20:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>21" class="hour21 time" checked><span>21:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>22" class="hour22 time" checked><span>22:00</span></label></li><!--
                        --><li><label><input type="checkbox" name="workingTime" value="<@=day@>23"  class="hour23 time" checked><span>23:00</span></label></li>
        </ul>
        <!--end 오후-->
    </div>
    <!-- end 시간들 -->
</script>
<!--end 시간들 템플릿-->



<script type="text/template" id="exerciseTmpl">
                
<ul id="exList">
    <@ _.each(exerciseList, function(exercise){ @>
    <li>

        <img src="/img/exercise/<@=exercise.thumbnail@>" width="210" height="140">

        <div id="coachExerciseName">
            <@=exercise.name @>
        </div>

        <div id="kcalInform">
            소모칼로리
            <span> <@=exercise.avgKcal @> kcal</span>
        </div>

        <div id="exerciseNumInform">
            운동수
            <span> <@=exercise.viewCount @> 회</span>
        </div>

       
<%if(coachNo == loginMember.getNo()){ %>
 <!-- 공개여부-->
        <div class="open_toggle">
            <div >
                <label class="toggle" >
                    <input type="checkbox" name="open" data-on-off=<@=exercise.onOff@> <@if(exercise.onOff == "T"){@> checked <@}@>>
                    	<span data-no=<@=exercise.exerciseNo@>></span>
					</input>
                </label>
            </div>
        </div>
 <!-- end 공개여부-->
<%}%>

       
    </li>
<!--exerciseList END-->    
    <@})@>
  </ul>

 <div id="pagination"><@=paginate@></div>

</script>






<!--제이쿼리 임포트-->
<script src="/js/header.js"></script>
<script src="js/underscore-min.js"></script>
<script src="js/Chart.js"></script>
<script src="js/moment-with-locales.js"></script>
<script>

// 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    // sns 이미지와 링크
    let snsImgSrc ;
    let snslinkliNum=0; // sns 링크 갯수

    // 탭에서 누르면 스타일 변경
    $(".coach_tap li").on("click",function () {

        // 기존의 on 클래스 제거
        $(".tap_on").removeClass("tap_on");

        // 기존의 tap content 지우기
        $(".tab_content_on").removeClass("tab_content_on");

        // 클릭한 li 요소에 on 클래스 더하기
        $(this).addClass("tap_on");

        $("#tabContent>ul>li").eq($(this).index()).addClass("tab_content_on");
        //$("#tabContent .contents>ul>li").eq($(this).index()).addClass("tab_content_on");
        calendar.render();
    });
    // end .coach_tap li onclick

    // 프로필 이미지 수정하기


    // end 프로필 이미지 수정하기

    // 홍보 문구 입력후 엔터를 누를경우
    $("#inputAdText").on("keydown",function (e) {
       if(e.keyCode==13){
           // 입력 값을 가져오고
           const adText=$("#inputAdText").val();


           $(".ad_on").removeClass("ad_on");

           // 홍보 문구 표기하는 곳에 부착
           $("#savedAdText").text(adText).addClass("ad_on");

       }
    });
    //end 홍보 문구 입력후 엔터를 누를 경우

    // 홍보 문구 눌렀을 때 수정가능
    $("#savedAdText").on("click",function () {
        $(".ad_on").removeClass("ad_on");

        // 홍보 문구 표기하는 곳에 부착
        $("#inputAdText").addClass("ad_on");


    });
    // end 홍보 문구 눌렀을 때

    // sns 추가하기 버튼 클릭시
    $("#plusSNSBtn").on("click",function () {
			
        if(snslinkliNum==4){
            alert("sns는 최대 4개까지 등록이 가능합니다.");
            return;
        }

       $("#addSNSArea").css("display","block");
    });
    // end sns 추가하기 버튼 클릭시

    // sns 추가하는 팝업 x 누를 때
    $("#addSNSArea .cancel_btn").on("click",function () {
       $("#addSNSArea").css("display","none");
    });
    // end sns 추가하는 팝업 x 누를때

    // sns 추가하는 팝업 등록 누를 때
    $("#addSNSArea .upload_btn").on("click",function () {



        // li 만들어서 이미지랑 입력한 거 해서 올리는 거하기
        let $selectedSnsImg=$("<img>").attr("src",snsImgSrc).css({width:"20",height:"20",marginRight:"10px"});

        let snsLink=$("#snsInputBox #inputSnsLink").val();

        // 삭제 버튼
        const $delete=$("<i>").addClass("fas").addClass("fa-times");
        $delete.css({"color":"#424242", "margin-left":"10px"});
        // end 삭제 버튼
        let $snsAdLink=$("<li>").html($selectedSnsImg).append($("<span>").text(snsLink)).append($delete)
                                .css({"height":"20px","line-height":"20px",marginTop:"10px"});



        $("#snsListBox>#snsList").append($snsAdLink);

        $("#snsInputBox #inputSnsLink").val("");
        $("#snsListBox .sns_type_li input:checked").prop("checked",false);

        snslinkliNum++;
        // 창 닫기
       $("#addSNSArea").css("display","none");
    });
    // end sns 추가하는 팝업 등록 누를 때



    // sns 이미지 누르면 입력란에 들어가도록
    $("#snsTypeBox>.sns_type_li .sns_img").on("click",function () {
       snsImgSrc=$(this).attr("src");

       $("#snsInputBox>.sns_img").attr("src",snsImgSrc);

    });
    // end sns 이미지 누르면 입력란에 들어가도록

    // 코치 신체 상세 막대그래프 그리기===========================================
    // bmi 막대 그래프
    // bmi 수치 퍼센트 계산
    let bmiData= (parseInt($("#bmi .data").text())/40)*100;
    $("#bmi .data_graph").css("left",bmiData+"%");
    // end bmi 막대 그래프

    // 근골격량 막대 그래프
    let muscleData=(parseInt($("#musculoskeletalMass .data").text())/100)*100;
    $("#musculoskeletalMass .data_graph").css("width",muscleData+"%");
    // end 근골격량 막대 그래프

    // 기초 대사량 막대 그래프
    let basicData=(parseInt($("#basicMetabolism .data").text())/2000)*100;
    $("#basicMetabolism .data_graph").css("width",basicData+"%");
    // end 코치 신체 상세 막대그래프 그리기=======================================

    // 코치 신체 상세 팝업 토글
    $("#exerciseDetail").on("click",function () {
       $("#coachTmi").css("display","block");
    });
    $("#coachTmi .popup_up").on("click",function () {

       $("#exerciseDetail #coachTmi").fadeOut();
    });
    // end 코치 신체 상세 팝업 토글

    // 리스트의 x 표시 동작
    $("#snsListBox ul ").on("click",'.fa-times',function (e) {
        $(this).parent().remove();
        snslinkliNum--;
    });
    // end 리스트의 x 표시 동작


    // 구독하기 팝업 관련 함수 선언
    function subscribePopUpToggle(){
        $(".pop_up").toggleClass("pop_bg_on");
        $(".subscribe_pop_up").toggleClass("pop_up_on");
    }

    // end 구독하기 팝업 관련 함수 선언


    //구독하기 팝업 띄우기
    $(".subscribe").on("click",function () {

        subscribePopUpToggle();
    });
    // end 구독하기 팝업 띄우기

    // 구독하기 -> 취소 버튼
    $(".subscribe_pop_up .cancel_btn").on("click",function () {

        subscribePopUpToggle();

    });
    // end 구독하기 -> 취소버튼

    // 구독하기 -> 구독하기 버튼
    $(".subscribe_pop_up .ok_btn").on("click",function () {
       subscribePopUpToggle();
    });
    // end 구독하기 -> 구독하기 버튼

    // 사진 더보기 관련 토글 함수 선언
    function photoViewMoreToggle(){
        $(".pop_up").toggleClass("pop_bg_on");
        $(".pop_up .white_pop_up").toggleClass("pop_up_on");
    }
    // end 사진 더보기 관련 토글 함수 선언


    // 사진 더보기 팝업 띄우기
    $("#viewMore").on("click",function () {
        $(".pop_up").css("background","#fff");
        photoViewMoreToggle();
    });
    // end 사진 더보기 팝업 띄우기

    // 사진 더보기 팝업 내리기
    $(".white_pop_up .close_btn").on("click",function () {
       photoViewMoreToggle();
    });
    // end 사진 더보기 팝업 내리기


    function updateCoachingTimeToggle(){
        $(".pop_up").toggleClass("pop_bg_on");
        $(".time_choice").toggleClass("pop_up_on");
    }
    // end 사진 더보기 관련 토글 함수 선언


    $(".coaching.update_btn").on("click",function () {
        updateCoachingTimeToggle();
    });


    // 코칭 가능요일 관련 스크립트 코드
    let dayIndex;  // 요일 인덱스 값

    let coachingDays=[]; // 코칭 요일들의 코칭 여부
    coachingDays.length=7;
    let coachingIndex=0;

    // 요일을 클릭할 경우
    $(".days>ul>li").on("click",function () {
        // day_on 클래스 지우기
        $(".day_on").removeClass("day_on");

        //그리고 누른거에 붙여주기
        $(this).addClass("day_on");

        // 인덱스 값 구하기
        dayIndex=$(this).index();


        // 요일에 해당하는 시간 창 띄우기
        $(".time_on").removeClass("time_on");
        $(".times>ul>.days").eq(dayIndex).addClass("time_on");

    });
    // end 요일을 클릭할 경우

    // 언더 스코어 템플릿 활용하여 월화수목금토일에 시간들 붙여주기
    const timeTmpl=_.template($("#timeTmpl").html());


		for(let i = 0 ; i < 7; i++) {
    
       $(".times>ul>.days").eq(i).append(timeTmpl({day:i}));
    
		}


    // end 언더스코어 활용 시간들 붙이기

    
    
    // 오전 전체선택
      $(".check_all_am").on("click",function () {
    	  $( '.am input' ).prop( 'checked', this.checked ); 
    	  
      });
   // 오후 전체선택
      $(".check_all_pm").on("click",function () {
    	  $( '.pm input' ).prop( 'checked', this.checked ); 
    	  
      });
    

    // 취소 버튼
    $("#timeChoiceContainer .close_btn").on("click",function () {

        updateCoachingTimeToggle();
    });
    // end 취소 버튼

    
  

    // 확인 버튼
    
    
    $("#timeForm").on("submit",function (e) {
    	
		e.preventDefault();
		

		let times = $(this).serialize();
		
		if(!times){
			times = "workingTime=999";
		}
		console.log(times);
		
		$.ajax({
			url:"/ajax/updateCoachingTime.json?"+times+"&no="+<%=coachNo%>,
			type:"post",
			error:function(){
				alert("서비스 점검중");
			},
			success:function(json){
				
				  let checkbox=document.getElementsByName('workingTime');
			        let chk=0;
			        coachingIndex=0;


			        for(let i=0;i<checkbox.length;i++){
			            if(checkbox[i].checked){
			                chk=1;
			            }

			            // 일 : 0~23 24*0(요일 인덱스)+0
			            // 월 : 24~47 24*1(요일 인덱스)+시간 인덱스
			            // 화 : 48~71
			            // 수 : 72~95
			            // 목 : 96~119
			            // 금 : 120~143
			            // 토 : 144~167


			            if(i%24==23){

			                coachingDays[coachingIndex]=chk;
			                coachingIndex++;
			                chk=0;
			            }
			        }
			        // for end

			       /*  // 일월화수목금토 coachingDays[i]의 값이 1이면 코칭이 가능한 날이다. 0이면 코칭이 불가능한 날
			        for(let i=0;i<7;i++){

			            if(coachingDays[i]==1){
			                $(".coaching.day_list>ul>li").eq(i).addClass("coaching_on");
			            }
			            else if(coachingDays[i]==0){
			                $(".coaching.day_list>ul>li").eq(i).removeClass("coaching_on");
			            }
			        }
 */
			    	
			        
			}
		})
		
		updateCoachingTimeToggle();

    });
    // end 코칭 가능 요일 관련 스크립트
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

    
   //운동 추가 버튼 클릭시 운동등록 팝업
   $("#addExercise").on("click",function (e){
        $(".pop_layout").css("display","block")
        $("#header").css("display","none")
    });
    
   //운동 추가 버튼 클릭시 운동등록 팝업
   $("#addLecture").on("click",function (e){
	   
	   alert("강의등록 ㄱㄱ");
	   
   });
      
    

    /*===============================================================================*/
    
    


	//img input hidden 요소
	const $imgFileName = $("#imgFileName");
	//img input file 요소
	const $inputImgFile=$("#inputImgFile");
	//img box 요소
	const $imgFile = $("#imgFile");
	//img 요소
	const $selectImg=$("#selectImg");
	
	//메세지
	const $imgFileMsg = $("#imgFileBox .msg");
	//이미지인지 판단
	const imgFileReg = /^image/;
	
	
	//이미지 파일이 변경될때
	$inputImgFile.on("change",function(){
		
		const file = this.files[0];
		// 파일의 크기가 1이상
		if(file==null||file.size<=0){
		
			$imgFileMsg.text("올바른 파일을 선택해주세요")
			return;
		
		}//if END
		
		//이미지인지 확인!!
		if(!imgFileReg.test(file.type)) {
			
			$imgFileMsg.removeClass("ok")
	        .text("이미지 파일을 선택해주세요.");
			
			return;
			
		}else {
			
			$imgFileMsg.text("");
		
	}//if~else END
			
	//여기까지 왔다면 1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
			//$imgFileMsg.text("파일업로드 중...");
			
			const formData = new FormData();
			
			formData.append("type","e");
			
			formData.append("inputImgFile",file,file.name);
			console.log(file.type);
			$.ajax({
				
				url:"/ajax/uploadImage.json",
				type:"POST",
				processData:false,
				contentType:false,
				data:formData,
				dataType:"json",
				error:function(){
					alert("서버 점검중");
				},
				success:function(json){
					
					console.log(json.imgFileName);
					
					$imgFile.css({"backgroundImage":"url(img/exercise/"+json.imgFileName+")","backgroundSize":"cover"});
					
					$imgFile.find("i").addClass("non_display");
					$imgFileMsg.text("");
					$imgFileName.val(json.imgFileName);
					
				}
			});//$.ajax END
		
	});//img change() END
	
	
	
	//동영상 파일명 input hidden 요소
	const $videoFileName = $("#videoFileName");
	
	//동영상 길이
	const $videoFileDuration = $("#videoFileDuration");
	
	//video input file 요소
	const $inputVideoFile = $("#inputVideoFile");
	//video box 요소
	const $videoFile = $("#videoFile");
	//video 요소
	const $selectVideo=$("#selectVideo");
	const $selectVideoSource=$("#selectVideo source");
	
	//메세지
	const $videoFileMsg = $("#videoFileBox .msg");
	//이미지인지 판단
	const $videoFileReg = /^video/;
	
	
	//동영상 파일이 변경될때
	$inputVideoFile.on("change",function(){
		
		const file = this.files[0];
		// 파일의 크기가 1이상
		if(file==null||file.size<=0){
		
			$videoFileMsg.text("올바른 파일을 선택해주세요")
			return;
		
		}//if END
		
		//이미지인지 확인!!
		if(!$videoFileReg.test(file.type)) {
			
			$videoFileMsg.removeClass("ok")
	        .text("동영상 파일을 선택해주세요.");
			
			return;
			
		}else {
			
			$videoFileMsg.text("");
		
	}//if~else END
			
	//여기까지 왔다면 1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
			//$imgFileMsg.text("파일업로드 중...");
			
			const formData = new FormData();
			
			formData.append("type","v");
			
			formData.append("inputVideoFile",file,file.name);
			
			$.ajax({
				
				url:"/ajax/uploadVideo.json",
				type:"POST",
				processData:false,
				contentType:false,
				data:formData,
				dataType:"json",
				error:function(){
					alert("서버 점검중");
				},
				success:function(json){
					console.log(json);
					
					$videoFile.addClass("non_display");
					$("#videoFileBox").find("Strong").removeClass("non_display").text(json.videoFileName);
					
					$videoFileMsg.text("");
					$videoFileName.val(json.videoFileName);
					$videoFileDuration.val(json.videoDuration);
					
				}
			});//$.ajax END
		
	});//video change() END
	
	
	


    // 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    //강의템플릿
    const exerciseTmpl = _.template($("#exerciseTmpl").html());
    const $exList = $("#exList");

    //코치운동목록(ul을 감싸는 div)
    const $coachExerciseTab = $("#coachExerciseTab");
    
    //코치운동목록을 페이징하기위한 변수
    let page =1;
    let coachNo = <%=coachNo%>
    let sort=$("#sort option:selected").val();
    
    //필터에 따라서 강의목록을 불러오는 함수
    function getExerciseList() {
    	

    	let data ={
                "sort":sort,
                "page":page,
                "coachNo":coachNo
            }
        $.ajax({
            url:"/ajax/getExerciseList.json",
            data:data,
            type:"get",
            error:function() {
                alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
            },
            success:function (json) {
            
             	console.log(json);
            	$coachExerciseTab.html(exerciseTmpl(json));
             }
        });

    }//getExerciseList() end
    
    //코치운동목록 함수 호출
    getExerciseList();
    
  
    

    //운동 목록 select 목록 변경시
    $("#sort").on("change",function() {
    	sort=$("#sort option:selected").val();
        getExerciseList();
        
    });//  $("#sort").on(change) end
    
    $(document).on("click",'.open_toggle div span',function(){
    	
    	const no = this.dataset.no;
   	 	console.log(no);
   	 	const onOff= $(".toggle input").data("onOff");
   	 	console.log(onOff);
   	 	
   	 	let data={
   	 			"exNo":no,
   	 			"onOff":onOff
   	 	}
       
       $.ajax({
           url:"/ajax/OnOffUpdate.json",
           data:data,
           type:"post",
           error:function() {
               alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
           },
           success:function (json) {
              console.log(json);
           }
       });
        
        
    });
    
    
	$('.l_open_toggle div span').on("click",function(){
    	
		const no = this.dataset.no;
   	 	console.log(no);
   	 	const onOff= $(".l_toggle input").data("onOff");
   	 	console.log(onOff);
   	 	
   	 	let data={
   	 			"lecNo":no,
   	 			"onOff":onOff
   	 	}
       
       $.ajax({
           url:"/ajax/lectureOnOffUpdate.json",
           data:data,
           type:"post",
           error:function() {
               alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
           },
           success:function (json) {
              console.log(json);
           }
       });
  
        
    });

 
    
    $("#registerMyEx").on("click",function (e){
        $(".pop_layout").css("display","block")
        $("#header").css("display","none")
    });
    
    $("#popWrapEx").on("click",function(e) {
        if($(e.target).hasClass("pop_layout")) {
            $("#popWrapEx").hide();
            $("#header").css("display","block")
        }
    });

    
    /*============================리뷰 chart.js====================================*/
    
      var marksCanvas = document.getElementById("marksChart");
    var ScoreData=[2.8, 3.5, 4.3, 4.2, 3.0];
    var ScoreLabel=["커리큘럼", "준비성", "친절도", "시간준수", "전달력"];
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

    });//접 기  눌렀을때
    
    
    /*===========================수상 및 자격증==============================*/
    
    
    let prizeObj =new Object(); // 수상 객체

    $("ul i").css("color","#e0e0e0");

    // 수상 부문 ajax 등록
        $.ajax({
            url:"data/prize.json",
            error:function () {
                alert("다시하세요");
            },
            success:function (json) {
                   $.each(json,function () {
                       const $delete=$("<i>").addClass("fas").addClass("fa-times");
                       // x 표시를 포함한 수상 리스트
                       const $prizeList=$("<li>").text(this.text).append($delete);

                       $("#prize ul").append($prizeList);

                       // x표시 색깔 연하게 하기
                       $("ul i").css("color","#e0e0e0");


                   });
            }

        })
    // end 수상 부문 ajax 등록

    // 자격 부문 ajax 등록
    $.ajax({
       url:"data/qualify.json",
       error:function () {
           alert("서비스오류");
       },
       success:function (json) {
           $.each(json,function () {

               const $delete=$("<i>").addClass("fas").addClass("fa-times");
               // x 표시를 포함한 수상 리스트
               const $qualificationList=$("<li>").text(this.title).append($delete);

               $("#qualification ul").append($qualificationList);

               // x표시 색깔 연하게 하기
               $("ul i").css("color","#e0e0e0");

           });
       }

    });

    // 경력 부문 ajax 등록
    $.ajax({
        url:"data/career.json",
        error:function () {
            alert("서비스오류");
        },
        success:function (json) {

            $.each(json,function () {

                let firstDateT=moment(this.firstDate,'YYYY-MM-DD');
                let lastDateT=moment(this.lastDate,'YYYY-MM-DD');
                let period=moment.duration(lastDateT.diff(firstDateT)).asMonths();
                let periodYear=Math.floor(period/12); // 일한 년수 달수의 12를 나눈것의 몫
                let periodMonth=Math.floor(period%12); // 일한 달수 달 수의 12를 나눈것의 나머지

                const $delete=$("<i>").addClass("fas").addClass("fa-times");
                // 회사이름 하고 일한 년수, 일한 달수 해서 붙여서 ul에 넣기
                //=============================================================
                let $careerList=$("<li>").text(this.companyName+"  "+periodYear+"년 "+periodMonth+"개월").append($delete);


                $("#career ul").append($careerList);

                // x표시 색깔 연하게 하기
                $("ul i").css("color","#e0e0e0");



            });



        }
    });



    // 자격증 들 불러오기

    // 검색될 결과들
    let searchResults=[];



    $.ajax({
        url:"data/qualifications.json",
        error:function () {
            alert("error!")
        },
        success:function (json) {
            $.each(json,function () {



                searchResults.push(this.title);


            });
        }

    });



    // end 자격증 들 불러오기



    // 수상 부분 에서 추가하기 버튼을 누르면 입력 폼 생성-->
    $("#plusPrizeBtn").on("click",function (e) {

        $("#plusPrize").css("display","block");


        // 여기서 인풋 주면 그 자동완성 뜨게 하기


    });
    // end #plusPrizeBtn

    // 자격부분에서 추가하기 버튼을 누르면 자격증 입력 폼 생성-->
    $("#plusQualificationBtn").on("click",function (e)
    {
        $("#plusQualification").css("display","block");

    });
    // end #plusQulificationBtn


    // 경력 추가
    $("#plusCareerBtn").on("click",function (e) {
        $("#plusCareer").css("display","block");



    });
    // end #plusCareerBtn


    //==============================================================================
    // 등록 버튼들, 입력 폼들을 사라지게 하고 입력된 요소들을 li로 생성하여 ul에 부착

    // 수상 등록 버튼
    $("#prizeInputBtn").on("click",function (e) {

        // 수상 부분의 input 요소에 입력한 값을 가져오기
        const prizeName=$("#plusPrize input").val();

        const $delete=$("<i>").addClass("fas").addClass("fa-times");
        // x 표시를 포함한 수상 리스트
        const $prizeList=$("<li>").text(prizeName+" ").append($delete);

        $("#prize ul").append($prizeList);

        // x표시 색깔 연하게 하기
        $("ul i").css("color","#e0e0e0");

        // input 내용 초기화
        $("#prize input").val("");

        // 닫힘
        $("#plusPrize").css("display","none");

       e.preventDefault();
    });
    // end #prizeInputBtn 수상 등록 버튼

    // 경력 등록 버튼
    $(".plus_area #careerInputBtn").on("click",function (e) {


        // 회사명
        const companyName=$("#career #companyName").val();


        // 날짜 입력 받아서 계산후 올리기
        // 근무 시작일
        const firstDateYear=$("#career #firstDateYear").val();
        const firstDateMonth=$("#career #firstDateMonth").val();
        const firstDateDay=$("#career #firstDateDay").val();


        // moment diff 이용하기
        // date 객체로 변환
        const firstDate=moment(firstDateYear+"-"+firstDateMonth+"-"+firstDateDay,'YYYY-MM-DD');


        // 근무 종료일
        const lastDateYear=$("#career #lastDateYear").val();
        const lastDateMonth=$("#career #lastDateMonth").val();
        const lastDateDay=$("#career #lastDateDay").val();

        const lastDate=moment(lastDateYear+"-"+lastDateMonth+"-"+lastDateDay,'YYYY-MM-DD');

        const period=moment.duration(lastDate.diff(firstDate)).asMonths();
        let periodYear=Math.floor(period/12); // 일한 년수 달수의 12를 나눈것의 몫
        let periodMonth=Math.floor(period%12); // 일한 달수 달 수의 12를 나눈것의 나머지



        // 닫힘 표시
        const $delete=$("<i>").addClass("fas").addClass("fa-times");
        // 회사이름 하고 일한 년수, 일한 달수 해서 붙여서 ul에 넣기
        //=============================================================
        const $careerList=$("<li>").text(companyName+"  "+periodYear+"년 "+periodMonth+"개월").append($delete);

        $("#career ul").append($careerList);

        // x표시 색깔 연하게 하기
        $("ul i").css("color","#e0e0e0");

        // input 내용 초기화
        $("#companyName input").val("");




        //===========================================================
        // 닫힘
        $("#plusCareer").css("display","none");

       e.preventDefault();
    });
    // end #careerInputBtn 경력 등록 버튼

    // 자격 등록 버튼
    $("#qualifiInputBtn").on("click",function (e) {

        // 자격 부분의 input 요소에 입력한 값을 가져오기
        const qualificationName=$("#plusQualification input").val();

        const $delete=$("<i>").addClass("fas").addClass("fa-times");
        // x 표시를 포함한 수상 리스트
        const $qualificationList=$("<li>").text(qualificationName+" ").append($delete);

        $("#qualification ul").append($qualificationList);

        // x표시 색깔 연하게 하기
        $("ul i").css("color","#e0e0e0");

        // 닫힘
        $("#plusQualification").css("display","none");

        e.preventDefault();
    });
    // end #qualifiInputBtn 자격 등록 버튼



    //==============================================================================

    // 경력의 x 부분
    // 누르면 입력 폼이 닫힌다.
    $("#plusCareer i").on("click",function (e) {

        // 닫힘
        $("#plusCareer").css("display","none");

        e.preventDefault();
    });
    // end #plusCareer

    // 리스트의 x 표시를 누르면 목록에서 삭제 되도록 한다.
    $("#content ul ").on("click",'.fa-times',function (e) {
        $(this).parent().remove();
    });


    let $firstDateYear=$("#firstDateYear"); // 시작 년
    let $firstDateMonth=$("#firstDateMonth"); // 시작 달
    let $firstDateDay=$("#firstDateDay"); // 시작 일

    let $lastDateYear=$("#lastDateYear"); // 종료 년
    let $lastDateMonth=$("#lastDateMonth"); // 종료 달
    let $lastDateDay=$("#lastDateDay"); // 종료 일


    // 년 월일을 생성하는 함수 선언
    function createYearMonth($year,$month,$date){


        // 올해를 얻어옴(현재) 이렇게 하면 현재 시간이 얻어진다.
        const now=moment();
        //const nowYear


        // 유저가 선택한 년도
        const year=$year.val();
        // 유저가 선택한 월
        const month=$month.val();


        // 일단 비워주고
        $year.empty();
        $month.empty();


        // 월을 생성
        for(let i=1;i<13;i++){
            // 옵션 객체 생성하고 텍스트 설정 후 month에 붙임
            $("<option>").text(i).appendTo($month);
        }// for end

        // 년을 생성
        for(let i=now.year();i>=now.year()-120;i--){
            // 옵션 객체 생성하고 텍스트 설정후 year에 붙임
            $("<option>").text(i).appendTo($year);
        }//for end


        // 년과 월을 만들었으니 이제 날짜를 만들 차례
        createDate($year,$month,$date);


    }//createYearMonth() end




    // 날짜를 생성하는 함수  // 유저가 선택한 년도와 월을 가지고 해당하는 날짜를 생성하는 함수
    function createDate($year,$month,$date){

        // 유저가 선택한 년도
        const year=$year.val();
        // 유저가 선택한 월
        const month=$month.val();





        // 달마다 다른 날짜 출력 위함
        const lastDate=moment([year,month-1]).daysInMonth();
        //alert(lastDate);



        // 기존의 요소들 지움
        $date.empty();



        for(let i=1;i<=lastDate;i++){

            // 옵션 요소를 생성하고 i가 1부터 lastDate 일때 까지 만들어서 date에 붙임
            $("<option>").text(i).appendTo($date);

        }// for end

    }//createDate() end






    // 년을 바꿀 때마다 date 새로 생성(시작일)
    $firstDateYear.change(createDate($firstDateYear,$firstDateMonth,$firstDateDay));
    // 달을 바꿀떄마다 date새로 생성(시작일)
    $firstDateMonth.on("change",createDate($firstDateYear,$firstDateMonth,$firstDateDay));



    // 년을 바꿀 때마다 date 새로 생성(종료일)
    $lastDateYear.change(createDate($lastDateYear,$lastDateMonth,$lastDateDay));
    // 달을 바꿀떄마다 date새로 생성(종료일)
    $lastDateMonth.on("change",createDate($lastDateYear,$lastDateMonth,$lastDateDay));



    // 한번만 호출
    createYearMonth($firstDateYear,$firstDateMonth,$firstDateDay);
    createYearMonth($lastDateYear,$lastDateMonth,$lastDateDay);








    // 자격증 자동 완성 부분

    window.onload = function(){
        // $("#searchKeyword")
        var searchKeyword = document.getElementById("Inputqualification");
        var autocomplete = document.getElementById("autocompleteArea");
        var keyword = "";

        searchKeyword.onkeydown = function(e) {
            searchKeyword.onkeyup(e);
        };

        // $("#searchKeyword").keyup(function(){...});
        searchKeyword.onkeyup = function(e){


            //  if ( e.char ) {
            // IE 전용
            keyword = searchKeyword.value;
            // }

            // if ( $("#searchKeyword").val() == "" ) {...}
            if ( keyword == "" ) {
                // $("#autocomplete").hide();
                autocomplete.style.display = "none";
            }
            else {
                // $("#autocomplete").show();
                autocomplete.style.display = "block";
                fillSearchResult(autocomplete);
            }

        };



    };

    function fillSearchResult( autocomplete ) {

        autocomplete.innerHTML = "";

        //  var searchResults = ["테스트" , "테스트2", "테스트3"];

        for (var i=0; i < searchResults.length; i++) {
            autocomplete.innerHTML += "<div onclick='selectData(this);'>" + searchResults[i] + "</div>";
        }

    }
    function selectData(that) {
        var searchKeyword = document.getElementById("Inputqualification");
        searchKeyword.value = that.innerText;

        var autocomplete = document.getElementById("autocompleteArea");
        autocomplete.style.display="none";
    }


    // end 자격증 자동 완성 부분
    
</script>
</body>
</html>