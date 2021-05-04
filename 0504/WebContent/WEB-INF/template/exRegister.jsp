<%@page import="com.joa.sht.gym_zip.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	Member registerMember = (Member)session.getAttribute("loginMember");
	
	System.out.println("registerMember:"+registerMember);
%>


<!-- popWrapEx -->
<!-- 운동등록 클릭시 나타나는 운동등록 뷰-->
<div id="popWrapEx" class="pop_layout">


     <div id="popContainerEx">

      <div id="popContentEx">

          <form action="/registerEx.do" method="post">
       
          <input type="hidden" id="imgFileName" name="thumbnail" />
          <input type="hidden" id="videoFileName" name="url" />
          <input type="hidden" id="videoFileDuration" name="time" />
          <input type="hidden" name="memberNo" value="<%=registerMember.getNo()%>"/>
          
          
          <div id="exPartBox" class="subtitle">
            <span>부위</span>
            <div id="exPart"class="horizon">
            <!--NO	PART_NAME	
				1	하체	2	가슴	3	등	4	어깨	5	팔	6	복근	7	전신	
              -->
            <select name="part">
                <option value="1">하체</option>
                <option value="2">가슴</option>
                <option value="3">등</option>
                <option value="4">어깨</option>
                <option value="5">팔</option>
                <option value="6">복근</option>
                <option value="7">전신</option>
            </select>
          </div>
         </div>

        <div id="representExBox"class="subtitle">
            <span>대표운동</span>
            <div id="representEx" class="horizon">
               <input type="text" id="inputRepresentEx" class="small_input"  placeholder="내용을 입력해주세요." name="representEx">
               
            </div>
        </div>

          <div id="motionNameBox" class="subtitle">
              <span>운동명</span>
              <div id="MotionName" class="horizon">
                  <input type="text" id="inputMotionName" class="big_input" placeholder="운동명을 입력해주세요." name="motionName">
              </div>
          </div>

        <div id="countNumBox" class="subtitle">
            <span>횟수</span>
            <div id="countNum" class="horizon">
                <input type="text" id="inputCountNum" class="small_input" placeholder="횟수를 입력해주세요." name="countEx">
            </div>
        </div>

        <div id="setNumBox" class="subtitle">
            <span>세트</span>
            <div id="setNum" class="horizon">
                <input type="text" id="inputSetNum" class="small_input" placeholder="세트수를 입력해주세요." name="countSet">
            </div>
        </div>
        
            <div id="exWeightBox" class="subtitle">
            <span>중량</span>
            <div id="exWeightNum" class="horizon">
                <input type="text" id="inputexWeightNum" class="small_input" placeholder="무게를 입력해주세요." name="countExWeight">
            </div>
        </div>

        <div id="setLevelBox"class="subtitle">
            <span>난이도</span>
            <div id="setLevel"class="horizon">
              <input type="radio" id="beginnerRadio" name="inputLevel" value="1">
                <label for="beginnerRadio">초급</label>
              <input type="radio" id="middleRadio" name="inputLevel" value="2">
                <label for="middleRadio">중급</label>
              <input type="radio" id="highRadio" name="inputLevel"value="3">
                <label for="highRadio">고급</label>
            </div>
        </div>

        <div id="usingCheckBox" class="subtitle">
            <label for="bmCheck">BM 사용</label>
            <div id="usingCheck" class="horizon">
                <input id="bmCheck" type="checkbox" value="T" name="bmCheck">
            </div>
        </div>
        
         <div id="payCheckBox" class="subtitle">
            <div id="payCheck" class="horizon">
                <label for="pay">유료</label>
                <input id="pay" type="radio" value="T" name="payCheck">
                <label for="free">무료</label>
                <input id="free" type="radio" value="F" name="payCheck">
            </div>
        </div>

        <div id="genderTargetBox">
            <span>타겟성별</span>
            <div id="genderTarget" class="horizon">
               <input type="radio" id="manRadio" value="M" name="targetRadio">
                <label for="manRadio">남성</label>
               <input type="radio" id="womanRadio" value="F" name="targetRadio">
                <label for="womanRadio">여성</label>
               <input type="radio" id="allRadio" value="A" name="targetRadio">
                <label for="allRadio">공용</label>
            </div>
        </div>

        <div id="imgFileBox" >
            <span>썸네일</span>
            <div id="imgFile" class="horizon input_box">
                <label for="inputImgFile">
                  <i class="fas fa-plus-circle"></i>
                </label>
            </div>
                <img id="selectImg" src=""/>
            <div class="horizon">
                <label class="input_button" for="inputImgFile">
                    파일선택
                </label>
                <input type="file" id="inputImgFile" class="non_display"/>
            </div>
            <div class="msg"></div>
        </div>

        <div id="videoFileBox">
            <span>운동영상</span>
            <div id="videoFile" class="horizon input_box">
             <label for="inputVideoFile">
                  <i class="fas fa-plus-circle"></i>
                </label>
            </div>
            <Strong class="non_display"></Strong>
            <div class="horizon">
                <label class="input_button" for="inputVideoFile">
                    파일선택
                </label>
                <input type="file" id="inputVideoFile" class="non_display"/>
            </div>
            <div class="msg"></div>
        </div>

<!--        <div id="averageKcalBox">-->
<!--            <span>내 칼로리 소모량</span>-->
<!--            <div id="averageKcal">-->
<!--                <ul id="averageList">-->
<!--                    <li>여성</li>-->
<!--                    <li>163cm</li>-->
<!--                    <li>50kg</li>-->
<!--                    <li>123kcal</li>-->
<!--                </ul>-->
<!--            </div>-->
<!--        </div>-->

        <div id="predictBox">
            <div>예상 칼로리 소모량</div>
            <div id="femaleKcalBox" class="horizon">
                <span>여성</span>
                <input type="text" id="inputFemaleHeight" class="small_input" placeholder="내용을 입력해주세요" name="fHeight">
                <label>cm</label>
                <input type="text" id="inputFemaleWeight" class="small_input" placeholder="내용을 입력해주세요" name="fWeight">
                <label>kg</label>
                <input type="text" id="inputFemaleKcal"   class="small_input" placeholder="내용을 입력해주세요" name="fKcal">
                <label>kcal</label>
            </div>

            <div id="maleKcalBox" class="horizon">
                <span>남성</span>
                <input type="text" id="inputMaleHeight" class="small_input" placeholder="내용을 입력해주세요" name="mHeight">
                <label>cm</label>
                <input type="text" id="inputMaleWeight" class="small_input" placeholder="내용을 입력해주세요" name="mWeight">
                <label>kg</label>
                <input type="text" id="inputMaleKcal"  class="small_input"  placeholder="내용을 입력해주세요" name="mKcal">
                <label>kcal</label>
            </div>
        </div>

        <button id="registerButton" type="submit">등 록</button>
        </form>
      </div>
        <!--popcontentEx END-->
    </div>
    <!--popContainerEx END-->

</div>
<!--popWrapEx END-->