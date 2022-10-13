/*********************************************
 * every(판별함수)  ES5 등장
 *   배열 안의 *모든* 요소가 주어진 판별 함수를 통과하는지 테스트
 * 
 *   판별함수의 리턴값은 Truthy / Falsy 를 리턴해야 한다
 * 
 *   판별함수의 매개변수 (element, index, array)
 * 
 *   리턴값은 true / false
 *   
 *   값이 거짓이 나오면 바로 리턴하고 종료 그전까진 다 돈다
 * 
 * https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/every
 */
console.log('[every]')
let arr1 = [1, 30, 39, 29, 10, 13];
console.log(arr1.every(e => e < 40)); // 배열안의 모~든 원소가 40 미만인가?

// 배열안의 모~든 원소 짝수인가?
console.log(arr1.every(e => e % 2 == 0));

console.log([12, 5, 8, 170, 44].every(e => e > 10));

/**********************************************
 * 배열.some(판별함수)
 *  배열 안의 어떤 요소라도 주어진 판별 함수를 통과하는지 테스트
 * 
 *  판별함수의 리턴값은 Truthy / Falsy 를 리턴해야 한다
 * 
 *  판별함수의 매개변수 (element, index, array)
 * 
 *  리턴값은 true / false
 * 
 *  값을 찾으면 바로 리턴 하고 종료
 * 
 * ES5 소개
 * https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/some
 */
console.log('-'.repeat(20));
console.log('[some()]');
arr1 = [1, 2, 3, 4, 5];

// 배열안에 짝수를 하나라도 갖고 있나?
// console.log(arr1.some(e => e % 2 == 0));

console.log(arr1.some((e, i) => {
    console.log(`[${i}]: ${e}`);
    return e % 2 == 0;
}));

console.log("\n[프로그램 종료]", '\n'.repeat(20));

