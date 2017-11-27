// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function alertRest(){
    setInterval(function() {
        var time = new Date();
        var hour = time.getHours();
        
        console.dir(hour);
        
        if (hour > 17){
            alert("잘가용!!");
        }else{
            alert("열공하세요!!");
        }
    
    }, 1*1000*60*60);//3000);
}

alertRest();