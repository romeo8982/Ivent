function myMove() {
    var elem = document.getElementById("loginPopUp");
    var pos = 0;
    var id = setInterval(frame, 1);
    function frame() {
        if (pos >= 350) {
            clearInterval(id);
        }
        else {
            pos+=1.3;
            elem.style.top = pos + "px";
        }
    }
}

function mySpin()
{
    document.getElementById('gear').onclick = null;
    document.getElementById("gear").classList.add('fa-spin');
    setTimeout(() => {  document.getElementById("gear").classList.remove('fa-spin'); }, 2000);
    var pos = 0;
    var id = setInterval(frame, 1);
    function frame()
    {
        if(pos >= 150){
            clearInterval(id);
        }
        else{
            pos += 0.3;
            document.getElementById("gear").style.right = pos + "px";
        }

    }
}

function hide()
{
    var x = document.getElementById("hidden");
    x.style.display = "none";
}
function show()
{
    var x = document.getElementById("hidden");
    x.style.display = "block";
}