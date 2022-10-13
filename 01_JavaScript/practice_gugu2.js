const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let input = undefined;
process.stdout.write("열의 개수: ");  

rl.on('line', function(line){
    input = line.trim();
    rl.close(); 
});

rl.on("close", function(){
    let row = parseInt(input);

    let dan, mul, cnt = 8;

    for(dan = 2; dan < 10; dan += row){
        for(mul = 1; mul < 10; mul++){
            let tmp = dan;

            if(cnt >= row){
                for(let i = 0; i < row; i++){
                    process.stdout.write(`${tmp} x ${mul} = ${tmp * mul} \t`);
                    tmp++;
                }
            }else{
                for(let i = 0; i < cnt; i++){
                    process.stdout.write(`${tmp} x ${mul} = ${tmp * mul} \t`);
                    tmp++;
                }
            }
            console.log();
        }
        cnt -= row;
        console.log();
    }
});
