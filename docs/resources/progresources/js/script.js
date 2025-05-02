


let option=0;


let value = localStorage.getItem('enablemusic');
console.log("MUSIC ENABLE VALUE:")
console.log(value)
if(value==1 ){
localStorage.setItem('enablemusic', 1);
}else{
}
if(value==null){
  localStorage.setItem('enablemusic', 1);
}


if(true){
  checkboxx();
}

let urls = [
  "dream00.html", 
  "dream01.html", 
  "dream02.html", 
  "dream03.html", 
  "dream04.html", 
  "dream05.html", 
  "dream06.html",
  "dream07.html",
  "dream08.html",
  "dream09.html",
  "dream10.html"

];

 






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


function stopaudio(passedid){
  var ussrinput=document.getElementById(passedid);
  console.log(ussrinput);
  ussrinput.pause();
}

var savedbgm=document.createElement('div');



function stoprepaudio(passedid){
  var ussrinput=document.getElementById(passedid);
  console.log(ussrinput);
  savedbgm=ussrinput;
 
  let fucky=document.createElement('div');
  
  fucky.innerHTML=`
 <audio id="bgm" loop>
 
</audio>
  
  `
  localStorage.setItem('enablemusic', 0);

 
 
 
  
  ussrinput.replaceWith(fucky);

}



function stoprepaudio1(passedid){
  
  localStorage.setItem('enablemusic', 1);
  window.location.reload();

}



function checkboxx(){
  console.log("CHECKBOXX RAN")
  var ussrinput=document.getElementById("autoplay");
  var value = localStorage.getItem('enablemusic');
  console.log("MUSIC ENABLE VALUE:")
 console.log(value)
 if(value==1){
  ussrinput.checked=true;
 }
 else{
  ussrinput.checked=false;
 }

}


function toggleaudio(){

  var value = localStorage.getItem('enablemusic');
  console.log("MUSIC ENABLE VALUE:")


  if(value==1){
    stoprepaudio('bgm');
  }
  else{
    stoprepaudio1('bgm')
  }

}




function gotonextindex(dreamindex) {




 


  window.location.href = urls[dreamindex+1];

  
}
function gotoprevindex(dreamindex) {
 
 
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





var rando=Math.floor(Math.random() * 21);
console.log(rando);

if(rando>15){
  correctform.replaceWith(fucky3);
  }
  if(rando>10){
    correctform.replaceWith(fucky2);
    }
    if(rando>5){
      correctform.replaceWith(fucky1);
      }
      if(rando>=0){
        correctform.replaceWith(fucky);
        }
      
  
  






      
  

}








