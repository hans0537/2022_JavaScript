/*******************************
 * 가장 긴 단어 찾기
 */

const input = [
    "I am a Student",     // ->  Student
    "That elephant is big",  // -> elephant
    "Banana is delicious"   // -> delicious
]

function longestWord(str){
    return str.split(/\s+/).reduce((prev, cur) => {
        return prev.length < cur.length ? cur : prev;
    });

}

input.forEach(e => console.log(longestWord(e)));