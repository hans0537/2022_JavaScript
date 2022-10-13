/*
*  ▶ 함수 (function)
*   자주 반복되어 수행할 코드 덩어리(?) 들을 
*    1. 함수(function)로 '정의' 하고 
*    2. 필요할때마다 정의된 함수를 '호출'하여 사용한다.
*
*  ▶ 함수 정의 (function definition)
*
*    [함수정의형식]
*    function 함수이름(매개변수들..) 
*    {  
*       함수본체 (수행 코드들...)
*    }
*     
*
*  ▶ 함수 호출 (function call, function invocation)
*     [함수호출형식] 
*       함수이름(매개변수들..);
*     
*     - A() 함수실행중 B() 함수를 호출(call)하게 되면
*         호출한 함수 A()은 잠시 멈추고   (--> 호출한함수: caller 라고도 함)
*         호출된 함수 B()의 실행을 시작합니다 (--> 피호출함수: callee 라고도 함)
*         B()의 실행이 끝나면 호출한 함수 A()로 실행이 돌아옵니다. 
* 		  이를 '리턴 return' 한다 합니다 ↓
*   
*  ▶ return (리턴, 반환) 
*       함수가 호출되어 함수내 코드실행이 끝나면, 호출한쪽으로 실행이 돌아옵니다.
*       return 키워드를 사용하여 명시적으로 리턴할수도 있습니다. (함수는 바로 종료됩니다)
*       return 키워드가 없어도, 함수실행 끝나면 자동으로 리턴합니다.
*      
*       return 시 어떤 값을 호출한쪽(caller) 에 돌려줄수 있다.
*          return 값:
*
*  ▶ 함수 매개변수(parameter), 함수 인자(argument)
*      매개변수는 함수 정의할때 명시하는 변수 (그 함수의 지역변수로서 동작한다)
*      인자 는 함수 호출할때 입력하여 매개변수에 전달하는 값
*      함수 호출시 호출인자가 매개변수에 '복사' 되어 호출한 함수 수행된다.
*      ※ 두 용어는 혼용되어 사용되곤 한다.
*/

// 함수를 사용해야 하는 이유
console.log('안녕하세요');
console.log('제 이름은 봉지원 입니다');

console.log('안녕하세요');
console.log('제 이름은 설현아 입니다');

console.log('안녕하세요');
console.log('제 이름은 이청하 입니다');

console.log('안녕하세요');
console.log('제 이름은 김인진 입니다');


/*
 * 프로그래밍에서 동일한(혹은 거의 비슷한) 내용의 코드가 반복될때가 있다.
 * 바로 이러한 코드 낭비를 없애기 위해
 * 반복되는 코드를 묶어서 하나의 함수로 정의해 놓고 사용하는 것이다
 * 
 * 즉, 반복되는 부분이 있을 경우 "반복적으로 사용되기에 재사용할만한 가치가 있는 부분"을 
 * 한 코드 덩어리로 묶어서 
 *  1. 어떤 입력값을 주었을 때, (매개변수)
 *  2. 어떠한 일을 수행하고,  (본체)
 *  3. 어떤 결과값을 돌려준다" (리턴값) 라는식의 
 * 함수로 작성하는 것이 일반이다.
 */
console.log('-'.repeat(20));
// 함수 정의
// 함수 이름 : sayAnthem
function sayAnthem(){
    console.log("동해물과 백두산이");
    console.log("마르고 닳도록");
    console.log("하느님이 보우하사");
    console.log("우리나라 만세");
}

// 정의했다고 뭔가 실행된는건 아니다.

// 함수 호출
sayAnthem();
sayAnthem();
sayAnthem();
sayAnthem();

console.log(sayAnthem)  // [Function: sayAnthem]
console.log(sayAnthem.toString());  // function sayAnthem() { .... }
console.log(typeof(sayAnthem));  // function

// 함수정의
// 매개변수 있는 함수 정의
function sayName(name){
    console.log("안녕하세요");
    console.log(`제 이름은 ${name} 입니다`);
}

// 함수 호출
sayName('김수영');
sayName('배민지');

// JS 에선 매개변수가 정의된 함수를 호출할때 인자 값을 지정하지 않으면
// undefined 값이 전달된다.
sayName();
sayName(123);

// JS 에선 함수 정의시 지정된 매개변수보다 더 많은 인자값으로 호출하여도 에러 발생하지 않는다.
sayName('김병제', '경기도 가평군');

// sayAge 함수 정의
function sayAge(age){
    console.log('제 나이는요...');
    console.log(`${age}살 입니다~`);
}

// 호출
sayAge(100);
sayAge(23);
sayAge(77);

// 함수가 또 다른 함수 호출 가능
function sayHello(name, age){
    console.log('-'.repeat(20));
    sayName(name);
    sayAge(age);
    console.log('-'.repeat(20));
}

sayHello('토르', 1000);
sayHello('김병제', 21);

/*********************************************
 * 함수 호출 관련 디버깅 명령
 *  step into : 실행할 함수 내부로 이동
 *  step out : 실행중인 함수 리턴까지 진행
 * 호출스택 (call stack) : 함수 호출관계 모니터링
 */
// TODO


/* ********************************************
 * return [값]
 *  -- 함수 종료
 *  -- 호출한 쪽으로 '값 하나' 을 돌려준다 
 */
console.log('-'.repeat(20));
console.log('[return]');

function codeEveryday1(){
    console.log('자바스크립트 열공중');
    console.log('JavaScript is fun!');
    console.log('You need JavaScript');
    return;   // 마지막 문장 실행후에는 return 이 진행된다.  (마지막의 return 은 생략 가능)
}
codeEveryday1();

console.log();

function codeEveryday2(){
    console.log('You need JavaScript');
    console.log('자바스크립트 열공중');
    return;   // 여기서 함수 종료하고 리턴한다
    console.log('JavaScript is fun!');  // 실행 안된다.
}
codeEveryday2();


// ----------------------------------------------------
// JS 에선 함수도 '데이터'다

// 일반적으로 JS 에선 함수를 아래와 같이 정의하는 것을 선호한다
// 상수 = function() 객체(이름없는 함수객체)
const sayHello2 = function(name, age){
    console.log('-'.repeat(20));
    sayName(name);
    sayAge(age);
    console.log('-'.repeat(20));
};

sayHello2('김인진', 31);
console.log(typeof sayHello2);

const sayHello3 = sayHello2;  // 변수 대입하듯이 함수도 가능!
sayHello3('박윤수', 24);

// ----------------------------------------------------
// 리턴값 갖는 함수 정의
//  입력: 두개의 수를 입력 받아서 
//  수행: 덧셈을 수행한뒤
//  리턴: 덧셈 결과를 리턴

const add = function(a, b){
    let result = a + b;
    return result;
};

add(10, 20);

let out = add(10, 20);
console.log(`out = ${out}`);
console.log(`out = ${add(150, 40)}`);  // add() 의 리턴값을 받아서 출력
console.log(`out = ${add(10, add(10, 20))}`);

//                      add(10, 20)
//                          ↓  return 30
//                  add(10, 30)
//                      ↓ return 40
//       console.log(... 40)    

// return 값이 없거나, return 이 명시 안된 경우는 undefined 를 리턴한다
console.log(codeEveryday2());
console.log(sayHello3('박윤수', 24));


// 함수 정의와 동시에 호출하기
(function(){
    console.log('hello 익명함수');
})();

(function(a, b){
    console.log(`${a} + ${b} = ${a + b}`);
})(10, 13);


console.log("\n[프로그램 종료]", '\n'.repeat(20));