var test;
let previndex=3;
let maxindex=4;
function displayart(artindex){
  
  if(previndex==artindex){
    previndex=previndex+1;
   }
   if(previndex==maxindex+1){
    previndex=previndex-1;
    return;
    
   }



  console.log("previndex")
  console.log(previndex);
  


 
  var correctform=document.getElementById("currentart");
  //console.log(correctform.value);




  let fucky4=document.createElement('div');
  fucky4.innerHTML=
  `
 
   <div id="currentart">

<div class="parentbox">  
  <h1 class="childtextbox">3-11-2025 art</h1>
</div>

<div class="container">


<div class="item">
<img src="./resources/art/drawings/latest 3-11-2025/aifishman.png" id="indicator2"> </img>
</div>

 <div class="item">
      <img src="./resources/art/drawings/latest 3-11-2025/fm2.png" id="indicator2"> </img>
      </div>
      
 <div class="item">
      <img src="./resources/art/drawings/latest 3-11-2025/fm1.png" id="indicator2"> </img>
      </div>


  
      <div class="item">
        <img src="./resources/art/drawings/latest 3-11-2025/ant hell.jpg" id="indicator2"> </img>
        </div>
      
  
        <div class="item">
            <img src="./resources/art/drawings/latest 3-11-2025/bosh practice 1.jpg" id="indicator2"> </img>
            </div>
          
  
            <div class="item">
                <img src="./resources/art/drawings/latest 3-11-2025/rabbit practice.jpg" id="indicator2"> </img>
                </div>
              
  
                <div class="item">
                    <img src="./resources/art/drawings/latest 3-11-2025/rp2.jpg" id="indicator2"> </img>
                    </div>
                  
  
                    <div class="item">
                        <img src="./resources/art/drawings/latest 3-11-2025/rp3.jpg" id="indicator2"> </img>
                        </div>
                      
  
                        <div class="item">
                            <img src="./resources/art/drawings/latest 3-11-2025/rp4.jpg" id="indicator2"> </img>
                            </div>
                          
  
                            <div class="item">
                                <img src="./resources/art/drawings/latest 3-11-2025/sqeeble.jpg" id="indicator2"> </img>
                                </div>
                              
  
                                <div class="item">
                                    <img src="./resources/art/drawings/latest 3-11-2025/willy.jpg" id="indicator2"> </img>
                                    </div>
                                  
  
      
  
                                                                       
                                        
</div>

</div>


`
;


  let fucky3=document.createElement('div');
  fucky3.innerHTML=
  `
 
  <div id=currentart>
    
  <div class="parentbox">  
  <h1 class="childtextbox">later college art</h1>
</div>

    <div class="parentbox">  


      <div class="container">
        <div class="item">
            <img src="./resources/art/drawings/newest1/abstract1.jpg" id="indicator2"> </img>
            </div>
        <div class="item">
            <img src="./resources/art/drawings/newest1/another1.png" id="indicator2 > </img>
            </div>
            
        
            <div class="item">
                <img src="./resources/art/drawings/newest1/another2.jpg" id="indicator2"> </img>
                </div>
                <div class="item">
                    <img src="./resources/art/drawings/newest1/bee.png" id="indicator2"> </img>
                    </div>
                
                    <div class="item">
                        <img src="./resources/art/drawings/newest1/beetle.jpg" id="indicator2"> </img>
                        </div>
                
                        <div class="item">
                            <img src="./resources/art/drawings/newest1/boschpractice1.jpg" id="indicator2"> </img>
                            </div>
                            <div class="item">
                                <img src="./resources/art/drawings/newest1/boschpractice2.jpg" id="indicator2"> </img>
                                </div>
                
                              
                                    
      
                                    <div class="item">
                                        <img src="./resources/art/drawings/newest1/combine.jpg" id="indicator2"> </img>
                                        </div>
                                    
                                        <div class="item">
                                            <img src="./resources/art/drawings/newest1/pinsneedles.jpg" id="indicator2"> </img>
                                            </div>
                                    
                                            <div class="item">
                                                <img src="./resources/art/drawings/newest1/randopractice.jpg" id="indicator2"> </img>
                                                </div>
                                    
                                                <div class="item">
                                                    <img src="./resources/art/drawings/newest1/scm2.jpg" id="indicator2"> </img>
                                                    </div>
                                    
                                                    <div class="item">
                                                        <img src="./resources/art/drawings/newest1/scm3.jpg" id="indicator2"> </img>
                                                        </div>
                                    
                                                        <div class="item">
                                                            <img src="./resources/art/drawings/newest1/scm4.jpg" id="indicator2"> </img>
                                                            </div>
                                    
                                                            <div class="item">
                                                                <img src="./resources/art/drawings/newest1/scm5.jpg" id="indicator2"> </img>
                                                                </div>
                                                                
                                                                <div class="item">
                                                                    <img src="./resources/art/drawings/newest1/scm6.jpg" id="indicator2"> </img>
                                                                    </div>
                                                                    <div class="item">
                                                                        <img src="./resources/art/drawings/newest1/scm7.jpg" id="indicator2"> </img>
                                                                        </div>
                                                                        <div class="item">
                                                                            <img src="./resources/art/drawings/newest1/scm8.jpg" id="indicator2"> </img>
                                                                            </div>
                                                                            <div class="item">
                                                                                <img src="./resources/art/drawings/newest1/sketchclubmisc.jpg" id="indicator2"> </img>
                                                                                </div>
                                                                             
                                              
      
      </div>
      </div>

`
;




  let fucky2=document.createElement('div');
  fucky2.innerHTML=
  `
   <div id=currentart>
   <div class="parentbox">  
  <h1 class="childtextbox">mid college art</h1>
</div>
      
      <div class="container">
        <div class="item">
            <img src="./resources/art/drawings/slightly new 2/collagefinal.jpg" id="indicator2"> </img>
            </div>
            <div class="item">
                <img src="./resources/art/drawings/slightly new 2/collageoutline.jpg" id="indicator2"> </img>
                </div>
                <div class="item">
                    <img src="./resources/art/drawings/slightly new 2/designp.jpg" id="indicator2"> </img>
                    </div>
                    <div class="item">
                        <img src="./resources/art/drawings/slightly new 2/dp.jpg" id="indicator2"> </img>
                        </div>
                        <div class="item">
                            <img src="./resources/art/drawings/slightly new 2/gridfinal.jpg" id="indicator2"> </img>
                            </div>
                            <div class="item">
                                <img src="./resources/art/drawings/slightly new 2/gridmp.jpg" id="indicator2"> </img>
                                </div>
                                <div class="item">
                                    <img src="./resources/art/drawings/slightly new 2/randoo.jpg" id="indicator2"> </img>
                                    </div>
                                    <div class="item">
                                        <img src="./resources/art/drawings/slightly new 2/rano1.jpg" id="indicator2"> </img>
                                        </div>
                                        <div class="item">
                                            <img src="./resources/art/drawings/slightly new 2/stilllife.jpg" id="indicator2"> </img>
                                            </div>
                                            <div class="item">
                                                <img src="./resources/art/drawings/slightly new 2/stilllife2.jpg" id="indicator2"> </img>
                                                </div>
                                               
                                              
      
      </div>
      </div>

`
;

let fucky1=document.createElement('div');
fucky1.innerHTML=
`
   <div id=currentart>
   
   <div class="parentbox">  
  <h1 class="childtextbox">early college art</h1>
</div>

      <div class="container">
        <div class="item">
            <img src="./resources/art/drawings/older 3/faces.png" id="indicator2"> </img>
            </div>
            
          
            <div class="item">
                <img src="./resources/art/drawings/older 3/faces2.png" id="indicator2"> </img>
                </div>
                <div class="item">
                    <img src="./resources/art/drawings/older 3/fuckedthing.png" id="indicator2"> </img>
                    </div>
                    <div class="item">
                        <img src="./resources/art/drawings/older 3/ghast2hplove.png" id="indicator2"> </img>
                        </div>
                        
                        <div class="item">
                            <img src="./resources/art/drawings/older 3/ghasthplove.png" id="indicator2"> </img>
                            </div>
    
                    
                            <div class="item">
                                <img src="./resources/art/drawings/older 3/hl2sketch.png" id="indicator2"> </img>
                                </div>
                                <div class="item">
                                    <img src="./resources/art/drawings/older 3/idk.png" id="indicator2"> </img>
                                    </div>
                                    <div class="item">
                                        <img src="./resources/art/drawings/older 3/keytre.png" id="indicator2"> </img>
                                        </div>
                                        <div class="item">
                                            <img src="./resources/art/drawings/older 3/lovecraftbeast.png" id="indicator2"> </img>
                                            </div>
                                
                                            <div class="item">
                                                <img src="./resources/art/drawings/older 3/me2beersin.png" id="indicator2"> </img>
                                                </div>
                                                <div class="item">
                                                    <img src="./resources/art/drawings/older 3/shandakbirdunkownkadath.png" id="indicator2m1"> </img>
                                                    </div>
                                                    <div class="item">
                                                        <img src="./resources/art/drawings/older 3/spearhighlandsbs.png" id="indicator2"> </img>
                                                        </div>
                                            
                                                        <div class="item">
                                                            <img src="./resources/art/drawings/older 3/tree.png" id="indicator2"> </img>
                                                            </div>
                                                            <div class="item">
                                                                <img src="./resources/art/drawings/older 3/villageofthemoonbeastslovecraft.png" id="indicator2"> </img>
                                                                </div>
                                                                <div class="item">
                                                                    <img src="./resources/art/drawings/older 3/you.png" id="indicator2"> </img>
                                                                    </div>
  
                                        
                                                                             
                                              
      
      </div>
      </div>

`
;

let fucky0=document.createElement('div');
fucky0.innerHTML=
`
 
 <div id=currentart>
      
 <div class="parentbox">  
  <h1 class="childtextbox">highschool art</h1>
</div>

      <div class="container">
        <div class="item">
            <img src="./resources/art/drawings/oldest 4/monsterpractice.png" id="indicator2"> </img>
            </div>
            <div class="container">
                <div class="item">
                    <img src="./resources/art/drawings/oldest 4/monstpractice2.png" id="indicator2"> </img>
                    </div>
                    <div class="container">
                        <div class="item">
                            <img src="./resources/art/drawings/oldest 4/randosketch.jpg" id="indicator2"> </img>
                            </div>
                            <div class="container">
                                <div class="item">
                                    <img src="./resources/art/drawings/oldest 4/soundofpreserverance.png" id="indicator2"> </img>
                                    </div>
                        

    
                                                                             
                                              
      
      </div>
      </div>

`
;



let artarray=[fucky0,fucky1,fucky2,fucky3,fucky4]
let buttonarray=["a0","a1","a2","a3","a4"]
  
  correctform.replaceWith(artarray[artindex]);

  var currentbutt=document.getElementById(buttonarray[artindex]);

  currentbutt.style.backgroundColor = "yellow";
  
  
  

  var currentbutt=document.getElementById(buttonarray[previndex]);
  currentbutt.style.backgroundColor = "white";

  
  previndex=artindex;
}




