# auto counter for every `clickCounter` class

## CSS style
```
  .clickCounter{
    cursor: pointer;
    transition:200ms;
    border: dotted 1px gray;
    border-radius: 15px;
    padding: 10px;
    margin: 5px;
  }
  .showCounter{
    border-radius: 15px;
    background-color: cyan;
    padding-left: 25px;
    
    padding-right: 25px;
    padding-bottom: 5px;
    padding-top: 5px;
    
    margin-left: 15px;
    margin-right: 15px;
  }
```

## Js function and auto loader
```
//clicker counter
function clickbtn(ID , showID , reset = false){
var button = document.getElementById(ID),
  count = 0;
button.onclick = function() {
  count += 1;
  if(reset == true) {
    count = 0;
    reset = false;
  }
  document.getElementById(showID).innerHTML = "" + count;
};
}
  $(function(){
    $(".clickCounter").each(function(i , a){
      $(a).attr('id' , 'click-'+i);
      $(a).prepend("<span id='showCounter-"+i+"' class='showCounter'></span><span class='resetCounterBtn ' onclick='clickbtn(\"click-"+i+"\" , \"showCounter-"+i+"\" , true)'>O</span>");
      clickbtn('click-'+i , "showCounter-"+i+"");
    });
  });
  //clicker counter
```