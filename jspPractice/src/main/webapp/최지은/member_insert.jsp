<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>220826</title>
    <script src="member.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
        
        * { margin: 0; padding: 0; }
        a { text-decoration: none; }
        li { list-style: none; }
        img { display: block; border: none; }
        body { font-family: 'Noto Sans KR', sans-serif; font-size: 14px; color: black; line-height: 20px; }

        ul {
            width: 800px;
            margin: 10px;
            border: 1px solid skyblue;
            list-style: none;
        }
        ul li{
            display: block;
            padding: 10px;
            border-bottom: 1px dashed red;
        }
        ul label {
            width: 160px;
            display: inline-block;
            text-align: center;
        }
        input[type=radio], input[type=checkbox] {
            margin-right: 23px;
        }
        .il {
            width: auto;
        }
        .div {
            padding: 10px 0;
        }
        div {
            float:right;
        }
    </style>
</head>
<body>

    <form name="member_insert" action="member_insert_action.php" method="post">
        
        <ul>
            <li>
                <input type="hidden" name="insert_type" value="회원가입">
            </li>

            <li>
                <label>약관동의</label>
                <label for="a1" class="il">동의합니다.</label>
                <input type="radio" name="question_of_assent" value="yes" id="a1">
                <label for="a2" class="il">동의하지 않습니다.</label>
                <input type="radio" name="question_of_assent" value="no" id="a2" checked="checked">
            </li>

            <li>
                <label for="id">아이디</label>
                <input type="text" name="id" id="id">
            </li>
    
            <li>
                <label for="password">비밀번호</label>
                <input type="password" name="password" id="password">
            </li>
            
            <li>
                <label for="password2">비밀번호 확인</label>
                <input type="password" name="password2" id="password2">
            </li>

            <li>
                <label for="name">이름</label>
                <input type="text" name="name" id="name">
            </li>

            <li>
                <label for="email">이메일</label>
                <input type="email" name="email" id="email">
            </li>

            <li>
                <label for="tel">휴대폰 번호</label>
                <input type="tel" name="tel[]" size="3" maxlength="3" id="tel">
                <input type="tel" name="tel[]" size="4" maxlength="4" id="tel">
                <input type="tel" name="tel[]" size="4" maxlength="4" id="tel">
            </li>

            <li>
                <label>생년월일</label>
                <select name="birth_year">
                    <option value="1980년">1980</option>
                    <option value="1981년">1981</option>
                    <option value="1982년">1982</option>
                    <option value="1983년">1983</option>
                    <option value="1984년">1984</option>
                    <option value="1985년">1985</option>
                    <option value="1986년">1986</option>
                    <option value="1987년">1987</option>
                    <option value="1988년">1988</option>
                    <option value="1989년">1989</option>
                    <option value="1990년">1990</option>
                    <option value="1991년">1991</option>
                    <option value="1992년">1992</option>
                    <option value="1993년">1993</option>
                    <option value="1994년">1994</option>
                    <option value="1995년">1995</option>
                    <option value="1996년">1996</option>
                    <option value="1997년">1997</option>
                    <option value="1998년">1998</option>
                    <option value="1999년">1999</option>
                    <option value="2000년">2000</option>
                </select>년
                <select name="birth_month">
                    <option value="1월">1</option>
                    <option value="2월">2</option>
                    <option value="3월">3</option>
                    <option value="4월">4</option>
                    <option value="5월">5</option>
                    <option value="6월">6</option>
                    <option value="7월">7</option>
                    <option value="8월">8</option>
                    <option value="9월">9</option>
                    <option value="10월">10</option>
                    <option value="11월">11</option>
                    <option value="12월">12</option>
                </select>월
                <select name="birth_day">
                    <option value="1일">1</option>
                    <option value="2일">2</option>
                    <option value="3일">3</option>
                    <option value="4일">4</option>
                    <option value="5일">5</option>
                    <option value="6일">6</option>
                    <option value="7일">7</option>
                    <option value="8일">8</option>
                    <option value="9일">9</option>
                    <option value="10일">10</option>
                    <option value="11일">11</option>
                    <option value="12일">12</option>
                    <option value="13일">13</option>
                    <option value="14일">14</option>
                    <option value="15일">15</option>
                    <option value="16일">16</option>
                    <option value="17일">17</option>
                    <option value="18일">18</option>
                    <option value="19일">19</option>
                    <option value="20일">20</option>
                    <option value="21일">21</option>
                    <option value="22일">22</option>
                    <option value="23일">23</option>
                    <option value="24일">24</option>
                    <option value="25일">25</option>
                    <option value="26일">26</option>
                    <option value="27일">27</option>
                    <option value="28일">28</option>
                    <option value="29일">29</option>
                    <option value="30일">30</option>
                    <option value="31일">31</option>
                </select>일
            </li>

            <li>
                <label for="birth">생년월일</label>
                <input type="date" name="birth" id="birth">
            </li>

            <li>
                <label>우편번호</label>
                <input name="zipcode" id="zcode" size="10" maxlength="5" readonly>
                <span onclick="execDaumPostcode();" style="cursor:pointer;">우편번호 검색</span>
            </li>
            <li>
                <label>주소 1</label>
                <input name="address1" id="addr1" size="70" maxlength="70" readonly>
            </li>
            <li>
                <label>주소 2</label>
                <input name="address2" id="addr2" size="70" maxlength="70">
                </td></tr>
            </li>

            <li>
                <label>이메일 수신 여부</label>
                <label for="b1" class="il">수신</label>
                <input type="radio" name="email_reception_yes_or_no" value="yes" id="b1">
                <label for="b2" class="il">거부</label>
                <input type="radio" name="email_reception_yes_or_no" value="no" id="b1" checked="checked">
            </li>

            <li>
                <label>휴대폰 정보 수신 여부</label>
                <label for="c1" class="il">수신</label>
                <input type="radio" name="phone_reception_yes_or_no" value="yes" id="c1">
                <label for="c2" class="il">거부</label>
                <input type="radio" name="phone_reception_yes_or_no" value="no" id="c2" checked="checked">
            </li>

            <li>
                <label class="div">관심 분야 10개 중 선택</label>
                <div>
                    <label for="d1" class="il">사업관리</label>
                    <input type="checkbox" name="interest[]" value="business" id="d1">
                    <label for="d2" class="il">경영&회계</label>
                    <input type="checkbox" name="interest[]" value="accounting" id="d2">
                    <label for="3" class="il">사무</label>
                    <input type="checkbox" name="interest[]" value="office" id="d3">
                    <label for="d4" class="il">금융보험</label>
                    <input type="checkbox" name="interest[]" value="insurance" id="d4">
                    <label for="d5" class="il">교육</label>
                    <input type="checkbox" name="interest[]" value="education" id="d5">
                    <label for="d6" class="il">자연</label>
                    <input type="checkbox" name="interest[]" value="nature" id="d6">
                    <label for="d7" class="il">사회과학</label>
                    <input type="checkbox" name="interest[]" value="social_science" id="d7"><br>
                    <label for="d8" class="il">법률</label>
                    <input type="checkbox" name="interest[]" value="egislation" id="d8">
                    <label for="d9" class="il">보건</label>
                    <input type="checkbox" name="interest[]" value="health_care" id="d9">
                    <label for="d10" class="il">사회복지</label>
                    <input type="checkbox" name="interest[]" value="social_welfare" id="d10">
                </div>
            </li>

            <li>
                <input type="submit" name="submit" value="회원 가입">
            </li>

        </ul>
        
    </form>

    <script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
    <script>
        /* 
        카카오 우편번호 검색 가이드 페이지 :  https://postcode.map.daum.net/guide
        getElementById() : html 에서 매개변수로 받은 id 값이 있는 요소를 반환.
        */
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;
                    }
                    else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if(data.userSelectedType === 'R'){
                        //법정동명이 있을 경우 추가한다.
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('zcode').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('addr1').value = fullAddr;

                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById('addr2').focus();
                }
            }).open();
        }
    </script>
</body>
</html>