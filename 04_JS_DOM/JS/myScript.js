function light(sw){
    let pic;
    if(sw == 0){
        pic = "https://www.w3schools.com/html/pic_bulboff.gif";
    } else {
        pic = "https://www.w3schools.com/html/pic_bulbon.gif"
    }
    // element객체.attribute이름
    document.getElementById('myImage').src = pic;  // src attribute 변경
}

