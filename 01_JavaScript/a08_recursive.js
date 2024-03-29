/********************************************************
 * 재귀 호출 (recursive call)
 * 함수가 내부에서 자기 자신을 다시 호출하는 것.
 * 
 * 장점:
 * 	복잡한 문제를 간단하고 추상화하여 논리적으로 작성.
 * 
 * 단점 & 주의 :
 *  JS 에선 함수가 호출될때 마다 Execution Context(실행 컨텍스트) 라는 것이 생성됨.
 *     ※ 참고: https://poiemaweb.com/js-execution-context
 *  메모리 부담 발생 
 * 	무한히 재귀호출 할수 없다. --> (Stack Overflow 발생)
 *  따라서 재귀호출은 '종료조건'이 반드시 필요하다.
 * 
 */

// function recursive(n){
//     console.log(n);
//     recursive(n + 1);
//     console.log('종료');
// }
// recursive(0);

/***************************************
 * factorial
 *    0! = 1
 *    n! = n * (n - 1) * (n - 2) * ... * 0!
 *    n! = n * (n - 1)! <-- 재귀적인 정의
 */

 function factorial(n){

    if(n == 0) return 1;    
    return n * factorial(n - 1);   // 재귀호출
}

for(let i = 1; i <= 10; i++){
    console.log(`${i}! = ${factorial(i)}`);
}