


const globe = {
  prevart: 100
};





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




function displayart(artindex){

 
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
      <img src="./resources/art/drawings/latest 3-11-2025/aifishman.jpg" id="indicator2"> </img>
      </div>
    
  
      <div class="item">
        <img src="./resources/art/drawings/latest 3-11-2025/ant hell.jpg" id="flip-horizontalm1"> </img>
        </div>
      
  
        <div class="item">
            <img src="./resources/art/drawings/latest 3-11-2025/bosh practice 1.jpg" id="flip-horizontalm1"> </img>
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
            <img src="./resources/art/drawings/newest1/another1.jpg" id="flip-horizontalm1"> </img>
            </div>
            
        
            <div class="item">
                <img src="./resources/art/drawings/newest1/another2.jpg" id="indicator2"> </img>
                </div>

                <div class="item">
                    <img src="./resources/art/drawings/newest1/bee.jpg" id="indicator2"> </img>
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
            <img src="./resources/art/drawings/older 3/faces.jpg" id="flip-horizontalm1"> </img>
            </div>
            

          
            <div class="item">
                <img src="./resources/art/drawings/older 3/faces2.jpg" id="flip-horizontalm1"> </img>
                </div>

                <div class="item">
                    <img src="./resources/art/drawings/older 3/fuckedthing.jpg" id="flip-horizontalm1"> </img>
                    </div>

                    <div class="item">
                        <img src="./resources/art/drawings/older 3/ghast2hplove.jpg" id="flip-horizontal"> </img>
                        </div>

                        
                        <div class="item">
                            <img src="./resources/art/drawings/older 3/ghasthplove.jpg" id="flip-horizontal"> </img>
                            </div>
    
                    

                            <div class="item">
                                <img src="./resources/art/drawings/older 3/hl2sketch.jpg" id="flip-horizontalm1"> </img>
                                </div>

                                <div class="item">
                                    <img src="./resources/art/drawings/older 3/idk.jpg" id="flip-horizontalm1"> </img>
                                    </div>

                                    <div class="item">
                                        <img src="./resources/art/drawings/older 3/keytre.jpg" id="flip-horizontal"> </img>
                                        </div>

                                        <div class="item">
                                            <img src="./resources/art/drawings/older 3/lovecraftbeast.jpg" id="flip-horizontal"> </img>
                                            </div>
                                

                                            <div class="item">
                                                <img src="./resources/art/drawings/older 3/me2beersin.jpg" id="flip-horizontalm1"> </img>
                                                </div>

                                                <div class="item">
                                                    <img src="./resources/art/drawings/older 3/shandakbirdunkownkadath.jpg" id="flip-horizontalm1"> </img>
                                                    </div>

                                                    <div class="item">
                                                        <img src="./resources/art/drawings/older 3/spearhighlandsbs.jpg" id="flip-horizontal"> </img>
                                                        </div>
                                            
                                                        <div class="item">
                                                            <img src="./resources/art/drawings/older 3/tree.jpg" id="flip-horizontal"> </img>
                                                            </div>

                                                            <div class="item">
                                                                <img src="./resources/art/drawings/older 3/villageofthemoonbeastslovecraft.jpg" id="flip-horizontal"> </img>
                                                                </div>

                                                                <div class="item">
                                                                    <img src="./resources/art/drawings/older 3/you.jpg" id="flip-horizontal"> </img>
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
            <img src="./resources/art/drawings/oldest 4/monsterpractice.jpg" id="flip-horizontal"> </img>
            </div>

            <div class="container">
                <div class="item">
                    <img src="./resources/art/drawings/oldest 4/monstpractice2.jpg" id="flip-horizontal"> </img>
                    </div>

                    <div class="container">
                        <div class="item">
                            <img src="./resources/art/drawings/oldest 4/randosketch.jpg" id="indicator2"> </img>
                            </div>

                            <div class="container">
                                <div class="item">
                                    <img src="./resources/art/drawings/oldest 4/soundofpreserverance.jpg" id="flip-horizontal"> </img>
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
  
  
  


  var currentbutt=document.getElementById(buttonarray[globe.prevart]);
  currentbutt.style.backgroundColor = "white";


  globe.prevart=artindex;
}

