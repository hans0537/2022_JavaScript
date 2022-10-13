/*******************************
 * 연속되지 않은 글자 출력 unique in order
 */

const input = [
    "all good tree",   // [a,l, ,g,o,d, t,r,e]
    "Apple is soooo deliicioouus"   // [A,p,l,e, ,i,s, ,s,o, ,d,e,l,i,c,i,o,u,s]
]

function uniqueInOrder(str){

    return str.split('').reduce((acc, cur) => {
        (acc[acc.length - 1] != cur) && acc.push(cur);
        return acc;
    }, []);
    
}

input.forEach(e => console.log(uniqueInOrder(e)));