// 반지름은 입력받아
// 원의 둘레를 계산하여 리턴하는 함수를 작성하세요
// 정의, 호출

const calcCirclePerimeter = (radius) => {
    return 2 * Math.PI * radius;
}

let r, p;

r = 10;
p = calcCirclePerimeter(r);
console.log(`반지름 ${r} 인 원의 둘레는 ${p.toFixed(2)}`);

r = 8;
p = calcCirclePerimeter(r);
console.log(`반지름 ${r} 인 원의 둘레는 ${p.toFixed(2)} \n`);

// 반지름은 입력받아
// 원의 면적를 계산하여 리턴하는 함수를 작성하세요
// 정의, 호출 

const calcCricleSize = (r) => Math.PI * r * r;

r = 5;
p = calcCricleSize(r);
console.log(`반지름 ${r} 인 원의 넓이는 ${p.toFixed(2)}`);

r = 100;
p = calcCricleSize(r);
console.log(`반지름 ${r} 인 원의 넓이는 ${p.toFixed(2)} \n`);

// 직사각형의 '가로', '세로' 의 크기를 입력받아
// 직사각형의 넒이를 구하여 리턴하는 함수를 작성하세요
// 정의, 호출

const calcReqsize = (w, h) => w * h;

let w, h

w = 10;
h = 5;

p = calcReqsize(w, h);
console.log(`가로 ${w} 세로 ${h} 인 직사각형의 넓이는 ${p} \n`);

// 직각삼각형의 '밑변'과 '높이'가 주어졌을때
// 빗변의 길이를 구하여 리턴하는 함수를 작성하세요
// 정의, 호출

const calcTriSize = (w, h) => Math.sqrt(w * w + h * h);


w = 3;
h = 4;
p = calcTriSize(w, h);
console.log(`가로 ${w} 세로 ${h} 인 직각삼각형의 빗변은 ${p.toFixed(2)} \n`);


// 반지름은 입력받아
// 원의 '둘레'와 '면적'을 계산하여 리턴하는 함수를 작성하세요
// 정의, 호출 


const calcCircle  = (r) => [calcCirclePerimeter(r), calcCricleSize(r)];

r = 13;
let result = calcCircle(r);

console.log(`반지름 ${r} 인 원의 둘레는 ${result[0].toFixed(2)} 면적은 ${result[1].toFixed(2)} \n`);

console.log("\n[프로그램 종료]", '\n'.repeat(20));