/*******************************
 * 문자열 시프팅 차이값
 */

const input = [
// [first, second]
    ["hello", "hello"],    // 0
    ["hello", "ohell"],    // 1
    ["hello", "lohel"],    // 2
    ["hello", "llohe"],    // 3
    ["hello", "elloh"],    // 4
    ["hello", "elohl"],    // -1
    ["banana", "banana"],    // 0
    ["banana", "nabana"],    // 2
    ["banana", "anaban"],    // 3
    ["banana", "nanaba"],    // 4
    ["banana", "abanan"],    // 1
    ["banana", "ananab"],    // 5
    ["banana", "naabna"]     // -1

]

function shiftedDiff(first, second){

    // 방법 1)

    // let cnt = 0;

    // while(true){
    //     if(first === second) break;

    //     if(cnt === first.length) {
    //         cnt = -1; 
    //         break;
    //     }
    //     first = first[first.length - 1] + first.slice(0, first.length - 1);
    //     cnt++;
    // }
    // return cnt;


    // 방법 2)
    // cnt = first.split('').reduce((a, b) => {
    //     temp = first.slice(a) + first.slice(0, a);
    //     if(temp === second) {
    //         return a;
    //     }else {
    //         a -= 1;
    //         return a;
    //     }
    // }, first.length);

    // return (cnt == 0) ? -1 : first.length - cnt;

    // 방법 3)
    return first.length == second.length ? (second + second).indexOf(first) : -1;
}

input.forEach(e => console.log(shiftedDiff(e[0], e[1])));