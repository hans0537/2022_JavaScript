/*
    object

    property : value 쌍으로 구성된 데이터

    {property:value, property:value, ...}

    property 는 중복될수 없다.
    value 는 어떠한 타입도 될수 있다.
        : number, string, array, function, object..

    사실 JavaScript 의 모든 데이터의 실체는 object 이다.
    
    ※일반적으로  object 변수는 는 const 로 선언한다
    그러나 이번단원에서 진도 편의상 let 등을 사용하기도 하겠습니다
 */

let obj1, obj2, obj3, result;

const car = {type: "Fiat", model: "500", color: "white"};

console.log(car);
console.log(car.toString());
console.log(typeof car);

console.log("제 자동차는 " + car);
console.log(`제 자동차는 ${car}`);
console.log("제 자동차는 ", car);

// empty object
obj1 = {};    // <- null 아님
console.log(obj1);

/* object 의 property 사용하기
    방법1 : objectName.propertyName
    방법2 : objectName["propertyName"] 
*/
console.log('-'.repeat(20));
console.log('[object 의 property]');

const person = {
    firstName: "John",
    lastName: "Doe",
    age: 50,
    eyeColor: "blue",
};

console.log(person.firstName);
console.log(person['firstName']);
// console.log(person[firstName]); // 에러
console.log(typeof person.firstName);
console.log(person.age);
let key = 'age';  // property 를 문자열로 준비되었다면 아래와 같이 접근가능
console.log(person[key]);

let a = 'firstName', b = 'age';
console.log(`${person[a]} is ${person[b]} years old`);

// 없는 property 를 접근하면?  undefined
console.log(person.address);

// property 값 변경하기
console.log(person);
person.firstName = "Jane";
console.log('변경후', person);

// person 을 const 로 선언 했는데 property 변경 가능?  
// person 을 바꾸지 못한다는 거지 person 의 property 를 변경 못한다는 게 아니다
// person = {name: 'hello'};   <-- person 값 자체를 변경하려 하면 이게 에러다!

// property 추가하기
person.email = 'Jane@mail.com';
console.log('추가후', person);

// property 삭제하기  delete 연산자
// https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/delete

delete(person.email);
console.log('삭제후', person);

// property 는 중복될수 없다!
obj1 = {
    score: 100,
    'score': 200,   // property 는 문자열로 표기해도 동작.
    'score': 300,
    Score: 400,  // property name 은 대소문자 구분
};
console.log(obj1);

// value 는 어떠한 타입도 가능하다!
console.log('-'.repeat(20));
console.log('[object 의 value]');

obj2 = {
    name: 'John',
    age: 34,
    height: 172.3,
    married: false,
    score: [100, 97, 33],
    family: {
        spouser: 'Jane',
        children: ['Clark', 'Steve', 'Charlie']
    },
};

console.log(obj2);
console.log(obj2.name); // 'John'
console.log(obj2.age);  // 34
console.log(obj2.married);  // false
console.log(obj2.family.spouser); // Jane ??
console.log(obj2.family.children[1]);  // 'Steve'
console.log(obj2['family']['children'][1]); // 
console.log(obj2.score[0]); // 100

/****************************************************
 * object method 와 this
 * object 의 value 는 어떠한 타입도 가능하다
 * 즉, 함수도 object 의 property value 로 가능하다
 * object 의 property 함수를 메소드(method) 라 부른다.
 * object 안에서 this 는 '자기자신객체', 즉, 해당 object 가 참조(혹은 바인딩) 된 객체를 말한다
 */
console.log('-'.repeat(20));
console.log('[object method 와 this]');

obj2 = {
    firstName: "John",
    lastName: 'Doe',
    id: 5566,

    fullName: function(){
        return `${this.id} ${this.firstName} ${this.lastName}`;
    }
};

console.log(obj2.fullName());

// JavaScript 에서 this 는 '특정 object' 를 참조하게 되어 있다.
// '어떤 object 를 참조?' 하냐는 this 가 사용(호출) 되는 시점마다 '다르다'.
// (JS  위 this 가 다른 언어의 this에 비해 직관적으로 이해하기 어려운면이 있습니다)
// 이후 진도 나가면서 this가 등장할때마다 this가 무엇을 참조하는지 눈여겨 봅시다. 
// 참고: https://www.w3schools.com/js/js_this.asp


// ---------------------------------------------------------------
console.log();

let x = {
    name: "kim",
    age: 34,
    height: 172.3,
    score: [94, 35, 79],   // 3과목 성적
    total: 0,

    // 도전
    getTotal: function(){
        for(let i = 0; i < this.score.length; i++){
            this.total += this.score[i];
        }
        return this.total;
    },

    getAvg: function(){
        return (this.total / this.score.length).toFixed(2);
    },

};

console.log(x.getTotal()); // 총점
console.log(x.getAvg());  // 평균

console.log('-'.repeat(20));
// ----------------------------------------------------------

// 배열도 어떠한 타입의 원소 가능!
x = [
    "Kim", 34, 172.3,
    {kor: 94, eng: 35, math: 79},   // 3과목 점수
    [
        {
            address: "서울",
            year: 1998,
        },
        {
            address: "부산",
            year: 2012,
        },
    ],
    function(){
        return 'Hello';
    },
    function(){
        return this[3].kor + this[3].eng + this[3].math;
    },
    function(){
        return this[6]() / 3;
    }
],

// x의 원소의 갯수
console.log(x.length);
console.log(x);
console.log(x[0], x[1], x[2]);
console.log(x[3].kor);
console.log(x[4][0].year);
console.log(x[5]());

// 도전
console.log(x[6]());  // 총점
console.log(x[7]());  // 평균

console.log("\n[프로그램 종료]", '\n'.repeat(10));






























