<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no;
	 try{
			Member loginMember = (Member)session.getAttribute("loginMember");
			no = loginMember.getNo();
	 } catch(Exception e){
		no=-1; 
	 }	 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>lectureRegisterForm</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/all.min.css"/>
    <link rel="stylesheet" href="css/lectureInfo.css"/>
    <link rel="stylesheet" href="css/lectureCurriculum.css"/>
    <link rel="stylesheet" href="css/notosanskr.css">
    <link rel="stylesheet" href="css/header.css"/>
    <link rel="stylesheet" href="css/footer.css"/>
    <style>
        #container {
            width: 1100px;
            margin: auto;
            /*background-color: #bbbbbb;*/
        }
        #registerTabBox{
            width: 800px;
            height: 150px;
            margin: auto;
            /*background-color: #00969b;*/
        }
        #registerTabList{
            position : absolute;
            overflow: hidden;
            text-align: center;
        }
        /*단 CSS*/
        .bar {
            overflow: hidden;
        }
        /*단 수평블록 설정*/
        .bar_contents{
            float:left;
        }
        .deco_bar{
            width: 700px;
            height:150px;
            margin: auto;
            /*background-color: blue;*/
        }
        .deco{
            width: 350px;
            height: 5px;
            margin-top: 47px;
            background-color: black;
        }
        .registerTab{
            float:left;
            /*background-color: #F91B4E;*/
        }
        .registerTabBtn{
            width: 60px;
            height: 60px;
            margin: 20px;
            background-color: black;
            border-radius: 50px;
            position: relative;
            cursor: pointer;
        }
        .highlight{
            width:40px;
            height:40px;
            line-height: 40px;
            background-color: black;
            border-radius: 20px;
            font-size: 20px;
            color: white;
            position: absolute;
            top:50%;
            left:50%;
            margin: -20px 0 0 -20px;
        }
        .activate .highlight{
            font-size: 30px;
            background-color: #F91B4E;
        }
        #lectureInfoTab,#curriculumTab{
            margin-right: 250px;
        }
    /*                       //////////////////////////////////////                                    */
        #viewBox{
            /*width:800px;*/
            /*height: 600px;*/
            /*margin:auto;*/
            /*background-color: blanchedalmond;*/
        }
        #formbox{
            height: 680px;
            /*background-color: aqua;*/
        }
        /*//////////////////////////////////////////////////////////////////////////////////////*/
        /*//////////////////////////////////////////////////////////////////////////////////////////*/
        /*//////////////////////////////////////////////////////////////////////////////////////*/
        /*/////////////////////////////////////////////////////////////////////////////////////////////////////*/
        .step1 #lectureInfo {display: block;}
        .step1 #curriculum {display: none;}
        .step1 #advertiseImage {display: none;}
        .step2 #lectureInfo {display: none;}
        .step2 #curriculum {display: block;}
        .step2 #advertiseImage {display: none;}
        .step3 #lectureInfo {display: none;}
        .step3 #curriculum {display: none;}
        .step3 #advertiseImage {display: block;}
        .hidden_btn{display:none}
        #prev_next_save{
            width: 600px;
            /*position: relative;*/
            margin: 10px 0 10px 700px;
        }
        #prev_next_save button{
            width: 118px;
            height: 28px;
            line-height: 30px;
            font-size: 18px;
            color: #242424;
            background-color: white;
            border: 1px solid #424242;
            border-radius: 15px;
            outline:none;
            cursor: pointer;
        }
        #prev_next_save button:hover{
            border: 1px solid #F91B4E;
            color: #F91B4E;
        }
        #prev_next_save .disable{
            border: 1px solid #cccccc;
            color: #cccccc;
        }
        #prev_next_save .disable:hover{
            border: 1px solid #cccccc;
            color: #cccccc;
        }
    /*    ////////////////////////////////////////////////////////////////////////////////////////////////////*/
        #advertiseImage{
            width: 900px;
            height: 700px;
            margin: auto;
            /*background-color: #00969b;*/
        }
        #thumbnailBox{
            width: 800px;
            height: 230px;
            /*background-color: #F91B4E;*/
        }

        #advertiseImagesBox>div{
            border: 1px solid #424242;
            width: 840px;
            height: 348px;
            margin:auto;
        }
        #advertiseImagesBox ul{
            width: 750px;
            height: 300px;
            margin: 10px auto;
        }

        #thumbnailBox p, #advertiseImagesBox p{
            font-size: 20px;
            font-weight: bold;
            margin-left: -20px;
            margin-bottom: 10px;
        }
        #thumbnailInput,#imageInput{
            display: none;
        }
        #thumbnailBtn{
            width: 270px;
            height: 180px;
            background-image: url(/img/plusImg.png);
            background-size: 100%;
        }
        #advertiseImageList{
            width: 800px;
        }

        #advertiseImageList li{
            width: 140px;
            height: 140px;
            margin: 5px;
            float: left;
            background-size:cover;
        }
        #imageBtn{
            background-image: url(/img/square.png);
            background-size: cover;
        }
        #imageLength{
            font-size: 24px;
            font-weight: bold;
            margin-right: 20px;
            float:right;
        }
        #energyRegister{
            width: 360px;
            float: right;
            /*background-color: blue;*/
            text-align: center;
        }
        #energyRegister div{
            height: 30px;
            line-height: 30px;
            /*background-color: #888888;*/
            margin-top:20px;
        }
        #energyRegister div:nth-child(1){
            width: 100px;
            font-size: 20px;
            font-weight: bold;
        }
        #energyRegister div:nth-child(2){
            width: 30px;
            background-size: 100%;
            background-image: url("img/energy.png");
            margin-right: 30px;
        }
        #energyRegister div:nth-child(3){
            width: 200px;
            height: 60px;
            line-height: 30px;
            text-align: left;
        }
        #energyRegister div:nth-child(3) input{
            outline: none;
        }
        #energyRegister div:nth-child(3) p{
            font-size: 10px;
            color:red;
            line-height: 10px;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div id="container">
    <div id="registerTabBox">
        <div id="registerTabList">
            <div id="lectureInfoTab" class="registerTab">
                <div class="registerTabBtn activate"><div class="highlight">1</div></div>
                <div>강의 정보입력</div>
            </div>
            <div id="curriculumTab" class="registerTab">
                <div class="registerTabBtn"><div class="highlight">2</div></div>
                <div>커리큘럼</div>
            </div>
            <div id="advertiseImageTab" class="registerTab">
                <div class="registerTabBtn"><div class="highlight">3</div></div>
                <div>홍보사진/썸네일</div>
            </div>
        </div>
        <div class="deco_bar bar">
            <div class="deco bar_contents"></div>
            <div class="deco bar_contents"></div>
        </div>
    </div>
    <div id="viewBox">
        <form action="/lectureRegister.jsp" method="post"  onsubmit='return check();'>
            <div id="formbox" class="step1">
                <div id="lectureInfo">
                    <div class="bar name_bar">
                        <div class="inputTitle bar_contents">강의명</div>
                        <div class="bar_contents">
                            <p class="value_check">0/18</p>
                            <input id="lectureNameInput" name="name" placeholder="내용을 입력해 주세요" maxlength="18"/>
                            <p class="value_check_msg">한글, 숫자, 영어로 구성하여 1~18 글자 사이로 입력해 주세요</p>
                        </div>
                    </div>
                    <div class="bar">
                        <div class="inputTitle bar_contents">기 간</div>
                        <div class="bar_contents">
                            <input id="day7" type="radio" name="due" value="7" checked/>
                            <label for="day7" class="due">7일</label>
                            <input id="day30" type="radio" name="due" value="30" />
                            <label for="day30" class="due">30일</label>
                            <input id="day90" type="radio" name="due" value="90" />
                            <label for="day90" class="due">90일</label>
                            <input id="day365" type="radio" name="due" value="365"/>
                            <label for="day365" class="due">365일</label>
                            <input id="allLife" type="radio" name="due" value="99999" />
                            <label for="allLife" class="due">평생소장</label>
                        </div>
                    </div>
                    <div class="bar">
                        <div class="inputTitle bar_contents">성 별</div>
                        <div class="bar_contents">
                            <input id="male" type="radio" name="gender" value="M" />
                            <label for="male" class="gender">남성</label>
                            <input id="female" type="radio" name="gender" value="F" />
                            <label for="female" class="gender">여성</label>
                            <input id="middle" type="radio" name="gender" value="A" checked/>
                            <label for="middle" class="gender">공용</label>
                        </div>
                    </div>
                    <div class="bar">
                        <div class="inputTitle bar_contents">난이도</div>
                        <div class="bar_contents">
                            <input id="level1" type="radio" name="level" value="초급" checked />
                            <label for="level1" class="level">초급</label>
                            <input id="level2" type="radio" name="level" value="중급" />
                            <label for="level2" class="level">중급</label>
                            <input id="level3" type="radio" name="level" value="고급" />
                            <label for="level3" class="level">고급</label>
                        </div>
                    </div>
                    <div>
                        <div class="inputTitle">강의 소개 작성</div>
                        <div class="inputSubTitle">어떤수업인가요</div>
                        <div class="input_text_box">
                            <p class="value_check">0/400</p>
                            <textarea id="lectureInfoText" name="lectureInfoText" maxlength="400" placeholder="내용을 입력해주세요" ></textarea>
                            <p class="value_check_msg">1글자에서 400글자 사이로 입력해 주세요</p>
                        </div>
                        <div class="inputSubTitle" >이런 분들이 들으면 좋아요</div>
                        <div class="input_text_box">
                            <p class="value_check">0/100</p>
                            <textarea id="targetText" name="targetText" maxlength="100" placeholder="내용을 입력해주세요" ></textarea>
                            <p class="value_check_msg">1글자에서 100글자 사이로 입력해 주세요</p>
                        </div>
                    </div>
                </div><!--#lectureInfo end-->
                <div id="curriculum" class="bar">
                    <div id="exerciseSearchView" class="bar_contents">
                       <div id="searchTab" class="bar">
                           <select id="exercisePart">
                               <option value="0" selected>전체</option>
                               <option value="7" >전신</option>
                               <option value="4">어깨</option>
                               <option value="2">가슴</option>
                               <option value="5">팔</option>
                               <option value="6">복부</option>
                               <option value="3" >등</option>
                               <option value="1">하체</option>
                           </select><!--검색 부위 필터 end-->
                       </div>
                        <ul id="exerciseCardList" class="bar">

                        </ul><!--cardList End-->
                        <div id="exerciseSearchBar">
                            <a href="https://www.google.com/" target="_blank">운동추가</a>
                        </div><!--#searchBar end-->
                    </div><!--#exerciseSearchView end-->
                    <div id="curriculumSet" class="bar_contents">
                        <input type="hidden" name="curriculumList" id="curriculumArray" value=""/>
                        <div id="curriculumSetExplain" >강의순서조정</div>
                        <ul id="itemList">
                        </ul>
                        <input type="hidden" name="time" id="lectureTime" >
                        <div id="totalLectureTime">
                            00:00:00
                        </div>
                    </div>
                </div><!--#curriculum end-->
                <div id="advertiseImage">
                    <div id="thumbnailBox">
                        <p>강의 썸네일 등록</p>
                        <input type="hidden" id="thumbnailUrl" name="thumbnailUrl">
                        <input type="file" id="thumbnailInput" name="thumbnail">
                        <div id="thumbnailBtn"></div>
                    </div><!--#thumbnailBox end-->
                    <div id="advertiseImagesBox">
                        <p>강의 홍보 사진 등록</p>
                        <input type="hidden" id="advertiseImageArray" name="advertiseImage">
                        <input type="file" id="imageInput" name="advertiseImages">
                        <div>
                            <ul id="advertiseImageList">
                                <li id="imageBtn"></li>
                            </ul>
                            <div id="imageLength">0/10</div>
                        </div>
                    </div><!--#advertiseImagesBox end-->
                    <div id="energyRegister" class="bar">
                       <div class="bar_contents">
                           에너지
                       </div>
                        <div class="bar_contents"></div>
                        <div class="bar_contents">
                            <input name="energyprice" id="energyPrice">
                            <p class="value_check_msg">숫자만 입력해 주세요</p>
                        </div>
                    </div>
                </div><!--#advertiseImage end-->
            </div><!--#formbox end-->
            <div id="prev_next_save" >
                <button id="page_prev" type="button">이 전</button>
                <button id="page_next" type="button">다 음</button>
                <button id="page_register" class="hidden_btn" type="submit">등 록</button>
            </div>
        </form><!--form end-->
    </div><!--#viewbox end-->

