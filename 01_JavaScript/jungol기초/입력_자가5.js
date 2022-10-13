// 1야드(yd)는 91.44cm이고 1인치(in)는 2.54cm이다.

// 2.1야드와 10.5인치를 각각 cm로 변환하여 다음 형식에 맞추어 소수 첫째자리까지 출력하시오.​

const y = 91.44;
const i = 2.54;

console.log(` 2.1yd = ${(2.1 * y).toFixed(1)}cm`);
console.log(`10.5in =  ${(10.5 * i).toFixed(1)}cm`);
      
