import ddf.minim.*; //<>//
Minim minim;
AudioPlayer player;
int seth = 10;
int setm = 0;
int sets = 0;

int sseth;
int ssetm;
int ssets;


void setup(){
  size(420,500);
  minim = new Minim(this);  //初期化
  player = minim.loadFile("alarm.wav");  //alarm.wavをロードする
}

void draw(){
  background(255);
  fill(0);
  
  int h = hour();
  int m = minute();
  int s = second();
  textSize(50);
  if(h >= 0 && h < 10){
    text("0"+h,100,90);
  }else {
    text(h,100,90);
  }
  if(m >= 0&& m<10){
    text(":"+0+m,160,90);
  }else{
    text(":"+m,160,90);
  }
  if(s >= 0&& s<10){
    text(":"+0+s,240,90);
  }else{
    text(":"+s,240,90);
  }
 // text(h+":"+m+":"+s,100,60);
  

  
  noFill();
  if(seth >= 0 && seth < 10){
    text("0"+seth,100,200);
  }else {
    text(seth,100,200);
  }
  if(setm >= 0&& setm<10){
    text(":"+0+setm,160,200);
  }else{
    text(":"+setm,160,200);
  }
  if(sets >= 0&& sets<10){
    text(":"+0+sets,240,200);
  }else{
    text(":"+sets,240,200);
  }
  button(100,205);
  button(100,140);
  ta(130,150,true);
  ta(130,215,false);
  button(180,205);
  button(180,140);
  ta(210,150,true);
  ta(210,215,false);
  button(260,205);
  button(260,140);
  ta(290,150,true);
  ta(290,215,false);
  rect(100,240,220,60);
  text("SET",170,288);
  rect(100,310,220,60);
  text("STOP",150,358);
  
  if(h == sseth && m == ssetm){
     player.play();
  }
}

void button(int a,int b){
  rect(a,b,60,20);
}

void ta(int x,int y,boolean a){
  if(a == true){
    triangle(x,y-4,x-4,y+4,x+4,y+4);
  }else{
    triangle(x,y+4,x-4,y-4,x+4,y-4);
  }
}

void mousePressed(){

  if(mouseX >= 100 && mouseY >= 205 && mouseX <= 160 && mouseY <= 225){
    if(seth <= 0){
      seth = 23;
    }else {
      seth --;
    }    
  } if(mouseX >= 100 && mouseY >= 140 && mouseX <= 160 && mouseY <= 160){
    if(seth >= 23){
      seth = 0;
    }else {
      seth ++;
    }
  }//m
  if(mouseX >= 180 && mouseY >= 205 && mouseX <= 220 && mouseY <= 225){
    if(setm <= 0){
      setm = 59;
    }else {
      setm --;
    }    
  } if(mouseX >= 180 && mouseY >= 140 && mouseX <= 240 && mouseY <= 160){
    if(setm >= 59){
      setm = 0;
    }else {
      setm ++;
    }
  }//s   
  if(mouseX >= 260 && mouseY >= 205 && mouseX <= 320 && mouseY <= 225){
    if(sets <= 0){
      sets = 59;
    }else {
      sets --;
    }    
  } if(mouseX >= 260 && mouseY >= 140 && mouseX <= 320 && mouseY <= 160){
    if(sets >= 59){
      sets = 0;
    }else {
      sets ++;
    }
  }
  //set
  if(mouseX >= 100 && mouseY >= 240 && mouseX <= 320 && mouseY <= 300){   
    sseth = seth;
    ssetm = setm;
    ssets = sets;
  }
  //stop
  if(mouseX >= 100 && mouseY >= 310 && mouseX <= 320 && mouseY <= 370){   
    sseth = 100;
    ssetm = 100;
    ssets = 100;
    minim.stop();
  }
  
}