</div>
 <%@ include file="/WEB-INF/template/footer.jsp" %>
<script type="text/template" id="cardTmpl">
    <li class="exercise_card bar_contents">
        <img src="<@=item.thumbnail@>" width="150px" height="100px">
		<@ if(item.viewCount>9) { @>
        <div class="first_bar bar">
            <div class="bar_contents"><@=item.avgKcal@>kcal</div>
            <div class="bar_contents"><@=item.levels@></div>
        </div>
		<@ } else{ @>
		<div class="first_bar bar">
            <div class="bar_contents"><@=((item.manKcal+item.womanKcal)/2).toFixed(1) @>kcal</div>
            <div class="bar_contents"><@=item.levels@></div>
        </div>
		<@ } @>
        <div class="second_bar" data-code="<@=item.no@>" data-time="<@=item.exerciseTime@>" data-part="<@=item.part@>"><@=item.name@></div>
        <div class="addBtn">
            <i class="fas fa-plus"></i>
        </div>
    </li><!--card End-->

</script>
<script type="text/template" id="itemTmpl">
    <li class="item">
       <div>
           <div class="item_info">
               <img src="<@=item.image@>" width="150px" height="100px">
               <div class="first_bar bar">
                   <div class="bar_contents"><@=item.calorie@>kcal</div>
                   <div class="bar_contents"><@=item.level@></div>
               </div>
               <div class="second_bar" data-code="<@=item.code@>" data-part="<@=item.part@>"><@=item.title@></div>
           </div>
           <div class="area">
               <div class="time">
                   <@=item.time@>
               </div><!--
        --><div class="up_down_btn_box">
               <div class="up_btn"><i class="fas fa-angle-double-up"></i></div>
               <div class="down_btn"><i class="fas fa-angle-double-down"></i></div>
           </div>
           </div>
       </div>
      <div class="delete_item_btn">
          <i class="fas fa-times"></i>
      </div>
    </li>
