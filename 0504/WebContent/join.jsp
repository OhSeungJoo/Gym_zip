<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--20201220 작성
  작성자 : 오승주
  로그인 페이지를 작성 -->
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Gym.zip</title>
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/notosanskr.css">
  <link rel="stylesheet" href="css/footer.css">
    <style>

        body{
            font-family: "Noto Sans KR",sans-serif;
                
        }
        
        /*header 스타일*/
		 #header{
            width: 100%;
            height: 80px;
            background-color: #fff;
            box-shadow: 0 10px 10px rgba(0,0,0,0.15);
        }
		/*end header 스타일*/        
		
		.logo{
            margin-top: 20px;
            text-align:center;
        }
        .logo a{
            width: 50px;
            height: 50px;
            text-decoration: none;
            font-size: 25px;
            font-weight: bold;
            color: #f91b4e;
        }
        .logo img{
            width: 50px;
            height: 50px;
            vertical-align: middle;

        }

        .logo strong{
            vertical-align: middle;

        }
        

        /*container의 위치 정의*/
        #container{

            width: 660px;
           
			
			
            position : relative;
            /*수평 가운데 정렬*/
            left:50%;
            margin-left: -330px;

            /*    윗 부분 공간 주기*/
            margin-top: 50px;
            margin-bottom:200px;
        

        }
        /*.container style end*/

        /*회원가입 상단 텍스트 부분*/
        .title{
            background-color: rgb(249,27,78);
            color: #fff;

            width:640px;
            height:50px;

            padding-left: 20px;

            line-height: 50px;

            font-weight: 700;
            font-size: 30px;
        }
        /* .title end*/

        /* 회원가입 폼 */
        #join{
            margin:20px ;
        }
        /*#join end*/

        /*모든 div 요소 */
        #join div{
            margin-bottom: 25px;
        }
        /* #join div end*/


        /*모든 라벨 요소*/
        label{
            display: block;
            margin-bottom: 5px;

        }
        /* label end*/

        /*유효성 검사(p요소)*/
        #birth p, #nickName p, #email p, #password p, #confirmPassword p, #inputHeight p, #inputWeight p{
            font-size: 10px;
            /*모든 p 요소에 관하여 일단은 안보이게 해놓고 상황에 따라 문구가 나오게 한다.*/
            height:15px;
            color:#f00;
        }
        /* p end*/



        /* 이메일 중복 확인 버튼*/
        #email button{
            border: 1px solid #f91b4e;
            background-color: #fff;
            color: #f91b4e;

            margin-left: 15px;

            border-radius:35px;

            width: 100px;
            height:25px;

            font-family: "Noto Sans KR";
        }
        /* #email button end*/



        /*이메일로 인증하기 버튼*/
        #bottom button{
            width:660px;
            height:50px;

            color:#fff;
            background-color: rgb(249,27,78);

            border: none;

            font-family: "Noto Sans KR",sans-serif;
            font-weight: 500;


            margin:20px 0px 0px -20px;

        }
        /*#buttom button end*/




        /*남여 라디오*/
        #selectGender label{
            display: inline;
            margin-right: 30px;
        }
        /*#selectGender label end*/


        /*    width:300px;*/
        /*}*/

        /*모든 input 요소*/
        input{
            height:25px;
        }

        select{
            height:30px;
        }

        #birth #year{
            margin: 0;
        }

        /*성별을 제외한 모든 input 요소*/
        input{
            width:400px;
        }
        /*end 성별을 제외한 모든 input 요소*/

        #selectGender input{
            width: 10px;
        }
        
        
        /*키 몸무게 input*/
        #inputHeight input,#inputWeight input{
        	width:100px;
        	
        }
        /*end 키 몸무게 input*/


		
    </style>
</head>
<body>

<div id="wrap">

<div id="header">
 <h1 class="logo">
        <a href="/" ><img src="img/logo_coral.png"><strong> GYM.zip</strong></a>
    </h1>
    </div>

<div id="container">

    <!--회원가입 -->

   <h1 class="title"> 회원가입</h1>

