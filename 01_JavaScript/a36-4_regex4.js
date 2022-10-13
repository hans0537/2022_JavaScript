/* 대표적인 정규 표현식 
 *  구글링 하면 대표적인 정규표현식들이 많이 구할수 있습니다.
 *  각 정규표현식들을 작성해보고
 *	매칭되는 문자열과 그렇지 않은 것들을 출력해봅시다.   
 */

// 도우미 메소드
function regExpTest(regex, input){
    console.log("[정규표현식 매칭 테스트]-----------------");
    console.log("정규표현식:", regex);
    console.log("입력문자열:", input);

    if(regex.test(input)){
        console.log("   ⊙매칭⊙");
    } else {
        console.log(" X매치 없슴X");
    }
    console.log();
}

function test(regex, arrInput){
    for(input of arrInput) regExpTest(regex, input);
}

//--------------------------------------------------
let title, regex, arrInput;
console.log('[많이 쓰는 정규표현식]')

{
    //─────────────────────────────────────────
    title = "URL";
    
    regex = /^(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?$/;

    arrInput = [
        "https://www.naver.com/",
        "https://www.google.com/",
        "http::://ww.asdf.asd123/",
        "https://youtube.com/"
    ];
    console.log(title);
    test(regex, arrInput);


    //─────────────────────────────────────────
    title = "email";
    regex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    arrInput = [
        "a@a",
        "asdf@naver.com",
        "asf@hanmail.net",
        "asdf",
    ];
    console.log(title);
    test(regex, arrInput);
    
    //─────────────────────────────────────────
    title = "주민등록번호";
    regex = /^\d{2}(0\d|1[0-2])(0[1-9]|[12]\d|3[01])-\d{7}$/;
    arrInput = [
        "000101-7891011",
        "1234567891011",
        "971224-1111111",
        "1234567-1111111"
    ];
    console.log(title);
    test(regex, arrInput);

    //─────────────────────────────────────────
    title = "날짜 YYYY-MM-DD";
    regex = /^\d{4}-(0\d|1[0-2])-(0[1-9]|[12]\d|[3][01])$/;
    arrInput = [
        "1997-12-24",
        "3313-01-01",
        "1231-01-49"
    ];
    console.log(title);
    test(regex, arrInput);

    //─────────────────────────────────────────
    title = "자연수";
    regex = /^[1-9][0-9]*$/;
    arrInput = [
        "0",
        "01",
        "123",
        "-123",
        "1.23"
    ];
    console.log(title);
    test(regex, arrInput);

    //─────────────────────────────────────────
    title = "정수";
    regex = /^(0|-?[1-9][0-9]*)$/;
    arrInput = [
        "1",
        "02",
        "1.24",
        "-23"
    ];
    console.log(title);
    test(regex, arrInput);

    //─────────────────────────────────────────
    title = "소수";
    regex = /^(0|[1-9]+)(.[0-9]+)?$/;
    arrInput = [
        "00.000",
        "1.24323",
        "34.0"
    ];
    console.log(title);
    test(regex, arrInput);

    //─────────────────────────────────────────
    title = "소수점 둘째자리까지";
    regex = /^(0|[1-9]+)(.[0-9]{2})$/;
    arrInput = [
        "1.00",
        "000.01",
        "213.10",
        '3.1'
    ];
    console.log(title);
    test(regex, arrInput);

    //─────────────────────────────────────────
    title = "1000 단위 콤마 자연수";
    regex = /^[1-9]((,\d{3})*|\d{0,2})$/;
    arrInput = [
        "1,000,000",
        "1000",
        "100",
        "3,234"
    ];
    console.log(title);
    test(regex, arrInput);

}



console.log("\n[프로그램 종료]", '\n'.repeat(10));


