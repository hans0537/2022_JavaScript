const { Console } = require('console');
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let input = [];
const NUM_STU = 5;

rl.on('line', function(line){
    input.push(line.trim().split(/\s+/).map((e) => parseInt(e)));
    (input.length == NUM_STU) && rl.close();
});

rl.on("close", function(){ 
    let cnt = 0;
    for(e of input){
        avg = e.reduce((a, b, idx, arr) => {
            let result = a + b;
            (idx === arr.length - 1) && (result /= arr.length);
            return result;
        }, 0);

        if(avg >= 80) {
            console.log('pass');
            cnt++;
        }else {
            console.log('fail');
        }
    }
    console.log(`Successful : ${cnt}`);
});

/*
rl.on("close", function(){
    // console.log('입력하신 값은:', input);

    let success = 0;  // 합격자수

    input.forEach(score => {
        let sum = score.reduce((a, b) => a + b); // 총점
        let avg = sum / score.length;  // 평균

        // console.log(`sum: ${sum}, avg: ${avg}`);

        if(avg >= 80){
            console.log('pass');
            success++;
        } else {
            console.log('fail');
        }
    });
    console.log(`Successful : ${success}`);
});
*/