<!--    -->

    <!-- 회원가입 폼 이메일, 비밀번호, 비밀번호 확인, 이름, 이메일, 생년월일 성별
    -->
    <form id="join" method="post" action="/join.do">

        <!--이메일 입력-->
        <div id="email">
            <label for="inputEmail">이메일</label>
            <input id="inputEmail" name="email" type="email">
            <button id="checkEmail" type="button">중복확인하기</button>
            <p id="emailMsg"></p>
        </div>
        <!--email end-->

        <!-- 비밀번호 입력-->
        <div id="password">
            <label for="password">비밀번호</label>
            <input id="inputPassword" name="password" type="password" >
            <p></p>
        </div>
        <!--password end-->

        <!-- 비밀번호 확인-->
        <div id="confirmPassword">
            <label for="inputConfirmPassword">비밀번호 확인</label>
            <input id="inputConfirmPassword" name="confirmPassword" type="password" >
            <p></p>
        </div>
        <!--confirmPassword end-->



        <!-- 닉네임 설정 -->
        <div id="nickName">
            <label for="inputNickName">닉네임</label>
            <input id="inputNickName" name="nickName" type="text" >
            <p> </p>
        </div>
        <!--nickName end-->

        <!--생년월일 입력-->
        <div id="birth">
            <label for="year">생년월일</label>
            <select  id="year" name="birthYear" ></select>년
            <select id="month" name="birthMonth" ></select>월
            <select id="date" name="birthDay" ></select>일

        </div>
        <!--birth end-->

        <!--성별 기입-->
        <div id="selectGender">
            <p>성별</p>
            <input value="M" type="radio" name="gender" id="male" checked ><label for="male">남</label>
            <input value="F" type="radio" name="gender" id="female" ><label for="female">여</label>
        </div>
        <!--selectGender end-->


 	<!--키 몸무게 입력-->
        <div id="inputHeight">
           
           키 <input  name="height" id="height" >cm
           <p id="heightMsg"></p>
         
        </div>
        <!--키 몸무게 입력 end -->
        <div id="inputWeight">
        
         	몸무게 <input name="weight" id="weight" >kg
         	 <p id="weightMsg"></p>
        </div>
       

        <!--하단부 버튼(메일로 인증하기)-->
        <div id="bottom">
            <button type="button" id="sendEmail">메일로 인증하기</button>
        </div>
        <!--bottom end-->

    </form>
    <!--join form end-->

</div>
<!-- container end -->
<script src="js/jquery.js"></script>
<%@ include file="/WEB-INF/template/footer.jsp" %>
</div>
<!-- wrap end  -->
	

