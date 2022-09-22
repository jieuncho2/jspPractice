function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {

            var fullAddr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
            }
            else {
                fullAddr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){

                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            document.getElementById('zcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr1').value = fullAddr;

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
            memberID.focus();
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