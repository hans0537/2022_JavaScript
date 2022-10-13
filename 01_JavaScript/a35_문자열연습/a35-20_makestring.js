/*******************************
 * 단어의 앞글자로만 만들어진 문자열 생성
 */

const input = [
    "The community at Code States might be the biggest asset", // -> TcaCSmbtba
    "i am a PROGRAMMER",     // -> iaaP
    "THAT ELEPHANT IS BIG",  // -> TEIB
]

function makeString(str){
    return str.split(/\s+/).reduce((acc, cur) => acc += cur[0], '');    
}

input.forEach(e => console.log(makeString(e)));