<script src="js/moment-with-locales.js"></script>
<script src="js/create-date.js"></script>
<script>


	// 모든 중복 및 유효성을 통과한 것들만 회원가입이 되도록 한다. 
	let emailCheck=false;
	let passwordCheck=false;
	let confirmpasswordCheck=false;
	let nicknameCheck=false;
	let heightCheck=false;
	let weightCheck=false;
	
	//=============================================



	// 이메일 중복 검사
	const $checkEmailBtn=$("#checkEmail");
	// 이메일 중복 검사 경고 문구
	const $emailMsg=$("#emailMsg");

	
	// 이메일 유효성 검사 
	const emailExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;


	
	// 이메일 중복 검사 버튼을 눌렀을 때 
	$checkEmailBtn.on("click",function(e){
		
	
		// 유효성 검사 부터 해준다. 
		const email=$("#inputEmail").val();
		
		
		if(emailExp.test(email)){
			$.ajax({
				url:"/ajax/checkEmail.json",
				type:"get", // 방식
	 			data:{email:email}, // 파라미터 
	 			dataType:"json", // 응답의 형태 
	 			error:function(xhr,error){
	 				// 이런걸 콜백 함수라고 합니다. 
	 				alert("서버 점검 중 ");
	 				console.log(error);
	 			},
	 			success:function(json){
	 				
	 				console.log(json);
	 				
	 				
	 				if(json.result){
	 					$emailMsg.text("이미 사용중이거나 탈퇴 함 ");
	 					emailCheck=false;
	
	 				}else{

	 					$emailMsg.text("아주 좋은 이메일 이네요");		
	 					
	 					emailCheck=true;

	 				}// if~else end 
	 			
	 			}
			})// ajax end 
		}
		else{
			$emailMsg.text("이메일을 제대로 입력해주세요");		
		}//if~else end 
		
		
		
		
		
		
		
		
		 e.preventDefault();
	});
	// end 이메일 중복검사




	
	
	
	
	

    // 유효성 검사
    // 비밀번호 유효성
    // input요소
    const $inputPassword=$("#password #inputPassword");
    // 비밀번호의 유효값을 나타내는 정규표현식 (영문, 숫자, 특수문자 8~12)
    const passwordExp=/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,12}$/;
    // 비밀번호의 유효성 경고 문구
    const $passwordMsg=$("#password p");


    $inputPassword.on("keyup",function () {
        const val=$inputPassword.val();

        // 유효성 검사
        if(passwordExp.test(val)){
            $passwordMsg.text("좋은 비밀번호 입니다.");
            
            
            
            passwordCheck=true;
          
            
            
        }
        else{
        	
           $passwordMsg.text("비밀번호는 영문, 숫자, 특수문자를 포함하여 8~12자 여야 합니다.");
        
           passwordCheck=false;
         
        
        }
    })
    // end 비밀번호 유효성

    // 비밀번호 확인 유효성
    // 비밀번호 확인의 input 요소
    const $confirmPassword=$("#confirmPassword #inputConfirmPassword");
    // 비밀번호 확인 유효성 경고 문구
    const $confirmPwMsg=$("#confirmPassword p");


    // 키누를 떄마다 입력한 비밀번호와 일치하는지 확인
    $confirmPassword.on("keyup",function () {

      // 일치하면
        if($confirmPassword.val()==$inputPassword.val()){
            $confirmPwMsg.text(" ");
          
            
            confirmpasswordCheck=true;
            
           
            
        }
        else{
        	
            $confirmPwMsg.text("비밀번호가 일치하지 않습니다.");
            
 			confirmpasswordCheck=false;
            
           
        }

    });

    // end 비밀번호 확인 유효성

    // 닉네임 유효성 검사
    // 닉네임 인풋 요소
    const $nickname=$("#nickName #inputNickName");
    // 닉네임 유효값을 나타내는 정규 표현식
    const nicknameExp=/^[ㄱ-힣|\w]{1,10}$/;
    // end 유효성 검사

   
    
    
    
    
    $nickname.on("keyup",function () {

        // 닉네임 인풋요소에 입력한 값
        const ninknameVal=$nickname.val();

       // 조건이 맞으면
       if(nicknameExp.test(ninknameVal)){
           $("#nickName p").text("");
           nicknameCheck=true;
          
          
       }
       else{
           $("#nickName p").text("닉네임은 영문, 한글, 숫자를 포함하여 1자 부터 10자까지 입니다.");
       
           nicknameCheck=false;
           
       }
    });

    // end 닉네임 유효성 검사
  
    
    const $height=$("#height");
    const $weight=$("#weight");
    
  	const $heightMsg=$("#heightMsg");
  	const $weightMsg=$("#weightMsg");
  
    
    // 키 정규 표현식
    const heightExp=/^([1-9]{1})([0-9]{1,2})$/;
  
    
    // 키입력 -> 제대로 입력시 몸무게 입력 가능 
    $height.on("keyup",function(){
    	
    	  const heightVal=$height.val();
    	 
    	if(heightExp.test(heightVal)){
    		// 정규 표현식과 사용자가 입력한 키의 값이 맞으면 몸무게를 입력할 수 있도록 한다. 
    	
    		 heightCheck=true;
    		
    		$heightMsg.text("");
    		
    	}
    	else{
    		
    		$heightMsg.text("제대로된 값을 입력해주세요");
    		
    		heightCheck=false;
    	}
    	
    });
    // end 키 입력 -> 제대로 입력시 몸무게 입력 가능 
    
    
    const weightExp=/^([1-9]{1})([0-9]{1,2})$/;
  
    
    // 메일로 인증하기 버튼
    const $sendEmail=$("#sendEmail");
    
    // 몸무게 입력시 
    $weight.on("keyup",function(){
    	 const weightVal=$weight.val();
    	 
     	if(weightExp.test(weightVal)){
     		// 정규 표현식과 사용자가 입력한 몸무게가 들어맞으면 메일로 인증하기 버튼을 누를 수 있도록 한다. 
     	
     		weightCheck=true;
     		
     		$weightMsg.text("");
     	}
     	else{
     		weightCheck=false;
     		
     		$weightMsg.text("제대로 된 값을 입력해주세요");
     	}
     	
     	
    });
    // end 몸무게 입력 
 
    

    const $sendEmailBtn=$("#sendEmail");
    
    // 이메일로 인증하기 버튼 
    $sendEmailBtn.on("click",function(){
    	
    	
    	
    	
    	if(emailCheck==true&&passwordCheck==true&&confirmpasswordCheck==true&&
    			nicknameCheck==true&&heightCheck==true&&weightCheck==true){
    		$sendEmailBtn.attr("type","submit");
    	}
    	else{
    		alert("누락되거나 잘못된 정보가 없는지 다시 확인하세요");
    	}
    	
    })
</script>
</body>
</html>