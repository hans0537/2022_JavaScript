/*******************************
 * isogram : 중복글자 없는 단어
 * isogram 여부 판단하기 (true/false)
 */

const input = [
    "Dermatoglyphics", // -> true
    "programmer",      // -> false
    "Correct",         // -> false
    "isogram",         // -> true
    "abcdefghijk",     // -> true
    "apple"            // -> false
]

function isIsogram(str){
    return !str.toLowerCase()
               .split('')
               .some((e, i) => str.slice(i + 1).indexOf(e) != -1);
}

input.forEach(e => console.log(isIsogram(e)));