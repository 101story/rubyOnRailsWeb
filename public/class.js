// 속성 변경하기 

var btn = document.getElementById('setClass');

btn.onclick = function(){
    console.log(btn); 
    toggleclass();
}

function toggleclass(){
    var tb = document.getElementsByClassName("table")[0];
    console.log(tb.classList);
    // if(tb.classList.contains('table-hover')){
    //     tb.classList.remove('table-hover');
    // }else{
    //     tb.classList.add('table-hover');
    // }
    tb.classList.toggle('table-hover');
}
