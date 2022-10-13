// 정수값 여러개 입력받기
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

let input = [];   // 
let lineNum = 1;

// 입력시 줄바꿈이 입력될때 마다 수행되는 코드 등록
rl.on('line', function(line){  // 사용자가 입력한 line (string)
    process.stdout.write(`${lineNum}class? `);
    input.push(line.trim()
                   .split(/\s+/)
                   .map((e) => parseInt(e)));
    lineNum++;
    (lineNum == 5) && rl.close();  // 입력완료시 close!
});

// 입력완료 close시 수행할 코드 등록
rl.on("close", function(){
    input.forEach((e, i)=> {
        let sum = e.reduce((a, b) => a + b);
        console.log(`${i + 1}class : ${sum}`);
    });
});
