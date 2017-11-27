//table 의 크기를 원하는 만큼 선택하기 

var btn = document.getElementById('setAttribute');

btn.onclick = function(){
    console.log(btn); 
    setWidth();
}

function setWidth(){
    var tb = document.getElementById('mytable');
    var size = prompt("원하는 사이즈를 입력해 보세요.");
    console.log(size);
    tb.setAttribute('style', 'width:' +size+'%;');
}