







function logsubmit(){

    console.log("fuck you dude");


    var userinput=document.getElementById("fname");
    console.log(userinput.value);


    
    
    var currentimage=document.getElementById("indicator");

    var newhtml=document.createElement('div');
    newhtml.innerHTML=
    '<img id=indicator src="./resources/images/goodjob.jpg"></img>';


    var lameresponse=document.createElement('div');

    lameresponse.innerHTML=
    '<image id=indicator src="./resources/images/judge.png" alt="what the fuck is wrong with you?"></image>'

    if(userinput.value=="jeff"){
        
        currentimage.replaceWith(newhtml);

    }else{
        currentimage.replaceWith(lameresponse);
    }

    

    
}


function checkinput(){

    var correctform=document.getElementById("namesubmit");
    console.log(correctform.value);

    let fucky=document.createElement('div');

    fucky.innerHTML=
    "<p>fuck you</p>";

    correctform.replaceWith(fucky);


    var holder=document.getElementById("holden");
    //holder=null;

    if (!holder) {
        console.error("Element with ID 'holden' not found");
        return;
    }

    //holder.appendChild(fucky);




}

function checkinput1(){


    var ussrinput=document.getElementById("fnafnightsatfasbears");
    console.log(ussrinput.value);

    var newhtml=document.createElement('div');

    newhtml.innerHTML=
    "<p> nope </p>";

    ussrinput.replaceWith(newhtml);



}

function simplereplace(passedid){

    var ussrinput=document.getElementById(passedid);
    console.log(ussrinput);
    ussrinput.remove();

}