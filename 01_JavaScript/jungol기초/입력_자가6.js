// 키를 입력받아 출력하는 프로그램을 작성하라.
// (입력할때 "height = " 문장을 먼저 출력하고 키를 입력 받아야 합니다.)

const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let input = undefined;

process.stdout.write("height = ");
rl.on('line', function(line){ 
    input = line.trim();
    rl.close(); 
});

rl.on("close", function(){ 
    console.log(`Your height is ${input}cm.`);
});
