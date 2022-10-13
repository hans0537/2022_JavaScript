/*
    Number 타입
    JavaScript 의 숫자타입은 Number 타입 '오직 한가지'뿐이다
    Number 는 소숫점이 있을수도(실수) / 없을수도(정수) 있다
    Number 는 항상 64bit floating point 데이터로 저장된다.
    Number의 정밀도(precision)
        - 정수는 15자리까지 정확도 유지
        - 소수점 이하 17자리 정확도 유지
        - 실수간의 연산은 언제나 100% 정확하지 않다 (정밀도 문제)
    Number가 가질 수 있는 가장 큰 값은 1.8E308
    
    일반적으로 리터럴(literal) 로 Number 생성
        ex) 176, 0b101, 013, 0x0A ...

    JavaScript 에선 Number 뿐 아니라 모든 데이터가 내부적으로 object 로 다루어지기 때문에
    property 나 method (함수) 사용이 가능하다.

    NaN (Not a Number) : Number 연산이 안되는 경우 NaN 이 결과값으로 나온다.
    Infinity : 무한대 값

    https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Number
*/

let num1, num2, num3;

num1 = 10;
num2 = 3.14;
console.log(num1);
console.log(num2);


// 지수표기법 (exponential notation)
num1 = 123e5;
num2 = 123e-5;
console.log(num1);
console.log(num2);

// 정밀도 (precision)
num1 = 999999999999999; // 15자리 정수
num2 = 9999999999999999; // 16자리 정수

console.log(num1);
console.log(num2);

// 실수간의 연산은 100% 정확하지 않다 (정밀도!)
num1 = 0.2;
num2 = 0.1;
console.log(num1 + num2 == 0.3);

console.log(123 === 123.0); // true

// NaN (Not a Number)
console.log('-'.repeat(20))
console.log('[NaN]');
// isNaN(), NaN

num1 = 100 / "Apple";
num2 = 100 / "10";
console.log(num1, num2);
console.log(typeof (num1));
console.log(isNaN(num1), isNaN(num2));

// NaN 과의 산술연산 결과는 NaN 이다
num1 = NaN;
num2 = Number.NaN;
console.log(num1, num2);
console.log(num1 + 5);
console.log(num1 + "5"); // "NaN5"  <- 문자열 연결

/********************************** 
 * 진법 리터럴
 *  0x 로 시작 16진법(hexadecimal)
 *  0 으로 시작 8진법 (octal)
 *  0b 로 시작 2진법 (binary)
 */
console.log('-'.repeat(20))
console.log('[진법리터럴, toString]');

num1 = 0xFF; // 16진법
console.log(num1);

num1 = 010; // 8진법
console.log(num1); // 8

num1 = 0b10; // 2진법
console.log(num1);

// toString()
// 기본적으로 Number 출력시는 10진법(base 10) 으로 출력한다
num1 = 24;
let str = num1.toString();

console.log(num1, typeof (num1));
console.log(str, typeof (str)); // "24"

// 24.toString();   // 숫자 리터럴에 메소드 붙이는건 불가.  괄호 사용하면 가능..
(24).toString();
(9.7).toString();

// 진법에 따른 문자열 변환 toString(radix)

num1 = 76;
console.log(num1);
console.log(num1.toString(2));
console.log(num1.toString(8));
console.log(num1.toString(16));

/*******************
 * 일반적으로 Number 는 숫자 literal 을 통해 생성되나,
 * object 로서 Number 를 생성할수 있다  (new 사용)  <-- 매우 비추함!  예측하지 못하는 동작과 성능 이슈
 *  
 */
console.log('-'.repeat(20));
console.log('[Number() 로 생성하기]');

num1 = 123;
num2 = new Number(123);
num3 = new Number(123);
console.log(num1 + num2); // 246  산술연산은 되나...
console.log(typeof num1, typeof num2); // number object
console.log(num1 == num2); // true
console.log(num1 === num2); // false

console.log(num2 == num3); // false  ★JS에선 object 끼리의 비교는 언제나 false!!
console.log(num2 === num3); // false


