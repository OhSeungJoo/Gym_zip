<%@page import="com.joa.sht.gym_zip.dao.MemberDAO"%>
<%@page import="com.joa.sht.gym_zip.vo.ExRecord"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id='calendar'></div>
<!-- 시간설정 창 -->
<div id="timeSelectArea">

    <div class="time_select">
        <div class="click_day">선택한 날짜입니다.</div>
        <div class="dl_area">
            <dl>
            <dt>오전</dt>
            <dd><input type="checkbox" id="chk"><label for="chk">00:00</label></dd>
            <dd><input type="checkbox" id="chk1"><label for="chk1">01:00</label></dd>
            <dd><input type="checkbox" id="chk2"><label for="chk2">02:00</label></dd>
            <dd><input type="checkbox" id="chk3"><label for="chk3">03:00</label></dd>
            <dd><input type="checkbox" id="chk4"><label for="chk4">04:00</label></dd>
            <dd><input type="checkbox" id="chk5"><label for="chk5">05:00</label></dd>
            <dd><input type="checkbox" id="chk6"><label for="chk6">06:00</label></dd>
            <dd><input type="checkbox" id="chk7"><label for="chk7">07:00</label></dd>
            <dd><input type="checkbox" id="chk8"><label for="chk8">08:00</label></dd>
            <dd><input type="checkbox" id="chk9"><label for="chk9">09:00</label></dd>
            <dd><input type="checkbox" id="chk10"><label for="chk10">10:00</label></dd>
            <dd><input type="checkbox" id="chk11"><label for="chk11">11:00</label></dd>
        </dl>
            <dl>
            <dt>오후</dt>
            <dd><input type="checkbox" id="chk12"><label for="chk12">12:00</label></dd>
            <dd><input type="checkbox" id="chk13"><label for="chk13">13:00</label></dd>
            <dd><input type="checkbox" id="chk14"><label for="chk14">14:00</label></dd>
            <dd><input type="checkbox" id="chk15"><label for="chk15">15:00</label></dd>
            <dd><input type="checkbox" id="chk16"><label for="chk16">16:00</label></dd>
            <dd><input type="checkbox" id="chk17"><label for="chk17">17:00</label></dd>
            <dd><input type="checkbox" id="chk18"><label for="chk18">18:00</label></dd>
            <dd><input type="checkbox" id="chk19"><label for="chk19">19:00</label></dd>
            <dd><input type="checkbox" id="chk20"><label for="chk20">20:00</label></dd>
            <dd><input type="checkbox" id="chk21"><label for="chk21">21:00</label></dd>
            <dd><input type="checkbox" id="chk22"><label for="chk22">22:00</label></dd>
            <dd><input type="checkbox" id="chk23"><label for="chk23">23:00</label></dd>
        </dl>
        </div>
        <div class="btn_area">
            <button>설정</button>
        </div>
    </div>
</div>
<!-- 시간 설정창 end -->

<!-- 내운동기록 창-->
<div id="recordBoxArea">

