/*******************************
 * 영어문장에서 각 단어 첫글자만 대문자 만들기
 */

const input = [
    "i am a PROGRAMMER",     // -> I Am A Programmer
    "THAT ELEPHANT IS BIG",  // -> That Elephant Is Big
]

function letterCapitalize(str){

    // 방법 1
    // let words = str.toLowerCase().trim().split(/\s+/);

    // for(let i = 0; i < words.length; i++){
    //     let first = words[i].charAt(0);
    //     let rest = words[i].slice(1);
    //     first = first.toUpperCase();

    //     words[i] = first + rest;
    // }

    // return words.join(' ');

    // 방법 2
    const result = [];
    str.split(/\s+/).forEach(e => {
        result.push(e[0].toUpperCase() + e.slice(1).toLowerCase());
    });
    return result.join(" ");
}

input.forEach(e => console.log(letterCapitalize(e)));