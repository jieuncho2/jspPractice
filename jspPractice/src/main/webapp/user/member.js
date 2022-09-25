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

document.addEventListener('DOMContentLoaded', () => {
    const button = document.querySelector('input[type=submit]');
    
    button.addEventListener('click', (event) => {
        const formLogin = document.forms.member_insert;
        if(formLogin.id.value === '') {
            alert('아이디를 입력해 주세요.');
            return;
        }
        if(formLogin.password.value === '') {
            alert('비밀번호를 입력해 주세요.');
            return;
        }
        if(formLogin.password2.value === '') {
            alert('비밀번호 확인을 입력해 주세요.');
            return;
        }
        if(formLogin.password.value !== formLogin.password2.value) {
            alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
            return;
        }
        if(formLogin.name.value === '') {
            alert('이름을 입력해 주세요.');
            return;
        }
        formLogin.action = 'member_insert.jsp'; 
        formLogin.submit();
    });
});