</div>
<!-- 내운동기록 창 end-->
<!-- 운동기록 창 tmpl -->
<script type="text/template" id="recordBoxAreaTmpl">
    <div id="recordBox">
    <div id="closeBtn"><button class="btn close">X</button></div>
    <div id="recordInform">
        <div>
            <div class="">소모한 칼로리</div>
            <div><@= nowRecord.kcal @></div>
        </div>
        <div>
            <div class="">운동시간</div>
            <div><@=nowRecord.startTime@></div>
        </div>
    </div>
    <!-- sort tab -->
    <div class="exercise_list_tab">
        <ul class="active_tab">
            <li class="on"></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div><!-- sort tab end -->
    <div class="lectureInform">
        <div>
            <img src="img/coach.jpg">
        </div>
        <div><@=nowRecord.nickname@></div>
        <div>코치와 함께하는 운동 기록</div>
    </div>
    <!-- .tab1 -->
    <div class="tab on">
        <div class="record_table">
            <table>
                <thead>
                <tr>
                    <th></th>
                    <th>전</th>
                    <th>후</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>BMI</td>
                    <td><@=prevRecord.bmiAfter@></td>
                    <td><@=nowRecord.bmiAfter@></td>
                </tr>
                <tr>
                    <td>체중</td>
                    <td><@=prevRecord.weight@></td>
                    <td><@=nowRecord.weight@></td>
                </tr>
                <tr>
                    <td>근골격량</td>
                    <td><@=prevRecord.muscleBone@></td>
                    <td><@=nowRecord.muscleBone@></td>
                </tr>
                <tr>
                    <td>체지방량</td>
                    <td><@=prevRecord.fatMass@></td>
                    <td><@=nowRecord.fatMass @></td>
                </tr>
                <tr>
                    <td>체지방율</td>
                    <td><@=prevRecord.fatRate@></td>
                    <td><@=nowRecord.fatRate@></td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <td>평가</td>
                    <td colspan="2">과체중</td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <!-- .tab1 end -->
    <!-- .tab2 -->
    <div class="tab">
        <div class="record_table">
            <table>
                <thead>
                <tr>
                    <td colspan="4">오늘의 기록</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>최고 중량</td>
                    <td><@=nowRecord.heaviest@></td>
                    <td>합계 중량</td>
                    <td><@=nowRecord.totalWeight@></td>
                </tr>
                <tr>
                    <td>평균 심박수</td>
                    <td><@=nowRecord.avgBpm @></td>
                    <td>최고 심박수</td>
                    <td><@=nowRecord.highBpm @></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- .tab2 end -->
    <!--.tab3 -->
    <div class="tab">
        <div class="record_table">
            <table>
                <thead>
                <tr>
                    <th colspan="4"><@=nowRecord.name@></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>세트 횟수</td>
                    <td></td>
                    <td>운동 중량</td>
                    <td></td>
                </tr>
                <tr>
                    <td>반복 횟수</td>
                    <td></td>
                    <td>운동 시간</td>
                    <td></td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <td>소모 칼로리</td>
                    <td colspan="3"></td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <!-- .tab3 end -->
    <!-- tab4 -->
    <div class="tab">
        <div class="record_table">
            <dl>
                <dt>운동 전</dt>
                <dd><img src="img/운동전.PNG" /></dd>
                <dd><img src="img/운동전2.PNG" /></dd>
            </dl>
            <dl>
                <dt>운동 후</dt>
                <dd><img src="img/운동후.PNG" /></dd>
                <dd><img src="img/운동후2.PNG" /></dd>
            </dl>
        </div>
    </div>
    <!-- .tab4 end-->
    <div id="btnArea">
        <button class="btn prev">이전</button>
        <button class="btn next">다음</button>
    </div>
</div>
</script>
<!--  운동기록창 tmpl end -->

<!-- 수락거절 관련 창 전체 -->
<div id="reserveAlertArea">
<script type="text/template" id="reserveAlertAreaTmpl">
    <!-- 수락거절창 -->
    <div id="reserveAlert" class="alert_box">
        <div class="alert_box coach area">
            <div><img src="img/coach.jpg"/></div>
            <div><@=coachingInform.nickname@></div>
        </div>
        <div class="alert_box date area">
            <@=moment(coachingInform.coachingDate).format('YYYY년 MM월 DD일')@>
        </div>
        <div class="alert_box time area">
            <div class="start">시작</div>
            <div class="start_time"><@=moment(coachingInform.coachingDate).format('HH:mm')@></div>
            <div class="end">종료</div>
            <div class="end_time"><@=moment(coachingInform.coachingDate).add(1, 'h').format('HH:mm')@></div>
        </div>
        <div class="alert_box confirm">
            코칭 신청
        </div>
        <div>
            <button class="btn reject">거 절</button>
            <button class="btn accept">수 락</button>
        </div>
    </div>
    <!-- 수락거절창 end-->
    <!-- 거절사유 작성창 -->
    <div id="rejectReason">
        <div id="rejectReasonHead">거절사유를 입력해 주세요.</div>
        <div id="rejectReasonContent">
            <input id="reason" type="text" />
            <button class="rejection_accept_btn">거절하기</button>
        </div>
    </div>
</script>
</div>
<!--수락거절창 전체 end-->

