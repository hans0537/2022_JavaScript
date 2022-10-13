// 배열 안에서 최대, 최소값 구하기

const score = [17, 34, 8, 23, 52, 11];

console.log(score);
{
    let max = score[0];
    for(let i = 0; i < score.length; i++){
        (score[i] > max) && (max = score[i]);
    }
    console.log(`최대값 = ${max}`);
    
    let min = score[0];
    for(let i = 0; i < score.length; i++){
        (score[i] < min) && (min = score[i]);
    }
    console.log(`최대값 = ${min}`);
}

console.log('-'.repeat(20));
//-------------------------------------------------------
// forEach 사용, 최대, 최솟값 한번에 구하기
{
    let min, max;
    score.forEach((value, idx) => {
        if(idx == 0) {
            min = max = score[0];
        }else{
            (value > max) && (max = value);
            (value < min) && (min = value);
        } 
    });

    console.log(`최댓값 = ${max}`);
    console.log(`최솟값 = ${min}`);

    
}
//------------------------------------------------------
console.log('-'.repeat(20));
// reduce() 를 사용하여 최대, 최솟값 구하기
{
    let min, max;
    max = score.reduce((acc, cur) => {
        if(acc < cur) acc = cur;
        return acc;
    }, score[0]);

    // 삼항연산자 이용
    // max = score.reduce((prev, cur) => {
    //     return prev > cur ? prev : cur;
    // })
    
    min = score.reduce((acc, cur) => {
        if(acc > cur) acc = cur;
        return acc;
    }, score[0]);
    
    // 삼항연산자 이용
    // min = score.reduce((prev, cur) => {
    //     return prev < cur ? prev : cur;
    // })

    console.log(`최댓값 = ${max}`);
    console.log(`최솟값 = ${min}`);
}