// 실수 2개와 한 개의 문자를 입력 받아 출력하되 실수는 반올림하여 소수 둘째자리까지 출력하는 프로그램을작성하시오.

const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let input = [];
let cnt = 0;

rl.on('line', function(line){
    
    if(isFinite(line.trim())) {
        input.push(parseFloat(line.trim()).toFixed(2)); 
        cnt++;
    }else{
        input.push(line.trim()); 
        cnt++;
    }
    
    if(cnt === 3) rl.close();
});

rl.on("close", function(){
    for(let i = 0; i < 3; i++){
        console.log(input[i]);
    }
});