</script>
<script src="js/jquery.js"></script>
<script src="/js/header.js"></script>
<script src="js/underscore-min.js"></script>
<script>
	//초 string
	let sec='00';
	//분 String
	let min='00';
	// 시 String
	let hour='00';
	// 초 기준 시간 합계
	let total=0;
	// 현재 총 시간을 문자열로 출력 해주는 함수
	function numberFormat(){
		tmptotal = total;
		tmpHour= parseInt(tmptotal/3600);
		tmptotal-=tmpHour*3600;
		tmpMin= parseInt(tmptotal/60);
		tmpSec=tmptotal-tmpMin*60;
		sec=('00'+tmpSec).slice(-2);
		min=('00'+tmpMin).slice(-2);
		if(tmpHour>10){
			hour=''+tmpHour;
		}else{
			hour+'0'+tmpHour;
		}
	}
	//시간문자열을 초로 바꿔주는 함수 
	function getSec(str){
		//alert(str);
		if(str!=null){
			let array=str.split(':');
			let tmpSec = parseInt(array[2]);
			let tmpMin = parseInt(array[1]) *60;
			let tmpHour = parseInt(array[0])*3600;
			//alert(tmpSec+tmpMin+tmpHour)
			return tmpSec+tmpMin+tmpHour;
		} else {
			return 0;
		}
	}
	$("#footer").removeClass("fixed");
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    // // _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    //
    // //운동항목템플릿
    let idx=1;//스탭 인덱스
    btnControl();
    const itemTmpl = _.template($("#itemTmpl").html());
    const itemList = $("#itemList");
    const cardTmpl=_.template($("#cardTmpl").html());
    const cardList=$('#exerciseCardList');
    let $curriculumList=[];
    let $advertiseImages=[];
    let $searchKeyward;
    let $exersizePart;
    let selectData;
    const $lectureNameInput=$('#lectureNameInput');
    const $lectureInfoText = $('#lectureInfoText');
    const $targetText = $('#targetText');
    const $curriculumArray = $('#curriculumArray');
    const $thumbnailUrl=$('#thumbnailUrl');
    const $advertiseImageArray = $('#advertiseImageArray');
    const $energyPrice = $('#energyPrice');
    const $lectureTime=$('#lectureTime');
    //처음 카드 호출
    exerciseListUpdate();
    
    //폼으로 넘길때 유효성 검사
    function check() {
        //커리큘럼 정보 form에 담기
        $curriculumArray.val($curriculumList);
        //강의 시간 form에 담기
        $lectureTime.val(total);
        alert($lectureTime.val());
        //홍보이미지 정보 form에 담기
        $advertiseImageArray.val($advertiseImages);
        const $lectureNameExp= /^[ㄱ-힣|/w]{1,}$/;
        const $lectureEnergyExp= /^[1-9][0-9]{1,6}$/;
        //공백 제거해서 유효성 검사
        let rmSpaceName = $lectureNameInput.val().replace(/(\s*)/g, "") ;
        let nameCheckResult= $lectureNameExp.test(rmSpaceName);
        
        if(!nameCheckResult){
            idx=1;
            $lectureNameInput.next().css('visibility', 'visible');
            btnControl();
            changeBox();
            alert("강의 이름을 입력해주세요!");
            $lectureNameInput.val('');
            $lectureNameInput.focus();
            return false;
        }else if($lectureInfoText.val().trim().length==0){
            idx=1;
            $lectureInfoText.next().css('visibility', 'visible');
            btnControl();
            changeBox();
            alert("어떤 수업인지 설명해주세요!");
            //$lectureInfoText.val('');
            $lectureInfoText.focus();
            return false;
        }else if( $targetText.val().trim().length==0){
            idx=1;
            $targetText.next().css('visibility', 'visible');
            btnControl();
            changeBox();
            alert("어떤 분들을 위힌 강의인지 설명해주세요!");
            //$targetText.val('');
            $targetText.focus();
            return false;
        }else if($curriculumList.length ==0){
            idx=2;
            //$targetText.next().css('visibility', 'visible');
            btnControl();
            changeBox();
            alert("커리큘럼이 비었습니다. 운동을 넣어주세요");
            //$targetText.focus();
            return false;
        }else if($thumbnailUrl.val().trim().length==0){
            idx=3;
            btnControl();
            changeBox();
            alert("썸네일 사진이 없습니다. 사진을 등록해주세요");
            return false;
        }else if($advertiseImages.length == 0){
            idx=3;
            btnControl();
            changeBox();
            alert("홍보 사진이 없습니다. 사진을 등록해주세요");
            return false;
        }else if(!$lectureEnergyExp.test($energyPrice.val())){
            idx=3;
            btnControl();
            changeBox();
            alert("에너지를 입력해 주세요.");
            $energyPrice.val('');
            $energyPrice.focus();
            return false;
        }else{
        	$("#imageInput").attr("disabled","disabled");
        	$("#thumbnailInput").attr("disabled","disabled");
            return true;
        }
    }
    // 위의 표기와 스탭을 바꾸는 함수
    function changeBox(){
        $('#formbox').attr("class","step"+idx);
        $(".activate").removeClass("activate");
        $('#registerTabList>div:nth-child('+idx+')').addClass("activate");
    }

    function exerciseListUpdate() {
        let $coachNo = <%=no%>;
        let $exersizePart = $('#exercisePart').val();
        console.log($coachNo);
        console.log($exersizePart); 
        selectData={
            "coachNo" : $coachNo,
            "exersizePart": $exersizePart
        };
        $.ajax({
            url:"/getMyExerciseItem.json",
            data : selectData,
            type : 'GET',
            dataType : "json",
            error : function(xhr, error, code) {
                console.log("ajax에러");
            },
            success:function(json) {
                console.log(json);
                cardList.empty();
                $.each(json,function (index,item) {
                    cardList.append(cardTmpl({item : item}));
                })
            }
        });
    }

    $('#exercisePart').on("change",function () {
    	console.log("nbbvbvandv;ladsflka");
        exerciseListUpdate();
    })



    $("#thumbnailInput").on("change",function() {
        const file = this.files[0];
        console.log("클릭");
        console.log(file);
        //image/ 로 시작하는
        if (/^image\//.test(file.type)) {
            //alert("여기에 오면 파일이 있고 사진임");
            //multipart/form-data에 필요함
            console.log("이미지 정규화 후");
            const formData = new FormData();
            formData.append("uploadImg", file, file.name);
            formData.append("type", "B");//B는 board의 줄임말
            //여기서 ajax로 파일 업로드 수행
            $.ajax({
                url:"/uploadThumbnail.json",
                processData : false,//multipart/form-data
                contentType : false,//multipart/form-data
                data : formData,//multipart/form-data
                type : 'POST',//multipart/form-data
                dataType : "json",
                error : function(xhr, error, code) {
                    console.log("ajax에러");
                },
                success:function(json) {
                    console.log(json);
                    $('#thumbnailBtn').css("backgroundImage","url(/img/thumbnail/"+json.url+")");
                    $thumbnailUrl.val(json.url);
                }
            });
        } else {
            alert("이미지를 선택해주세요!");
        }
    })
    $('#thumbnailBtn').on("click",function () {
        $('#thumbnailInput').click();
    });

    $("#imageInput").on("change",function() {
        const file = this.files[0];
        console.log(file);
        //image/ 로 시작하는
        if (/^image\//.test(file.type)) {
            //alert("여기에 오면 파일이 있고 사진임");
            //multipart/form-data에 필요함
            const formData = new FormData();
            formData.append("uploadImg", file, file.name);
            formData.append("type", "B");//B는 board의 줄임말
            //여기서 ajax로 파일 업로드 수행
            $.ajax({
                url:"/uploadAdvertisePhoto.json",
                processData : false,//multipart/form-data
                contentType : false,//multipart/form-data
                data : formData,//multipart/form-data
                type : 'POST',//multipart/form-data
                dataType : "json",
                error : function(xhr, error, code) {
                    alert("에러:" + code);
                },
                success:function(json) {
                    console.log(json.url);
                    let newLi = $('<li>').css("backgroundImage","url(\"/img/advertise/"+json.url+"\")").addClass("deleteAble");
                    $advertiseImages.push(json.url)
                    $('#imageBtn').before(newLi);
                    //이미지 개수
                    imgCount();
                }
            });
        } else {
            alert("이미지를 선택해주세요!");
        }
    })
    $('#imageBtn').on("click",function () {
        $('#imageInput').click();
    });
    function imgCount(){
        let count=$('#advertiseImageList li').length;
        count-=1;
        if( count>=10){
            $('#imageBtn').css('display','none');
        }else{
            $('#imageBtn').css('display','block');
        }
        $('#imageLength').text(count+"/10");
    }
    //강의 정보 입력(스탭1) 입력 길이 표기및 제한, 알림 메시지 해제
    $(document).on('keyup', '#lectureInfoText', function(e){
        $(this).parent().children(".value_check_msg").css('visibility', 'hidden');
        var textarea01 = $(this).val();
        if(textarea01.length<=100){
            $(this).parent().find('.value_check').text(textarea01.length+"/400");
        }else{
            $(this).val(textarea01.splice(0,400));
        }
    });
    $(document).on('keyup', '#targetText', function(e){
        $(this).parent().children(".value_check_msg").css('visibility', 'hidden');
        var textarea01 = $(this).val();
        if(textarea01.length<=100){
            $(this).parent().find('.value_check').text(textarea01.length+"/100");
        }else{
            $(this).val(textarea01.splice(0,100));
        }
    });
    $(document).on('keyup', '#lectureNameInput', function(e){
        $(this).parent().children(".value_check_msg").css('visibility', 'hidden');
        var textarea01 = $(this).val();
        if(textarea01.length<=18){
            $(this).parent().find('.value_check').text(textarea01.length+"/18");
        }else{
            $(this).val(textarea01.splice(0,18));
        }
    });
    ///////////////////////


    $(document).on("click",'.deleteAble',function () {
        $advertiseImages.splice($(this).index(),1);
        console.log($advertiseImages);
        $(this).remove();
        imgCount();
    });
    $(document).on("click",'.exercise_card',function (){
        let image=$(this).children('img').attr("src");
        let calorie = $(this).find('.first_bar').children('div:eq(0)').text().split('kcal',1);
        //calorie=parseFloat(calorie);//String to number 변환
        let level = $(this).find('.first_bar').children('div:eq(1)').text();
        let title=$(this).find('.second_bar').text();
        let code = $(this).find('.second_bar').data("code");
        let time = $(this).find('.second_bar').data("time");
        let part = $(this).find('.second_bar').data("part");
        let item={
            image: image,
            calorie: calorie,
            level: level,
            title: title,
            code: code,
            time: time,
            part: part
        }
        console.log(item);
        itemList.append(itemTmpl({item : item}));
        $curriculumList.push(code);
        total+=getSec(time);
        numberFormat();
        $("#totalLectureTime").text(hour+":"+min+":"+sec);
    });

    $(document).on("mouseenter",'.exercise_card',function () {
        $(this).children(".addBtn").css("display","block");
    });
    $(document).on("mouseleave",'.exercise_card',function () {
        $(this).children(".addBtn").css("display","none");
    });
    $(document).on("mouseenter",'.item',function () {
        $(this).children(".delete_item_btn").css("display","block");
    });
    $(document).on("mouseleave",'.item',function () {
        $(this).children(".delete_item_btn").css("display","none");
    });
    $(document).on("click",".delete_item_btn",function () {
        if(confirm("삭제하시겟습니까?")) {
            $itemindex=$(this).parents(".item").index();
            //alert($itemindex);
            $(this).parents('li').remove();
            $curriculumList.splice($itemindex,1);
            let eTime = $(this).parents(".item").find(".time").text();
            total -= getSec(eTime);
            numberFormat();
            $("#totalLectureTime").text(hour+":"+min+":"+sec);
            
        }else{
            alert("아니요");
        }
    })

    $(document).on("click",".up_btn",function () {
        let $cur=$(this).parents('.item')
        $itemindex=$(this).parents('.item').index();
        if($itemindex>0){
            let tmp = $curriculumList[$itemindex];
            $curriculumList[$itemindex]=$curriculumList[$itemindex-1];
            $curriculumList[$itemindex-1]=tmp;
            let $prev=$cur.prev();
            $cur.insertBefore($prev);
            console.log($curriculumList);
        }
    })
    $(document).on("click",".down_btn",function () {
        let $cur=$(this).parents('.item')
        $itemindex=$(this).parents('.item').index();
        if($itemindex<($curriculumList.length-1)){
            let tmp = $curriculumList[$itemindex];
            $curriculumList[$itemindex]=$curriculumList[$itemindex+1];
            $curriculumList[$itemindex+1]=tmp;
            let $next=$cur.next();
            $cur.insertAfter($next);
            console.log($curriculumList);
        }

    })
    function btnControl(){
        if(idx==1){
            $('#page_prev').attr('disabled', 'disabled');
            $('#page_prev').addClass('disable');
            $('#page_next').removeClass('hidden_btn');
            $('#page_register').addClass('hidden_btn');
        }else if(idx==2){
            $('#page_prev').attr('disabled', false);
            $('#page_prev').removeClass('disable');
            $('#page_next').removeClass('hidden_btn');
            $('#page_register').addClass('hidden_btn');
        }else{
            $('#page_prev').attr('disabled', false);
            $('#page_prev').removeClass('disable');
            $('#page_next').addClass('hidden_btn');
            $('#page_register').removeClass('hidden_btn');
        }
    }

    $('#registerTabList>div').click(function (){
        idx = $(this).index() + 1;
        btnControl();
        $('#formbox').attr("class","step"+idx);
        $(".activate").removeClass("activate");
        $(this).addClass("activate");
    });
    $('#page_prev').on("click",function () {
        idx-=1;
        btnControl();
        changeBox()
    });
    $('#page_next').on("click",function () {
        idx+=1;
        btnControl();
        changeBox();
    });



    //스크롤 기준 고정 탭
    $( document ).ready( function() {

        var headerOffset = $('#header').offset();
        $(window).scroll( function() {
            if($( document ).scrollTop() > headerOffset.top){
                $('#header').addClass('header_fix ed');
            }else{
                $('#header').removeClass('header_fixed');
            }
        });
    } );
</script>
</body>
</html>