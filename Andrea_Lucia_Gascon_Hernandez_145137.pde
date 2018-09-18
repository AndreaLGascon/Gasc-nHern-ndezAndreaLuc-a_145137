int pantalla=0;
boolean p1, p2;
int dib1;
int dib2;
int turno=1;

pers a;
pers b;
pers c;
pers d;
pers e;

pers J1;
pers J2;

void setup  () {
  a= new pers(10,80);
  b= new pers(8,100);
  c= new pers(7,150);
  d= new pers(12,70);
  e= new pers(5,200);
  J1= new pers();
  J2= new pers();
  
 
  size(800,500);
}

void draw () {
  switch(pantalla){  
    
    case 0:
    pantalla1();
    break; 

    case 1:
    phistoria();
    break;

    case 2:
    seleccion();
    break;
    
    case 3:
    pelea();
    break;
    
    case 4:
    fin();
    break;
  }  
}

void pantalla1 (){
background(#122262);
pushMatrix();
stroke(255, 0, 0);
strokeWeight(0);
fill(#3AAF7F);
ellipse(360,200,250,250);
fill(#E8DB62);
rect(337, 75, 45, 75);
fill(#E8DB62);
rect(315, 50, 90, 35);
fill(#F5F4ED);
ellipse(180,100,30,30);
fill(#F0AA27);
fill(#DE7D07);
textSize(24);
text("Presiona la tecla a",250,450);
popMatrix();
  
  if(key=='a'||key=='A'){
    pantalla=1;
  }
}

void phistoria (){
  background(#122262);
  pushMatrix();
  fill(#F0AA27); 
  textSize(15);
  text("   Por miles de años las principales regiones del planeta T han vivido en constante conflicto,",50,150);
  text("  para detener esta guerra de una vez por todas han decidido resolverlo con un torneo de lucha",50,180);
  text("el pueblo ganador se llevara la gloria y las tierras por las que tanto han peleado.",50,210);
  fill(#E8DB62);
  textSize(24);
  text("Presiona b para seguir",250,430);
  popMatrix();
  if(key=='b'||key=='B'){
    pantalla=2;
  }
  

  
}

void seleccion(){
  background(#3AAF7F);
  pushMatrix();
  textSize(20);
  fill(#122262);
  text("                               Selecciona un personaje\nJugador 1 presiona una tecla:\n                               Q     W     E     R     T\n\n\n\n\n\n\n\n\n\n\n                              A     S     D     F     G\nJugador2 presiona una tecla:",50,40); 
  text("Personaje 1                     Personaje 3                      Personaje 5\n\n                   Personaje 2                     Personaje 4",50,200);
  popMatrix();
  if(keyPressed){
    switch(key) {
      case'q':
      p1=true;
      dib1 = 0;
      break;
  
      case'w':
      p1=true;
      dib1 = 1;
      break;
  
      case'e':
      p1=true;
      dib1 = 2;
      break;
      
      case'r':
      p1=true;
      dib1 = 3;
      break;
      
      case't':
      p1=true;
      dib1 = 4;
      break;

      case'a':
      p2=true;
      dib2= 0;
      break;
  
      case's':
      p2=true;
      dib2=1;
      break;
  
      case 'd':
      p2=true;
      dib2=2;
      break;
      
      case 'f':
      p2=true;
      dib2=3;
      break;
      
      case 'g':
      p2=true;
      dib2=4;
      break;
    }
 }
  if(p1 && p2){
   pantalla=3;
 }

}

 void pelea(){
  background(#3AAF7F);
  pushMatrix();
  textSize(30);
  fill(#F0AA27); 
  text("Jugador 1 use Z",100,480);
  text("Jugador 2 use M",500,480);
  fill(#F0AA27); 
  textSize(40);
  text(J1.life,100,100);
  text(J2.life,600,100);
  popMatrix();
   switch(dib1){
     case 0:
     J1.dibujo(150,250);
     J1=a;
     break;
     
     case 1:
     J1.dibujo2(150,250);
     J1=b;
     break;
     
     case 2:
     J1.dibujo3(150,250);
     J1=c;
     break;
     
     
     case 3:
     J1.dibujo4(150,250);
     J1=d;
     break;
     
     case 4:
     J1.dibujo5(150,250);
     J1=e;
     break;
   }
   switch(dib2){
     case 0:
     J2.dibujo(600,250);
     J2=a;
     break;
     
     case 1:
     J2.dibujo2(600,250);
     J2=b;
     break;
     
     case 2:
     J2.dibujo3(600,250);
     J2=c;
     break;
     
     case 3:
     J2.dibujo4(600,250);
     J2=d;
     break;
     
     case 4:
     J2.dibujo5(600,250);
     J2=e;
     break;
   }
   
   if (turno==1){
     if(keyPressed){
        if(key=='z'|| key== 'Z'){
          J2.life=J2.life-J1.atack;
          turno = 2;
        }
     }
   }
   if (turno==2){
     if(keyPressed){
        if(key=='m'|| key== 'M'){
          J1.life=J1.life-J2.atack;
          turno = 1;
      }
     }
   }
   
   if( J1.life <= 0 || J2.life <= 0){
     pantalla = 4;
   }
 }
 
 void fin(){
   background(#122262);
   pushMatrix();
   if(J1.life>0){
     fill(#E0960B);
     textSize(40);
     text("Gano el Jugador 1", 150,200);
   }
   if(J2.life>0){
     fill(#E0960B);
     textSize(40);
     text("Gano el Jugador 2", 150,200);
   }
   fill(#E0960B);
   textSize(24);
   text("Pulsa H para reiniciar",200,400);
   popMatrix();
   if(key == 'h' || key == 'H'){
     turno = 1;
     p1 = false;
     p2 = false;
     pantalla = 0;
     a.life = 80;
     b.life = 100;
     c.life = 150;
     d.life = 70;
     e.life = 200;
   }
 }
 
 class pers{
  int atack; 
  int life;
  
  pers(int atack_, int life_){
    atack=atack_;
    life=life_;
    
  }
  pers() {
  }

void dibujo (int x, int y) {
  pushMatrix();
  fill(#672C05);
  stroke(0);
  rectMode(CENTER);
  rect(x-10,y+85,15,40);
  rect(x+10,y+85,15,40);
  ellipseMode(CENTER);
  ellipse(x,y,75,150);
  fill(0);
  ellipse(x,y+25,50,25);
  fill(255);
  ellipse(x-30,y-15,50,50);
  ellipse(x+30,y-15,50,50);
  fill(0);
  ellipse(x-30,y-15,15,15);
  ellipse(x+30,y-15,15,15);
  popMatrix();
  }
void dibujo2 (int x, int y) {
  pushMatrix();
  stroke(0);
  ellipseMode(CENTER);
  fill(#FFF7F2);
  ellipse(x,y,150,150);
  fill(0);
  ellipse(x,y,50,50);
  fill(#FFF7F2);
  ellipse(x+100,y,50,50);
  fill(0);
  ellipse(x+100,y,15,15);
  fill(#FFF7F2);
  ellipse(x-100,y,50,50);
  fill(0);
  ellipse(x-100,y,15,15);
  popMatrix();
  }
void dibujo3 (int x, int y) {
  pushMatrix();
  fill(#45DB54);
  stroke(0);
  rectMode(CENTER);
  rect(x,y+85,75,20);
  rect(x-10,y+45,20,100);
  rect(x+10,y+45,20,100);
  ellipseMode(CENTER);
  ellipse(x,y-50,100,100);
  fill(255);
  ellipse(x,y-50,40,40);
  fill(0);
  ellipse(x,y-50,10,10);
  popMatrix();
  }
void dibujo4 (int x, int y) {
  pushMatrix();
  fill(#FFEC15);
  triangle(x+50,y+50,x,y-50,x-50,y+50);
  rectMode(CENTER);
  fill(0);
  rect(x-20,y+75,5,50);
  rect(x+20,y+75,5,50);
  fill(255);
  ellipseMode(CENTER);
  ellipse(x,y,30,30);
  fill(0);
  ellipse(x,y,10,10);
  popMatrix();
  }
void dibujo5 (int x, int y) {
  pushMatrix();
  fill(#3445AD);
  rectMode(CENTER);
  rect(x,y,50,50);
  rect(x,y+28,30,6);
  rect(x,y+80,50,100);
  rect(x+10,y+155,20,50);
  rect(x-10,y+155,20,50);
  fill(#EDFF34);
  rect(x,y+15,20,5);
  ellipseMode(CENTER);
  ellipse(x-10,y-5,10,10);
  ellipse(x+10,y-5,10,10);
  popMatrix();
  }
}
