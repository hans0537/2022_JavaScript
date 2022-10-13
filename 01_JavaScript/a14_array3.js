const arr1 = [
    {
        name: 'James',
        age: 34,
        score: [100, 89, 88],
    },
    {
        name: 'Amy',
        age: 41,
        score: [56, 13, 97],
    },
    {
        name: 'Kevin',
        age: 23,
        score: [96, 88, 59],
    },
]

console.log(arr1);
// 이름 오름 차순으로 정렬
arr1.sort(function(a, b){
    if(a.name.toUpperCase() < b.name.toUpperCase()) return -1;
    if(a.name.toUpperCase() > b.name.toUpperCase()) return 1;
    return 0;
});

console.log(arr1);

// 이름 내림 차순으로 정렬
arr1.sort(function(a, b){
    if(a.name.toUpperCase() > b.name.toUpperCase()) return -1;
    if(a.name.toUpperCase() < b.name.toUpperCase()) return 1;
    return 0;
});
console.log(arr1);

// 나이 오름 차순 정렬
console.log('나이 오름차순 정렬');
arr1.sort((a, b) => a.age - b.age);
console.log(arr1);

// 나이 내림 차순 정렬
console.log('나이 내림차순 정렬');
arr1.sort((a, b) => b.age - a.age);
console.log(arr1);

// score 총점 오름차순 정렬
console.log('총점 오름차순 정렬');
arr1.sort(function(a, b){
    sumA = a.score.reduce((acc, cur) => acc + cur);
    sumB = b.score.reduce((acc, cur) => acc + cur);
    return sumA - sumB;
});
console.log(arr1);

// score 총점 내림차순 정렬
console.log('총점 내림차순 정렬');
arr1.sort(function(a, b){
    sumA = a.score.reduce((acc, cur) => acc + cur);
    sumB = b.score.reduce((acc, cur) => acc + cur);
    return sumB - sumA;
});
console.log(arr1);

// score 평균 오름차순 정렬
arr1.sort((a, b) => {
    console.log(arr1);
    let aAvg = 0;
    let bAvg = 0;

    for(let i = 0; i < a.score.length; i++) {
        aAvg += a.score[i];
        bAvg += b.score[i];
    }

    aAvg /= a.score.length;
    bAvg /= b.score.length;
    
    console.log(aAvg, bAvg);
    return aAvg - bAvg;
})

// score 평균 내림차순 정렬
arr1.sort((a, b) => {
    let aAvg = 0;
    let bAvg = 0;

    for(let i = 0; i < a.score.length; i++) {
        aAvg += a.score[i];
        bAvg += b.score[i];
    }

    aAvg /= a.score.length;
    bAvg /= b.score.length;
    
    console.log(aAvg, bAvg);
    return bAvg - aAvg;
})




console.log("\n[프로그램 종료]", '\n'.repeat(20));