/*
const buttonA = document.querySelector("#button_A");
const headingA = document.querySelector("#heading_A");
let count = 1;
buttonA.onclick = () => {
  buttonA.textContent = "Try again!";
  headingA.textContent = `${count} clicks so far`;
  count += 1;
};

*/


function randomdream() {


 
  console.log(urls.length)
  var rando=Math.floor(Math.random() * (urls.length));
  console.log(rando);
   window.location.href = urls[rando];
 
}



function navdreams(dreamindex) {
  
 
    window.location.href = urls[dreamindex];
 
 
}


function skullyrep(skullindex){


  var correctform=document.getElementById(skullindex);
  //console.log(correctform.value);
  let fucky=document.createElement('image');
  fucky.innerHTML=
  `
   <img src="./resources/images/aggro.gif"> </img>
`
;
  
  correctform.replaceWith(fucky);



}




function flyyoufool(){
  var correctform=document.getElementById("marqtrip");
  //console.log(correctform.value);
  let fucky=document.createElement('div');
  fucky.innerHTML=

  `
    <marquee behavior="scroll" direction="right" scrollamount="150" loop=1 id="marqtrip" onmouseover="flyyoufool()">
        <img src="./resources/images/skeleton-run.gif" style="height:50px; width:auto;">
      </marquee>
`
;
  
  correctform.replaceWith(fucky);

  

}


