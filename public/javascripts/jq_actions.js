function getDocHeight() {
    //utility function to find dimensions of page
    var D = document;
    return Math.max(
        Math.max(D.body.scrollHeight, D.documentElement.scrollHeight),
        Math.max(D.body.offsetHeight, D.documentElement.offsetHeight),
        Math.max(D.body.clientHeight, D.documentElement.clientHeight)
    );
}

/*$(document).ready(function() {
  $("div.jq_test").click(function(){
    $("div.jq_test").animate({
      "margin-top": "100px"
    }, 10000);
  });
});*/

var title = ['M','A','R','M','I','T','E','J','U','N','C','T','I','O','N']
var index = 0

$(document).ready(function() {
  $("div.jq_test").animate({
    "margin-top": getDocHeight()
  }, 20000);
});

$(document).ready(function(){
  $("body").click(function(){
    $("div.jq_test2").clearQueue()
  });
  $("body").click(function(){
    $("div.jq_test2").html(title[(index%title.length)]);
//    $("div.jq_test2").fadeIn(1);
    $("div.jq_test2").css("opacity","1");
    $("div.jq_test2").css("filter","opacity=100");
    $("div.jq_test2").css("display","inline");
    $("div.jq_test2").fadeOut(400);
    index=++index
  }); 

});

$(document).ready(function(){
});
