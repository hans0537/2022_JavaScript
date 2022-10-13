// 세 개의 실수를 입력 받아 반올림하여 소수 셋째 자리까지 출력하는 프로그램을 작성하시오.

const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let input = [];
let cnt = 0;

rl.on('line', function(line){ 
    input.push(line.trim());
    cnt ++;
    if(cnt === 3) rl.close();
});

rl.on("close", function(){
    for(let i = 0; i < 3; i++){
        console.log(parseFloat(input[i]).toFixed(3));
    }
});