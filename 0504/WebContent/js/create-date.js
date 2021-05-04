    // id 가 year 요소를 받는 변수 
	const $year=$("#year");
	// id 가 month 인 요소를 받는 변수 
	const $month=$("#month");
	// id가 date인 요소를 받는 변수 
	const $date=$("#date");
	
	// 년과 월을 생성하는 함수 같이 만들기 안변하니까 
	function createYearMonth(){
		
		
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
		createDate();
	
		
	}//createYearMonth() end 
	
	
	
	
	// 날짜를 생성하는 함수  // 유저가 선택한 년도와 월을 가지고 해당하는 날짜를 생성하는 함수
	function createDate(){
		
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
	
	
	
	
	
	
	// 년을 바꿀 때마다 date 새로 생성
	$year.change(createDate);
	// 달을 바꿀떄마다 date새로 생성
	$month.on("change",createDate);
	
	
	
	
	
	// 한번만 호출
	createYearMonth();
	
	