/*********************************
 * Number 의 메소드(method) 들 
 */
console.log('-'.repeat(20));
console.log('[Number 의 메소드들]');


// toFixed(n)
//  소숫점 이하 n자리까지 표현한 '문자열' 결과  (이하 반올림)
//  https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed

num1 = Math.PI;
console.log(num1);
console.log(num1.toFixed(2));
console.log(num1.toFixed(3));


// toExponential() 메서드는 숫자를 지수 표기법으로 표기해 반환합니다.
//  https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential

num1 = 123456;
console.log(num1);
console.log(num1.toExponential());
console.log(num1.toExponential(2));

// toPrecision(n)
//  Number 객체를 지정된 정밀도로 나타내는 문자열을 반환한다.
//  n : 유효 자릿수
// https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision

num1 = 123.456;
console.log(num1);
console.log(num1.toPrecision(4));
console.log(num1.toPrecision(8));

num1 = 0.000123;
console.log(num1);
console.log(num1.toPrecision());
console.log(num1.toPrecision(5));
console.log(num1.toPrecision(2));
console.log(num1.toPrecision(1));

/****************************************
 * number 로 변환하는 방법 3가지
 * 
 *  Number()
 *  parseInt()
 *  parseFloat()
 * 
 *  다양한 경우에서 사용자가 입력한 값은 문자열(string) 타입으로 입력된다
 * 이의 산술연산을 하거나 Number 메소드를 적용하려면 number로 변환해야 한다
 */
console.log('-'.repeat(20));
console.log('Number 변환하기');

num1 = "3.142592";
//console.log(num1.toFixed(2));   // toFixed() 는 Number 의 메소드이기 때문에 문자열에선 사용 불가!
console.log(parseFloat(num1).toFixed(2)); // 3.14
console.log(parseInt(num1)); // 3

num2 = "hello";
console.log(parseFloat(num2)); // NaN, 에러 발생 안함

console.log(parseInt("-10"));
console.log(parseInt("-10.33"));
console.log(parseInt("10"));
console.log(parseInt("10.33"));
console.log(parseInt("10 20 30")); // 10 (맨앞의 토큰 문자가 변환)
console.log(parseInt("55 years")); // 55 변환됨
console.log(parseInt("year 2022")); // NaN

console.log(parseFloat("10"));
console.log(parseFloat("10.33"));
console.log(parseFloat("10 20 30"));
console.log(parseFloat("10 years"));

// Number() '함수' 사용하여 Number 변환하기
console.log(Number("10"));
console.log(Number("    10"));
console.log(Number("10   "));
console.log(Number("  10 "));
console.log(Number("10.33"));
console.log(Number("10 33"));
console.log(Number("10,33"));
console.log(Number("John"));

console.log(Number(true));   // 1
console.log(Number(false));  // 0

// 날짜/시간 표현하는 Date 객체도 Number() 사용하여 변환된.
console.log(new Date());
console.log(Number(new Date()));   // 1970. 1. 1 00:00:00.0000  이후 경과된 시간 (ms)
console.log(Number(new Date("1970-01-02")));

/***********************************  
 * Number 의 property
 *   https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Number#static_properties
 * 
 * Number 의 static 메소드
 *   https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Number#%EC%A0%95%EC%A0%81_%EB%A9%94%EC%86%8C%EB%93%9C
 */
 console.log('-'.repeat(20));
 console.log('Number 의 property, static 메소드');
 
 console.log(1 / 0);
 console.log(Number.POSITIVE_INFINITY);
 console.log(Number.NEGATIVE_INFINITY);
 
 // Number.isInteger() 정수 여부 확인
 console.log(Number.isInteger(3));   // true
 console.log(Number.isInteger(3.0)); // true
 console.log(Number.isInteger(3.1)); // false
 
 // Number 가 취할수 있는 값의 min ~ max
 console.log(Number.MAX_VALUE);
 console.log(Number.MIN_VALUE);
 




console.log("\n[프로그램 종료]", '\n'.repeat(10));
