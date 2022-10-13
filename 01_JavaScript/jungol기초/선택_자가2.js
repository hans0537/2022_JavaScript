// 정수값 여러개 입력받기
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let input = undefined;

// 입력시 줄바꿈이 입력될때 마다 수행되는 코드 등록
rl.on('line', function(line){ // 사용자가 입력한 line (string)
    input = line.trim().split(/\s+/).map((e) => parseInt(e));
    rl.close(); // 입력완료시 close!
});

// 입력완료 close시 수행할 코드 등록
rl.on("close", function(){
    
    let b = input[1] + 100 - input[0];
    console.log(b);

    if(b > 0) console.log("Obesity");
    
});
