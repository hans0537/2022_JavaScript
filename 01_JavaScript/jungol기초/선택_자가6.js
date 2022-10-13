const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let input = undefined;

rl.on('line', function(line){ 
    input = line.trim().split(/\s+/);
    rl.close(); // 입력완료시 close!
});

// 입력완료 close시 수행할 코드 등록
rl.on("close", function(){
    let s = input[0];
    let age = parseInt(input[1]);

    if(s == "F"){
        if(age >= 18) console.log("WOMAN");
        else          console.log("GIRL");
    }else{
        if(age >= 18) console.log("MAN");
        else          console.log("BOY");
    }
});
