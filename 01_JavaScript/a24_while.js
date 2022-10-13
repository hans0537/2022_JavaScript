/*
 * while 순환문
 * 
 * [구문]
 *  while(조건식) {
 *        ...
 *  }
 * 
 * 조건식이 '참' 인 동안 while 블럭 반복
 * 
 */

let count = 1; 
while(count <= 10){
    console.log(count);
    count++;
}
console.log('while 종료후', count);

// 10, 9, 8, .....  1 까지 출력
count = 10;
result = [];
while(count > 0){
    result.push(count);
    count--;
}
console.log(result.join(','));

// 구구단 2단
console.log('-'.repeat(20));
let n = 1;
while(n <= 9){
    console.log(`2 x ${n} = ${2 * n}`);
    n++;   // 빼먹으면 무한루프
}


console.log("\n[프로그램 종료]", '\n'.repeat(20));





























