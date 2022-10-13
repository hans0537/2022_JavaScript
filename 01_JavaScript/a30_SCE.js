// 생각해보자
let result;

// &&, ||
result = true && false;
console.log(result);
result = true || false;
console.log(result);

result = true && 'hello';
console.log(result);

result = false && 'hello';
console.log(result);

result = 'hello' || 'byte';
console.log(result);

result = 0 || 200;
console.log(result);

result = null || 'good';
console.log(result);

/*****************************************************
 * Short Circuit Evaluation (단축평가)  (혹은 Lazy Evalutaion 이라고도 한다)
 * 
 * 표현식1 && 표현식2
 *  표현식1 이 Falsy 이면 && 의 결과값은 표현식1
 *  표현식1 이 Truthy 이면 && 의 결과값은 표현식2
 * 
 * 표현식1 || 표현식2
 *  표현식1 이 Falsy 이면 && 의 결과값은 표현식2
 *  표현식1 이 Truthy 이면 && 의 결과값은 표현식1
 */

let n = 5;

if (n % 5 == 0)
    console.log('5의 배수');

// 간단한 if문은 && 또는 || 연산자로 SCE 활용 가능
(n % 5 == 0) && console.log('5의 배수');

n = 3;
(n % 5 == 0) || console.log('5의 배수가 아닙니다.');

/*****************************************
 * SCE 는 
 * React 등에서 '조건부 렌더링' 등을 할때 많이 사용하는 문법이다
 * 특정 값이 유효할때만 수행해야 하는 상황
 */
console.log('-'.repeat(20));

// 다음과 같은 함수가 정의되었다고 하자.
let getName = function (animal) {
    return animal.name;
}

let dog = {
    name: "흰둥이"
};
console.log(getName(dog));

dog = null;
// console.log(getName(dog));   // 에러발생

getName = function (animal) {
    // 따라서 아래와 같이 하는게 안전하다.
    return animal && animal.name;
}
console.log(getName(dog)); // null... 일단 에러나진 않는다.

// 혹은
dog = {
    age: 5
};
console.log(getName(dog)); // undefined .. 일단 에러나진 않지만...

/*********************************
 * || or 연산의 경우
 * 
 * || 연산자로 코드 단축시키기
 * || 연산자는 만약 어떤 값이 Falsy 하다면 대체로 사용 할 값을 지정해줄 때 매우 유용하게 사용 할 수 있습니다.
 */
console.log('-'.repeat(20));

// 예를 들어서 다음과 같은 코드가 있다고 가정해봅시다.
dog = {
    name: ""
};

getName = function (animal) {
    const name = animal && animal.name; // animal  체크
    return name || "이름이 없는 동물입니다"; // .name 체크
}

console.log(getName(dog));
console.log(getName({age: 34}));

// 함수 기본 parameter 와 같은 동작도 SCE로 구현 가능

const calcCircleArea = function(r){
    
}

console.log("\n[프로그램 종료]", '\n'.repeat(5));