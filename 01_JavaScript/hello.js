console.log("Hello JavaScript");

let num = 1000; // 1 ~ num 까지의 숫자에 대해 369게임 동작시키기

for (let i = 1; i <= num; i++) {

  let check = -1;

  let tmp = i

  while (tmp > 0) {

    if (tmp % 10 == 3 || tmp % 10 == 6 || tmp % 10 == 9) {

      check = 1;

      break;

    } else {

      tmp = parseInt(tmp / 10);

    }

  }



  if (check == 1) process.stdout.write("*\t");

  else process.stdout.write(i + "\t");



  if (i % 10 == 0) console.log();

}