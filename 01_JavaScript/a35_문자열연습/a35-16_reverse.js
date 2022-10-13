/*******************************
 * 문자열 좌우 반전
 */

const input = [
    "abcde",            // edcba
    "I am a Student",   // tnedutS a ma I
]

function reverse(str){
    // 방법 1) reverse 사용
    // return str.split('').reverse().join('');
    
    // 방법 2)
    return str.split('').reduce((acc, cur) => cur + acc, '');
}

input.forEach(e => console.log(reverse(e)));