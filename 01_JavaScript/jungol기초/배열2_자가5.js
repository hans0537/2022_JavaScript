const { Console } = require('console');
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let input = undefined;
let arr1 = [];
let arr2 = [];
let lineNum = 0;

console.log('first array');

rl.on('line', function(line){
    input = line.trim().split(/\s+/).map((e) => parseInt(e));
    if(lineNum < 2) arr1.push(input);
    else if (lineNum < 4) arr2.push(input);
    lineNum ++;

    lineNum == 2 && console.log('second array');
    lineNum == 4 && rl.close();
});


rl.on("close", function(){ 
    // console.log('arr1', arr1);
    // console.log('arr2', arr2);
    for(let i = 0; i < arr1.length; i++){
        result = [];
        for(let j = 0; j < arr1[i].length; j++){
            result.push(arr1[i][j] * arr2[i][j]);
        }
        console.log(result.join(' '));
    }
});
