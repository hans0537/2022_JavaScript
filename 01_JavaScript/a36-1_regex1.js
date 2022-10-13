/* 정규표현식 (reqular expresson)
 *
 * 문자열 검색, 치환  등의 동작에 있어서
 * 단순한 '문자열 비교' 를 하는 것이 아니라 
 * 특정 '패턴'과 비교하고자 할때 이를 단 몇줄의 코드로 구현 가능!
 * 주어진 문자열에서 패턴을 찾아내는 것을 '패턴 매칭(pattern matching)' 이라 함
 * 
 * 사용자가 입력한 문자열 패턴 유효성 체크 등에 많이 사용
 * 		ex) 주민등록번호, URL, email, 비밀번호, 
 * 			날짜포맷(yyyy-mm-dd) 
 * 			전화번호(010-xxxx-xxxx) ... 
 *
 *  JavaScript 는 정규표현식 객체 (RegExp)를 사용하여 정규표현식을 다룬다
 *  
 *  정규표현식 객체 리터럴 구문
 *     /pattern/modifiers
 *
 * 정규표현식을 사용하는 주요 string 메소드
 * 주로 검색, 치환 등의 동작을 수행할때 사용된다.
 *    search(), replace(), split() ...
 * 
 * RegExp 의 주요 메소드
 *   exec() : 패턴매칭 수행후 '첫번째 매치' 리턴 (object 로 리턴)
 *            매칭이 없으면 null 리턴
 *   test() : 패턴매칭 결과 리턴 true / false
 *   toString() : 정규표현식 문자열 리턴
 *   compile()  <-  v1.5 에서 deprecated 됨
 * 
 * string 의 정규표현식 패턴매치 메소드
 *  match(), matchAll()
 *
 * RegExp 공식
 *   https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/RegExp
 *
 * 참조
 *  https://www.w3schools.com/js/js_regexp.asp
 *  https://www.w3schools.com/jsref/jsref_obj_regexp.asp
 *
 * 정규표현식 연습 사이트 추천
 * : https://regexr.com/    (정규식 , 문자열 매칭 연습)
 * : https://regexone.com/  ( step by step 으로 연습 하기 좋음)
 * : https://regexper.com/  (특징: 시각화, 정규식을 이미지로 다운가능)
 */
let text, n, pattern, result;

console.log('[정규표현식을 사용하는 string 메소드 예]');
text = "Hello JavaScript";

// search(string)  <- 해당 'string' 을 문자열에서 찾는다.
console.log(text.search('JavaScript'));   // 6
console.log(text.search('javaScript'));   // -1

// search(RegExp) <- 해당 정규표현식 패턴(RegExp) 을 문자열에서 찾는다
console.log(text.search(/JavaScript/));
console.log(text.search(/javaScript/));
console.log(text.search(/javaScript/i));

// replace(str1, str2) 
// str1 을 문자열에서 찾아 str2 로 치환
console.log(text.replace('JavaScript', 'RegularExpression'));
console.log(text.replace('javascript', 'RegularExpression'));

// replace(RegExp, str2)
// 정규표현식 패턴(RegExp) 을 문자열에서 찾아 str2 로 치환
console.log(text.replace(/JavaScript/, 'RegularExpression'));
console.log(text.replace(/javascript/, 'RegularExpression'));
console.log(text.replace(/javascript/i, 'RegularExpression'));

/**********************************************
 * JavaScript RegExp 리터럴의 modifier 들
 *
 * i : case-insensitive matching  (대소문자 구분 X)
 * g : global matching 수행  (첫번째 매칭뿐 아니라 전체 매칭 수행)
 * m:  multiline matching 수행
 */

/* 정규표현식 메소드
 *
 *   exec() : 패턴매칭 수행후 '첫번째 매치' 리턴 (object 로 리턴)
 *            매칭이 없으면 null 리턴
 *   test() : 패턴매칭 결과 리턴 true / false
 */
console.log('-'.repeat(20));
console.log('[정규표현식 메소드 예]');
text = 'The best things in life are free!';

pattern = /e/;

console.log(pattern.test(text));    // text 안에서 pattern 매칭 결과 true / false
console.log(/x/.test(text));

console.log(pattern.exec(text));
console.log(pattern.exec(text)[0]);
/************************************
 * 그룹이 지정된 경우
 */
console.log('-'.repeat(20));
console.log('[그룹]')
text = "-My98KK-myABCD--My1234567--MyZZ---My789";

pattern = /My..../;     // . 은 문자 하나에 매칭
console.log(pattern.exec(text));
console.log(pattern.exec(text).length);

pattern = /(My)..(..)/; // 정규표현식에서 패턴그룹 지정 '( )'
console.log(pattern.exec(text));
console.log(pattern.exec(text).length);  // 3 : length 값이 1보타 크면 그룹이 지정되어 있다는 뜻.

/***************************
 * match(), matchAll() 
 *   string 의 메소드
 *   string 안에서 정규표현식
 * 
 *   match() 는 매칭되는 문자열(들)의 ***배열을 리턴***
 *   matchAll() 은 전체 매칭결과(들)에 대한 iterator 리턴
 *       - RegExp 는 반드시 g 옵션이 있어야 한다.
 */
console.log('-'.repeat(20));
console.log('[string 의 match(), matchAll()]')
const str = '-My98KK-myABCD--My1234567--MyZZ---My789';

const regexp = /(My)(....)/g;

result = str.match(regexp);  // 매칭된 문자열들의 배열을 리턴
console.log(result.length);
console.log(result);

result = str.matchAll(regexp);  // 매칭된 결과(들)의 iterator 리턴
console.log(result.length);     // undefined
console.log(result);
for(match of result){
    console.log(match);
}

//-----------------------------------
// 도우미 함수
console.log('-'.repeat());
console.log('[도우미 함수]');

function regExpTest(regex, input){
    console.log("[정규표현식 매칭 테스트]-----------------");
    console.log("정규표현식:", regex);
    console.log("입력문자열:", input);

    let matches = input.matchAll(regex);      // 매칭 수행

    let matchCount = 0;
    for(let match of matches){
        matchCount++;
        console.log(`    매치${matchCount}: ${match[0]} {${match.index}~${match.index + match[0].length}}`);

        // 그룹이 있었다면 그룹도 출력
        if(match.length > 1){
            let start = match.index;

            for(let i = 1; i < match.length; i++){
                if(match[i]){   // group 의 결과가 undefined 가 아닌 경우
                    console.log(`\t group(${i}): ${match[i]} {${start} ~${start + match[i].length}}`);
                }
            }
        }
    }
    (matchCount == 0) && console.log(" X매치 없음X ");
    console.log();
}

regExpTest(/My..../g, str);
regExpTest(/(My)(....)/g, str);
regExpTest(/My(....)/g, str);
regExpTest("My(....)", str);    // 걍 문자열로 정규표현식 주면 global 로 동작
regExpTest(/aaaa/g, str);


console.log("\n[프로그램 종료]", '\n'.repeat(20));