<!-- 거절사유 확인창 -->
<div id="rejectReasonConfirmArea">
    <div id="rejectReasonConfirm">
        <div class="alert_box coach area">
            <div><img src="img/coach.jpg"/></div>
            <div>양치승</div>
            <button id="rejectReasonCloseBtn">X</button>
        </div>
        <div class="alert_box confirm">
            거절처리
        </div>
        <div class="alert_box date area">
            2020.12.28
        </div>
        <div class="alert_box fact area">
            거절사유
        </div>
        <div class="alert_box time area">
            <div class="start">시작</div>
            <div class="start_time">11:00</div>
            <div class="end">종료</div>
            <div class="end_time">12:00</div>
        </div>
        <div id="rejectReasonView">
            아파서 못해유~
        </div>
    </div>
</div>
<!-- 거절사유 확인창 end -->


<!-- 코칭 결제창 -->
<div id="creditAlertArea">
<script type="text/template" id="creditAlertAreaTmpl">
    <div id="creditAlert" class="alert_box">
        <div class="alert_box coach area">
            <div><img src="img/coach.jpg"/></div>
            <div>
				
			</div>
        </div>
        <div class="alert_box date area">
            
        </div>
        <div class="alert_box time area">
            <div class="start">시작</div>
            <div class="start_time"></div>
            <div class="end">종료</div>
            <div class="end_time"></div>
        </div>
        <div class="alert_box energy area">
            <div class="energy_name">보유 에너지</div>
            <div class="energy_volume"><img src="img/energy_small.png"><@=clickDate.energy@></div>
            <div class="energy_name">결제 에너지</div>
            <div class="energy_volume"><img src="img/energy_small.png">???</div>
        </div>
        <div class="alert_box my_energy area">
            <div>결제시 잔여 <img src="img/energy_small.png"> 800</div>
        </div>
        <div>
            <button class="btn cancle">취소</button>
            <button class="btn credit">결제</button>
        </div>
    </div>
</script>
</div>
<!-- 결제창 end-->


