







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




function gotonextindex(dreamindex) {

  var urls = [
    "dream3-2-2025.html", 
    "dream2-31-2025.html", 
    "dream2-28-2025.html", 
    "dream2-3-2025.html", 
    "dream16-29-2023.html", 
    "dream05.html", 
    "dream06.html",
    "dream07.html",
    "dream08.html",
    "dream09.html",
    "dream010.html",
    "dream011.html",
    "dream012.html"
  ];

    window.location.href = urls[dreamindex+1];

}

function gotoprevindex(dreamindex) {

  var urls = [
    "dream3-2-2025.html", 
    "dream2-31-2025.html", 
    "dream2-28-2025.html", 
    "dream2-3-2025.html", 
    "dream16-29-2023.html", 
    "dream05.html", 
    "dream06.html",
    "dream07.html",
    "dream08.html",
    "dream09.html",
    "dream010.html",
    "dream011.html",
    "dream012.html"
  ];

  
    window.location.href = urls[dreamindex-1];

}



//--------------------------------------------------TEMPLATED ITEMS!!!!!

function generateheader(){

    var correctform=document.getElementById("headerholder");
    //console.log(correctform.value);

    let fucky=document.createElement('div');

    fucky.innerHTML=


    `
  <div class="headstyle">

    <header >
      <div>
        <a href="about.html">about</a>
        <a href="index.html">home</a>
        <a href="contact.html">socials-contact</a>
        <a href="music.html">music</a>
        <a href="drawings.html">art</a>
        <a href="journal.html">journal</a>
        <a href="dreamlog.html">dream log</a>
        <a href="https://users3.smartgb.com/g/g.php?a=s&i=g36-38132-85">guestbook</a>
        <button onclick="simplereplace('bgm')" id="bgmbt">kill music</button>
      </div>

    </header>
  </div>`
  ;

    
    correctform.replaceWith(fucky);


    


}


function generatedreamheader(){

    var correctform=document.getElementById("headerholder");
    //console.log(correctform.value);

    let fucky=document.createElement('div');

    fucky.innerHTML=


    `
  <div class="headstyle">

    <header >
      <div>
        <a href="../about.html">about</a>
        <a href="../index.html">home</a>
        <a href="../contact.html">socials-contact</a>
        <a href="../music.html">music</a>
        <a href="../drawings.html">art</a>
        <a href="journal.html">journal</a>
        <a href="../dreamlog.html">dream log</a>
        <a href="https://users3.smartgb.com/g/g.php?a=s&i=g36-38132-85">guestbook</a>
        <button onclick="simplereplace('bgm')" id="bgmbt">kill music</button>
      </div>

    </header>
  </div>`
  ;

    
    correctform.replaceWith(fucky);


    


}




function randodreamaudio(){

  var correctform=document.getElementById("bgm");
  //console.log(correctform.value);

  let fucky=document.createElement('div');

  fucky.innerHTML=

  `
<audio id="bgm" loop>
    <source src="../resources/audio/Separation Anxiety - Neon Genesis Evangelion 4.mp3" type="audio/mpeg">
</audio>`
;



let fucky1=document.createElement('div');

fucky1.innerHTML=


`
  <audio id="bgm" loop>
    <source src="../resources/audio/BORDERLINE CASE 4.mp3" type="audio/mpeg">
</audio>`
;



let fucky2=document.createElement('div');

fucky2.innerHTML=


`
  <audio id="bgm" loop>
    <source src="../resources/audio/Roedelius - Freudentanz 4.mp3" type="audio/mpeg">
</audio>`
;


let fucky3=document.createElement('div');

fucky3.innerHTML=


`
  <audio id="bgm" loop>
    <source src="../resources/audio/the third place 4.mp3" type="audio/mpeg">
</audio>`
;






var rando=Math.floor(Math.random() * 22);
console.log(rando);


if(rando>20){
  correctform.replaceWith(fucky3);
  }
  if(rando>15){
    correctform.replaceWith(fucky2);
    }
    if(rando>10){
      correctform.replaceWith(fucky1);
      }
      if(rando>5){
        correctform.replaceWith(fucky);
        }
      
  
  







      
  


}

