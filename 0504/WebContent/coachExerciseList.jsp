<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>GYM.zip</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/header.css"/>
    <link rel="stylesheet" href="/css/footer.css"/>
    <link rel="stylesheet" href="/css/coachExerciseList.css"/>

</head>
<body>
 
 <%@ include file="/WEB-INF/template/exRegister.jsp" %>


<div id="wrap">
<!--header include  --> 
<%@ include file="/WEB-INF/template/header.jsp" %>

    <div id="container">

        <div id="content">

            <!--코치 내 운동 목록-->
            <div class="tab">

                <!--searchAndSort-->
                <div id="searchAndSort">

                <!--lectureSearch -->
                <!-- <div id="exerciseSearch">
                    <div>
                        <input class="search_text" />
                        <button class="search_btn"><i class="fas fa-search"></i></button>
                    </div>
                </div>
                 -->

                <!--lectureSearch END-->

                <div id="registerMyEx">
                   <button>운동등록</button>
                </div>

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
                
                	
                   
                </div>
                <!--coachExerciseTab END-->

            </div>
            <!--내 운동 목록 END-->
        </div>
        <!-- content END -->
    </div>
    <!--container END-->
    
    <!-- footer include -->
<%@ include file="/WEB-INF/template/footer.jsp" %>
    
</div>
<!--wrap END-->


<script type="text/template" id="exerciseTmpl">
 

	
  <!-- exerciseList -->
                
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

        <!-- 공개여부-->
        <div class="open_toggle">
            <div>
                <label class="toggle" data-no=<@=exercise.exerciseNo@>>
                    <input type="checkbox" name="open" value="T" <@if(exercise.onOff == "T"){@> checked <@}@>>
                    	<span></span>
					</input>
                </label>
            </div>
        </div>
        <!-- end 공개여부-->
    </li>
    <@})@>
  </ul>
<!--exerciseList END-->    

 <div id="pagination"><@=paginate@></div>

</script>
<script src="/js/header.js"></script>
<script>




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
					
					$selectImg.attr("src","/img/exercise/"+json.imgFileName);
					
					$imgFile.addClass("non_display");
					$selectImg.css("display","inline-block");				
					$imgFileMsg.text("");
					$imgFileName.val(json.imgFileName);
				
				}
			});//$.ajax END
		
	});//img change() END
	
	
	
	//video input hidden 요소
	const $videoFileName = $("#videoFileName");
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
					console.log(json.videoFileName);
					console.log(json.result);
				
				}
			});//$.ajax END
		
	});//video change() END
	
	


    // 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    //강의템플릿
    const exerciseTmpl = _.template($("#exerciseTmpl").html());

    //코치운동목록(ul)
    const $coachExerciseTab = $("#coachExerciseTab");
    //코치운동목록을 페이징하기위한 변수
    let page =1;
    let memberNo = <%=loginMember.getNo()%>
    console.log(memberNo);
    
    //필터에 따라서 강의목록을 불러오는 함수
    function getExerciseList() {
    	
    	let sort=$("#sort option:selected").val();

    	let data ={
                "sort":sort,
                "page":page,
                "memberNo":memberNo
            }
        $.ajax({
            url:"/ajax/getExerciseList.json",
            data:data,
            type:"get",
            error:function() {
                alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
            },
            success:function (json) {
                $coachExerciseTab.html(exerciseTmpl(json));
            }
        });

    }//getExerciseList() end
    
    //코치운동목록 함수 호출
    getExerciseList();
    

    //select 목록 변경시
    $("#sort").on("change",function() {
    	//console.log("변경!")
        getExerciseList();
        
    });//  $("#sort").on(change) end
    
    $(document).on("click",'.open_toggle div span',function(){
    	
	    const no = this.dataset.no;
   	 	console.log(no);
        
       if($('input:checkbox[name="open"]').is(":checked")==true){
			    	   
    	   onOff = "F";
       }else{
    	   onOff = "T";
       }
       
       $.ajax({
           url:"/ajax/getOnOffUpdate.json",
           data:data,
           type:"get",
           error:function() {
               alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
           },
           success:function (json) {
               $coachExerciseTab.html(exerciseTmpl(json));
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

</script>
</body>
</html>