<script src="/js/main.js"></script>
<script src='/js/locales-all.js'></script>
<script src="/js/jquery.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script src="/js/underscore-min.js"></script>
<script>

  const events = [];
	console.log(events);
  let startTime;
  let endTime;
  let nowDate = new Date();
  let clickDate;
  let getDate;
  let getTime;
  
  let calendarStart= moment().format('YYYY-MM-DD HH:mm:ss');
  let calendarEnd = moment().format('YYYY-MM-DD HH:mm:ss');
  


	 // 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
  _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

  const $recordBoxAreaTmpl = _.template($("#recordBoxAreaTmpl").html());
  const $recordBoxArea = $("#recordBoxArea");
  const $creditAlertAreaTmpl = _.template($("#creditAlertAreaTmpl").html());
  const $creditAlertArea = $("#creditAlertArea");
  const $dateArea = $('.date.area');
  const $reserveAlertAreaTmpl = _.template($("#reserveAlertAreaTmpl").html());
  const $reserveAlertArea = $("#reserveAlertArea");

	 
  const calendarEl = document.getElementById('calendar');

  const calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
    },
    initialDate: new Date(),
    navLinks: true, // can click day/week names to navigate views
    businessHours: {
        // days of week. an array of zero-based day of week integers (0=Sunday)
        daysOfWeek: [ 1 , 2, 3, 4 ], // Monday - Thursday

        startTime: '10:00', // a start time (10am in this example)
        endTime: '18:00' // an end time (6pm in this example)
    }, // display business hours
    editable: true,
    selectable: true,
    events:events,
    locale:"ko",
    eventClick: function(info) {
          // calendar.gotoDate(info.date)
          // clickDate=info.date;
          clickDate = moment(info.event.start).format('YYYY-MM-DD HH:mm:ss');
		  nowDate = moment().format("YYYY-MM-DD HH:mm:ss");	
          console.log(info.event._def.ui.classNames);
          console.log("임마");
          console.log(info);
          
          
          console.log(info.event.extendedProps.okToggle);
          
          console.log(clickDate);
          if(clickDate<nowDate && info.event.extendedProps.okToggle=='T' || info.event.extendedProps.okToggle==null){
          $.ajax({
        	  url:"/getRecord.json",
        	  type:"GET",
        	  data:{
        		  startTime:clickDate,
        		  memberNo:<%=loginMember.getNo()%>
        	  },
        	  success:function(json){
        		  console.log(json);
        		  json = JSON.parse(json);
        		  alert("성공");
        		  $recordBoxArea.html($recordBoxAreaTmpl(json));

        	  },
        	  error:function(){
        		  alert("현재 서비스 점검중입니다.");
        	  }
        	  
          })
          }
          if(info.event.extendedProps.okToggle=='F'){
              $("#rejectReasonConfirmArea").css("display","block");
              $("html").css("overflow","hidden");
             }else if(clickDate<=nowDate && info.event.extendedProps.okToggle=='T' || info.event.extendedProps.okToggle==null){
           $("#recordBoxArea").css("display","block");
           $("html").css("overflow","hidden")

           }else if(info.event.extendedProps.okToggle=='W' && <%=coachNo%>==<%=loginMember.getNo()%>){
             $("#reserveAlertArea").css("display","block");
             $("html").css("overflow","hidden")
             console.log(clickDate);
             console.log(<%=coachNo%>);
                $.ajax({
      				url:"/coachingInform.json",
      				type:"GET",
      				data:{
      					"coachNo":<%=coachNo%>,
      					"coachingDate":clickDate
      				},
      				success:function(json){
      					console.log(json);
      					console.log("잘넘어오네");
      					$reserveAlertArea.html($reserveAlertAreaTmpl({coachingInform:json}));
      				},
      				erroe:function(){
      					alert("점검중");
      				}
      			})
			
           }else if(info.event.extendedProps.okToggle=='W' && <%=coachNo%>==-1){
 				alert("예약대기중입니다.");
           }else if(info.event.extendedProps.okToggle=='T' && <%=coachNo%>==-1){
 				alert("예약이 완료된 코칭입니다.");
           }else if(info.event.extendedProps.okToggle=='T' && <%=coachNo%>==<%=loginMember.getNo()%>){
 				alert("이미 수락한 코칭입니다.");
           }
          
          
          $(document).on("click",".accept",function () {
              $("#reserveAlertArea").css("display","none")
              $("html").css("overflow-y","scroll")
              const time = moment(info.start).format("YYYY-MM-DD HH:mm:ss");
              //업데이트-> 코치번호&멤버번호로 조회후 수락여부 수정해야함
              <%if( coachNo==loginMember.getNo()) {%>
        	  $.ajax({
        	  url:"/acceptCoaching.json",
        	  data:{
        		  "coachingDate":clickDate,
        		  "coachNo":<%=coachNo%>
        	  },
        	  type:'GET',
        	  success:function(json) {
        		  console.log("여기!!!!!!");
        		  console.log(json);
        	  },
        	  error:function() {
        		  alert("해당 서비스는 현재 점검중입니다.")
        	  }
        	  
          })
          <%}%>
          })
            $(document).on("click",".rejection_accept_btn",function () {
      			$("#reserveAlertArea").css("display","none")
      			$("#rejectReason").css("display","none")
      			$("#reserveAlert").css("display","block")
      			$("html").css("overflow-y","scroll")
      			const reason = $("#reason").val();
      			console.log(reason);
      			
      			$.ajax({
      				url:"/rejectCoaching.json",
      				type:"GET",
              	  	data:{
            		  "coachingDate":clickDate,
            		  "coachNo":<%=coachNo%>,
      				  "rejectReason": reason
            	  	},
      				success:function(json) {
      					console.log(json);
      					alert("수업거절이 완료되었습니다.");
      				},
      				error:function(){
      					alert("해당 서비스는 현재 점검중입니다.")
      				}
      				
      			})
 		 })


          // change the border color just for fun
          info.el.style.borderColor = 'red';
          
      },
      dateClick:function (info) {
          //console.log(info.dayEl.dataset);

          // const test = $(info.jsEvent.path[0]).parents(".fc-daygrid-day-bg").find(".fc-non-business").length;
          // console.log(test);

         calendar.changeView("timeGridDay");
          $(".fc-toolbar-title").text(info.startStr);
          getDate= info.dayEl.dataset.date;
          //console.log(getDate);

      },
      select:function (info) {
    	  
    	  console.log(info);
    	  
    	  //이걸 사용해서 모멘트라이브러리로 시간만 가져오기
    	  console.log(info.start);
    	  const time = moment(info.start).format("YYYY-MM-DD HH:mm:ss");
    	  console.log(time);
    	  
  	      <%if( coachNo!=-1 && coachNo!=loginMember.getNo()) {%>
  	      
 	      $.ajax({
  	    	  url:"/getEnergyHistory.json",
 	    	  type:'get',
  	    	  data:{
					memberNo: <%=loginMember.getNo()%>
					},
  	    	  success:function(json){
    	  			json = JSON.parse(json);
    	  			$creditAlertArea.html($creditAlertAreaTmpl({clickDate:json}))
    	  			console.log(moment(time).format("YYYY-MM-DD"))
    	  			console.log(moment(time).format("HH:mm:ss"))
    	  			console.log(json);
					console.log($dateArea.text())
					$(".date.area").text(moment(time).format("YYYY년 MM월 DD일"))
					$(".start_time").text(moment(time).format("HH:mm"))
					$(".end_time").text(moment(time).format("HH:mm"))
  	    	  },
  	    	  error:function() {
  	    		  alert("점검중 입니다. 잠시후 이용해 주세요.")
  	    	  }
    	  
  	      })
  	      
  	      
  	      
  	      
    	  $(document).on("click",".credit",function () {

    	        $creditAlertArea.css("display","none")
    	        $("html").css("overflow-y","scroll")

    	      const event = {
    	          title: "코칭",
    	          start: startTime,
    	          end:endTime,
    	          className:"W"
    	      }

    	  	  $.ajax({
    	  	  url:"/reserveCoaching.json",
    	  	  data:{
    	  		  "memberNo":<%=loginMember.getNo()%>,
    	  		  "startDate":time,
    	  		  "coachNo":<%=coachNo%>
    	  	  },
    	  	  type:'GET',
    	  	  success:function(json) {
    	  		  console.log(json);
    	  		  alert("성공");
    	  	  },
    	  	  error:function() {
    	  		  alert("해당 서비스는 현재 점검중입니다.")
    	  	  }
    	  	  
    	    })
    	      calendar.addEvent(event);
    	      event=[];
    	  })
    	  <%}%>
    	  
    	// console.log(info.jsEvent.path);
       // console.log($(info.jsEvent.path[2]).find(".fc-non-business").length);

        const $business = $(info.jsEvent.path[2]).find(".fc-non-business");
        //getTime = info.dayEl.dataset.time;
		//console.log(getTime);

          //console.log($business);


        const businessHours = [];

        $business.each(function () {



            const $parent = $(this).parent();


            let start = $parent.css("top");
            let end = $parent.css("bottom");




            start = parseInt(start.substr(0,start.length-2));
            end =Math.abs(parseInt(end.substr(0,end.length-2))) ;

          //  const idx = (start+end)/48;

            businessHours.push({start:start,end:end});




        });
        
        
      


          console.log(businessHours);


          console.log(info.jsEvent.path[1]);



          let flag = false;//이게 true면 businessHour안에 포함


          let top = $(info.jsEvent.path[1]).css("top");


          top = parseInt(top.substr(0,top.length-2));


          $(businessHours).each(function () {


              if(this.start<=top  && this.end > top ) {


                  flag = true;

                  return;
              }//if end


          })//each end

          console.log("top:"+top);
          console.log(flag);
         // console.log($(info.jsEvent.path[1]).find(".fc-timegrid-bg-harness"))
         calendar.gotoDate(info.start);
         //  const test = $(info.jsEvent.path[0]).parents(".fc-daygrid-day-bg").find(".fc-non-business").length;
         //  const test2 = $(info.jsEvent.path[0]).parents(".fc-timegrid-bg-harness").find(".fc-timegrid-bg-harness").length;
		let clickDate = moment(info.start).format('YYYY-MM-DD HH:mm:ss');
		let nowDate = moment().format('YYYY-MM-DD HH:mm:ss');
         console.log(clickDate);
         console.log(nowDate);
         if(flag==false){
       	 if(clickDate>=nowDate){
		  if(<%=coachNo%>!=-1){	
           if(info.view.type=="timeGridDay"){
               $("#creditAlertArea").css("display","block")
               $("html").css("overflow","hidden")
               startTime=info.start;
               endTime=info.start+60;
           }//if end
		  }//if end
       	 }//if end
        }//if end
      }//select end
      ,datesSet:function(info) {
    	  //alert("dfasdf");
    	  console.log("여기");
    	  console.log(info.start);
    	  console.log(info.end);
    		 calendarStart= moment(info.start).format('YYYY-MM-DD HH:mm:ss');
 			 calendarEnd = moment(info.end).format('YYYY-MM-DD HH:mm:ss');
    		  
    	  getCalenderEvents();
    	  
      }
  });//calendar end
  
  
  function getCalenderEvents() {
	  
	  <%if(coachNo==-1) {%>
	  $.ajax({
		  url:"/getCalenderEvents.json",
		  data:{
			 calendarStart:calendarStart,
			 calendarEnd:calendarEnd,
			 memberNo:<%=loginMember.getNo()%>
		  },
		  error: function() {
			  alert("해당 서비스는 현재 점검중입니다. 추후에 다시 이용해주세요.")
		  },
		  success:function(json) {
			
			  console.log(json);
			  
			  
			  //const events = [{"title":"처음하는스쿼트","className":"L","start":"2021-01-11"}];
			 calendar.removeAllEvents();
			  calendar.addEventSource( json );

		  }
	  });
	  <%}else{%>
	  $.ajax({
		  url:"/getCoachingEvents.json",
		  type:"GET",
		  data:{
			 calendarStart:calendarStart,
			 calendarEnd:calendarEnd,
			 coachNo:<%=coachNo%>
		  },
		  error: function() {
			  alert("해당 서비스는 현재 점검중입니다. 추후에 다시 이용해주세요.")
		  },
		  success:function(json) {
			  console.log("gd");
		      console.log(json);
		      
		      
		      calendar.removeAllEvents();
			  calendar.addEventSource( json );

		  }
	  });
	  <%}%>
  }
  getCalenderEvents();
  calendar.render();
  

  //해당요일 클릭시 시간 선택 창 띄우기
  $(".fc-col-header-cell.fc-day").on("click",function(){
      //클릭시 숨겨져있던 창 띄우기
      $("#timeSelectArea").css("display","block");
      //선택한 요일 받아서 넣기
      $(".click_day").text($(this).text());
      $("html").css("overflow","hidden")
  });
  //설정시 시간클릭 창닫기
  $(document).on("click",".btn_area button",function () {
      $("#timeSelectArea").css("display","none")
      $("html").css("overflow-y","scroll")
  })

  $(document).on("click",".btn.close",function () {
      $("#recordBoxArea").css("display","none")
      $("html").css("overflow-y","scroll")
  })

  $(document).on("click",".cancle",function () {
      $("#creditAlertArea").css("display","none")
      $("html").css("overflow-y","scroll")
  })


  $(document).on("click","#rejectReasonCloseBtn",function () {
      $("#rejectReasonConfirmArea").css("display","none")
      $("html").css("overflow-y","scroll")
  })


  //내운동기록 스크립트
  let idx = 0;
  $(".active_tab li").on("click",function (e) {

      //1) 기존의 on 클래스를 제거
      $(".on").removeClass("on");

      // 2) 클릭한 그 li요소에 on 클래스를 더한다.
      $(this).addClass("on");

      idx = $(this).index();

      $(".tab").eq(idx).addClass("on");
  }); //.active_tab li click() end

  $(document).on("click",".next",function () {

      $(".active_tab li").removeClass("on").eq(++idx).addClass("on");

      $(".tab").removeClass("on").eq(idx).addClass("on");
  })

  $(document).on("click",".prev",function () {

      $(".active_tab li").removeClass("on").eq(--idx).addClass("on");

      $(".tab").removeClass("on").eq(idx).addClass("on");
  });

  //수락거절 및 거절사유 작성
  $(document).on("click",'.reject',function () {
      $("#rejectReason").css("display","block")
      $("#reserveAlert").css("display","none")
  })

  $(document).on("click",".rejection_accept_btn",function () {
      $("#reserveAlertArea").css("display","none")
      $("#rejectReason").css("display","none")
      $("#reserveAlert").css("display","block")
      $("html").css("overflow-y","scroll")
  })

</script>

    