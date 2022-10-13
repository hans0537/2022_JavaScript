/*
http://jungol.co.kr/bbs/board.php?bo_table=pbank&wr_id=27&sca=1060
127 : 반복제어문1 - 형성평가3 

0 부터 100 까지의 점수를 계속 입력받다가 범위를 벗어나는 수가 입력되면 
그 이전까지 입력된 자료의 합계와 평균을 출력하는 프로그램을 작성하시오. 
(평균은 반올림하여 소수 첫째자리까지 출력한다.)

[입력예]
55 100 48 36 0 101

[출력예]
sum : 239
avg : 47.8
*/

const readline = require('readline');
 
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let input = []  // 배열 준비
rl.on("line", function(line){
    input = line.split(/\s+/).map((e) => parseInt(e));
    rl.close();
})
 
rl.on("close", function(){

    let i = 0, n ;
    let sum = 0;  // '합계'

    while(true){
        n = input[i];
        if(0 > n || n > 100) break;  // 범위를 벗어나면 입력 종료
        sum += n;  // 합계 누적
        i++;
    }
    // 결과 출력
    console.log(`sum : ${sum}`);
    console.log(`avg : ${(sum / i).toFixed(1)}`);    

})
