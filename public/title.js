// title 변경하기 

function setTitle(){
    var titles = document.getElementsByClassName('title');
    console.log(titles);
    for (var i=0; i< titles.length; i++){
        titles[i].innerHTML = "졸리졸리";
    };
};

var btn = document.getElementById('setTitle')
//document.getElementsByTagName('button')[0];

btn.onclick = function(){
    setTitle();
};

// document.getElementById(ID명)
// document.getElementsByClassName()
// document.getElementsByName()
// document.getElementsByTagName(tag 명)
// document.getElementsByTagNameNS()
// document.querySelector(css selector명)