function on(element) {
  document.getElementById(element).style.display = "block";
  console.log("ELEMENT TURNED ON:");
  console.log(element);
 

}
function overlayon(){
  document.getElementById('overlay').style.display = "block";
}

function overlayoff(){
  document.getElementById('overlay').style.display = "none";
}


function overlayon(){
  document.getElementById('overlay').style.display = "block";
}


function overlayoff(){
  document.getElementById('overlay').style.display = "none";
}



function off(element) {
  document.getElementById(element).style.display = "none";
  console.log("ELEMENT TURNED off:");
  console.log(element);
  document.getElementsByClassName('overlay').style.display = "none";

}







let photos = [
  photo0, photo1, photo2, photo3, photo4,
  photo5, photo6, photo7, photo8, photo9,
  photo10, photo11, photo12, photo13, photo14,
  photo15, photo16, photo17, photo18, photo19, photo20
];







function repphotocontent1(index){

  console.log(photo)


  var correctform=document.getElementById("reptarget");

  console.log(correctform)

  correctform.src=photo[index];
  on("reptarget");

  console.log(correctform)


}







//next time around just swap this out for image paths, 
//this way you can target the div and then just update the current image path used by the src. 
//Now you dont need a whole set of objects, just a set of paths within a path array!



function repphotocontent(index){
  //this replaces the currently viewed photo with the passed index. The passed index 
  //is generated via the return update next index function.
  
  

  var correctform=document.getElementById("reptarget");

 
  correctform.replaceWith(photos[index]);

  on("reptarget");

}






let currentindex=-1;


function returnupdatenextindex(){


  currentindex=currentindex+1;
  return currentindex;

}


