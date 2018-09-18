//-------------------------------------------------(VARIABLES GLOBALES)-------------------------------------------------------------------
ArrayList <Ladrillo> brick1;
ArrayList <Ladrillo> brick2;

int pantallas;
float x;
float y;
float dx;
float r,g,b;
float t;
TorreAma  E1;
Tower2    E2;
Empire    E3;
LGBT      E4;
ThugLife  E5;

Cloud nube1,nube2,nube3,nube4,nube5;
Cloud nube6,nube7,nube8,nube9,nube10,nube11,nube12,nube13,nube14;

attack Thor1,Thor2;
int turno;
int U1,U2,eleccion1, eleccion2pantallas;
float nivele;

void setup(){
  
  size (1200,700);
  nivele = 0;
  
  Thor1 = new attack(80,500);
  Thor2 = new attack(width-80,500);
  
  pantallas = 0;  
  E1 = new TorreAma();
  E2 = new Tower2();
  E3 = new Empire();
  E4 = new LGBT();
  E5 = new ThugLife();
  
  x = width/2;
  y = height/2;
  dx = 8;
  r = random(255);
  g = random(255);
  b = random(255);
  t = 50;
  nube1 = new Cloud(random(width),random(20,140),random(-1.5,1));
  nube2 = new Cloud(random(width),random(20,140),random(-1,1.5));
  nube3 = new Cloud(random(width),random(20,140),random(-1.5,1));
  nube4 = new Cloud(random(width),random(20,140),random(-1,1.5));
  nube5 = new Cloud(random(width),random(20,140),random(-1.5,1));
  
  nube6 = new Cloud(random(width),random(height),random(-1.5,1));
  nube7 = new Cloud(random(width),random(height),random(-1,1.5));
  nube8 = new Cloud(random(width),random(height),random(-1.5,1));
  nube9 = new Cloud(random(width),random(height),random(-1,1.5));
  nube10 = new Cloud(random(width),random(height),random(-1.5,1));
  nube11 = new Cloud(random(width),random(height),random(-1.5,1));
  nube12 = new Cloud(random(width),random(height),random(-1.5,1));
  nube13 = new Cloud(random(width),random(height),random(-1.5,1));
  nube14 = new Cloud(random(width),random(height),random(-1.5,1));
  turno = 0;
  brick1 = new ArrayList<Ladrillo>();
  brick2 = new ArrayList<Ladrillo>();
  
  smooth();
}

void draw (){
 switch (pantallas){
  case 0: ventana0(); break;
  case 1: ventana1(); break;
  case 2: ventana2(); break; //---------------------------------------------(BATALLA)------------------------------------------//
  case 3: ventana3(); break;
 }
}

void seleccionPersonaje(){
 switch(key){
  case'q': U1 = 1; break; //TorreAmarilla
  case'w': U1 = 2; break; //TorreAzul
  case'e': U1 = 3; break; //Empire
  case'r': U1 = 4; break; //LGBT
  case't': U1 = 5; break; //Empire Thug
  
  case'1': U2 = 1; break; //TorreAmarilla
  case'2': U2 = 2; break; //TorreAzul
  case'3': U2 = 3; break; //Empire
  case'4': U2 = 4; break; //LGBT
  case'5': U2 = 5; break; //Empire Thug
 }
 if (pantallas == 1 && U1 != 0 && U2 != 0)
 {
  pantallas = 2;
 }
 textSize(20);
 fill(20);
 textAlign(CENTER,BOTTOM);
 text("Presiona las teclas de '1 a 5' (Elige jugador 2",width/2,150);
 textAlign(CENTER,TOP);
 text("Presiona las teclas de 'Q a T' (Elige jugador 1",width/2, 600);
}

void seleccionPersonaje1()
{
      switch(U1)
      {
        case 1:
                     
                     E1.TorreAma();
                    
        break;
        case 2:
                    pushMatrix();
                    translate(-930,0);
                    E2.TorreAzul();
                    popMatrix();
                    
        break;
      
        case 3:
                    
                     E3.Empire();
                    
        break;
      
        case 4:
                    
                     E4.LGBT();
                    
       break;
        case 5:
                   
                     E5.ThugLife();
                     
        break;
      }   
}

void seleccionPersonaje2()
{
      switch(U2)
      {
        case 1:
                     
                     pushMatrix();
                     translate(990,0);
                     strokeWeight(3);
                     E1.TorreAma();
                     popMatrix();
                    
      break;
      case 2:  
                    strokeWeight(3);
                    E2.TorreAzul();               
      break;
      
      case 3:
                     pushMatrix();
                     translate(990,0);
                     strokeWeight(3);
                     E3.Empire();
                     popMatrix();                   
                    
      break;
      
      case 4:
                     pushMatrix();
                     translate(900,0);
                     strokeWeight(3);
                     E4.LGBT();
                     popMatrix();
      break;
      case 5:
                     pushMatrix();
                     translate(900,0);
                     strokeWeight(3);
                     E5.ThugLife();
                     popMatrix();
                     
      break;
      }
}


 
 
 //-------------------------------------------(TECLADO)----------------------------------------------------------------------------------
 
void keyPressed()
{
 if (pantallas == 0 && key == ' '){pantallas = 1;}
 // #controlLad
 if (key == '-' && pantallas == 2 && turno == 0){   
   turno = 1;
   brick1.add( new Ladrillo(160,nivele,-10,25)); 
  
 }
 if (key == '+' && pantallas == 2  && turno == 1){ 
  turno = 0;
   brick2.add( new Ladrillo(width-160,nivele,-10,25));
   
 }
  
 
 if (key == BACKSPACE){
  setup();
  Thor1.Healt = 100;
  Thor2.Healt = 100;
  U1 = 0;
  U2 = 0;
  pantallas = 0;
 }
 
}
 
//--------------------------------------------(PERSONAJES)-----------------------------------------------------
 

class TorreAma 
{
    void TorreAma()
    {
     fill (230,230,0);
     pushMatrix();
     rectMode(CORNER);
     rect (50, 350, 100, 350);
     rect (25, 300, 150, 50);
     rect (25, 270, 30, 30);
     rect (80, 270, 30, 30);
     rect (145,270, 30, 30);
     popMatrix();
    }
}

class Tower2
{
  float x,y;
  Tower2 (){
    x = width /2;
    y = height;
  }
  Tower2 (float x_, float y_){
    x = x_;
    y = y_;   
  }
  void TorreAzul()
  {

  fill (0,127,127);
  strokeWeight(1);
  rectMode(CORNER);
  rect (990, 350, 50, 350);
 pushMatrix();
  translate(940,300);
  beginShape();
  vertex (50,50);
  vertex (100,50);
  vertex (120,20);
  vertex (20,20);
  endShape();
 popMatrix();
  rect(960,290,20,30);
  rect(1000,290,20,30);
  rect(1040,290,20,30);
  fill(255);
  rect(1000,360,5,320);

  }
}

class ThugLife
{
      
  void ThugLife ()
  {  
 //-----------------------------(EDIFICIO)--------------------------------------
     
          strokeWeight(2);
          fill (180);
          rect (20,630, 50,70);
          rect (70,550, 80,150);
          rect (150,630, 50,70);
          rect (45,400, 25,230); 
          rect (70,330, 80,250);
          rect (150,400, 25,230);
          rect (85,310, 50,20);
          rect (93,290, 35,20);
          rect (93,290, 35,20);
          rect (106,250, 10,40);
//----------------------------------(LENTES)--------------------------------------  
          strokeWeight(0.1);
          fill(0);
          rect(30, 250, 150, 10);
          rect(30, 260, 70, 10);
          rect(40, 270, 60, 10);
          rect(50, 280, 40, 10);
          rect(60, 285, 20, 10);
          rect(110, 260, 70, 10);
          rect(110, 270, 60, 10);
          rect(120, 280, 40, 10);
          rect(130, 285, 20, 10);
//-----------------------------------(BRILLO)---------------------------------------    
       
          fill(255);  
          rect(50, 260, 10, 10);
          rect(65, 260, 10, 10);
          rect(58, 270, 10, 10);
          rect(75, 270, 10, 10);
      
         
       pushMatrix();
          translate(72,0);
          fill(255);  
          rect(50, 260, 10, 10);
          rect(65, 260, 10, 10);
          rect(58, 270, 10, 10);
          rect(75, 270, 10, 10);
       popMatrix();
     
  }
      
}
class Empire 
{
  void Empire()
  {
    strokeWeight(2);
    fill (180);
    rect (20,630, 50,70);
    rect (70,550, 80,150);
    rect (150,630, 50,70);
   
    rect (45,400, 25,230);
    rect (20,607, 25,23);
    rect (55,377, 15,23);
    rect (70,330, 80,250);
    rect (150,400, 25,230);
    rect (175,607, 25,23);
    rect (150,377, 15,23);
    rect (85,310, 50,20);
    rect (93,290, 35,20);
    rect (93,290, 35,20);
    rect (106,250, 10,40);
    
  }
  
}

class LGBT
{
      void LGBT()
      {
 pushMatrix();
      fill(220);
      scale(0.5);
      translate(-50,690);
      strokeWeight(10);
      stroke(0);
    pushMatrix();
      translate(100, 200);
      fill(255,255,0);
      rect(100,400, 300,100);
      fill(255,125,0);
      rect(140,290, 220,100);
      fill(255,0,0);
      rect(100,180, 300,100);
  popMatrix();
   
      translate(100,-120);
      fill(106,0,127);
      rect(100,400, 300,100);
      fill(0,0,255);
      rect(140,290, 220,100);
      fill(0,255,0);
      rect(100,180, 300,100);
    
      translate(0,-330);
      fill(255,255,0);
      rect(100,400, 300,100);
      fill(255,125,0);
      rect(140,290, 220,100);
      fill(255,0,0);
      rect(100,180, 300,100);
  popMatrix();
      }

}


//---------------------------------------(NUBES)--------------------------------------------
class Cloud
{
       float cx,cy,vel;
       Cloud()
       {
        cx = random(width);
        cy = random(20,140);
        vel = random(0.5,2);
       }
           Cloud(float cx_,float cy_,float vel_)
           {
            cx = cx_;
            cy = cy_;
            vel = random(vel_/4,vel_);
           }
               void display()
               {
                fill(240);
                
                pushMatrix();
                ellipseMode(CENTER);
                ellipse(cx-40,cy+18,46,46);
                ellipse(cx+3,cy+8,60,60);
                ellipse(cx+40,cy+21,40,40);
                rectMode(CENTER);
                rect(cx,cy+26,80,30);
                popMatrix();
                cx += vel;
                if(cx < -100){cx = width +100;}
                if(cx > width+100){cx = -100;}
               }
  
 }
//-------------------------------------(FONDO)---------------------------------------------------
 void FondoBatalla(){background(0,200,255);}
 
void sel(float px,float py,color g,int player){
 noStroke();
 fill(g);
 rectMode(CENTER);
 switch(player){
  case 1: triangle(px-40,py-30,px,py,px+40,py-30); break;
  case 2: triangle(px-40,py+30,px,py,px+40,py+30); break;
  default: rect(px,py,80,80); break;
 }
}

void rendicion(float gx,float gy){
 strokeWeight(3);
 stroke(3);
 rectMode(CORNER);
 fill(#DBD7B8);
 rect(gx,gy,120,60);
 rectMode(CORNERS);
 fill(#71614A);
 rect(gx,gy+60,gx+10,height);
}
//-------------------------------------(LADRILLO)---------------------------------------------------
class Ladrillo{
 float x,y,sx,sy;
 Ladrillo(float x_,float y_,float sx_,float sy_){
  x = x_;
  y = y_;
  sx = sx_;
  sy = sy_;
 }
 void aplicate(color fondo){
  stroke(20);
  strokeWeight(3);
  rectMode(CENTER);
  fill(fondo);
  rect(x,y,sx,sy,4);
 }
 void accion(float TX,float TY){
  x += TX;
  y += TY;
 }
}

class attack{
 float x,y,WI,HE;
 float ys;
 int Healt;
 attack(float x_,float y_){
  x = x_;
  y = y_;
  WI = 120;
  HE = 440;
  ys = y-(HE/2)-90;
  Healt = 100;
 }
 attack(float x_,float y_,float WI_,float HE_){
  x = x_;
  y = y_;
  WI = WI_;
  HE = HE_;
  Healt = 100;
 }
 void displayZ(){
  rectMode(CENTER);
  stroke(255);
  strokeWeight(2);
  fill(255,40);
  rect(x,y,WI,HE,8);
  ellipse(x,y,3,3);
 }
 void effect(float xf){
  if (xf < x+(WI/2) && xf > x-(WI/2)){
   ys += 5; 
   Healt -= 1;
   if (Healt < 0){
    Healt = 0;
   }
   if (ys > height){
    pantallas = 3;
   }
  }
  noStroke();
  fill(0,200,255);
  rectMode(CORNERS);
  rect(x-WI*2,y-(HE/2)-85,x+WI*2,ys);
  nivele = ys;
 }
}

void ventana0(){
 //---------------------(PANTALLA PRINCIPAL)----------------------------------------------------------------------//
                background(0,200,255);
                PFont P = loadFont("04b30-90.vlw");
                noStroke();
 //----------------(NUBES)-----------------------------------------------------------------------------------------//   

                nube6.display();
                nube7.display();
                nube8.display();
                nube9.display();
                nube10.display();
                nube11.display();
                nube12.display();
                nube13.display();
                nube14.display();
                
                fill(20,240);
                textFont(P);
                textSize(90);
                textAlign(CENTER,CENTER);
                text("TOWER ATTACK",width/2,height/2);
                textSize(24);
                textAlign(CENTER,BOTTOM);
                text("PULSA ESPACIO PARA COMENZAR",width/2,height-15);
               
  
         
}

void ventana1(){
 
 
  background (255);
  noFill();
  strokeWeight(100);
  rect (0, 0, 1200,700); 
  strokeWeight(1);
  stroke(0);

 
 pushMatrix();
  scale(0.5);
  translate(300,250);
  E1.TorreAma();
 popMatrix();
 
 pushMatrix();
  scale(0.5);
  translate(-250,250);
  E2.TorreAzul();
 popMatrix();
 
 pushMatrix();
  scale(0.5);
  translate(1000, 250);
  E3.Empire();
 popMatrix();
 
 pushMatrix();
  scale(0.5);
  translate(1360, 260);
  strokeWeight(0.7);
  E4.LGBT();
 popMatrix();
 
 pushMatrix();
  stroke(0);
  scale(0.5);
  translate(1770, 250);
  E5.ThugLife();
 popMatrix();
 
 seleccionPersonaje();
 
 switch(U1){
  case 1: sel(200,height-150,#C6483C,2); break;
  case 2: sel(390,height-150,#C6483C,2); break;
  case 3: sel(550,height-150,#C6483C,2); break;
  case 4: sel(760,height-150,#C6483C,2); break;
  case 5: sel(950,height-150,#C6483C,2); break;
 }
 switch(U2){
  case 1: sel(200,150,#3C97C6,1); break;
  case 2: sel(390,150,#3C97C6,1); break;
  case 3: sel(550,150,#3C97C6,1); break;
  case 4: sel(760,150,#3C97C6,1); break;
  case 5: sel(950,150,#3C97C6,1); break;
 }
 /*
 case'a': U1 = 1; break; //TorreAmarilla
  case's': U1 = 2; break; //TorreAzul
  case'd': U1 = 3; break; //Empire
  case'f': U1 = 4; break; //LGBT
  case'g': U1 = 5; break; //Empire Thug
  
  case'1': U2 = 1; break; //TorreAmarilla
  case'2': U2 = 2; break; //TorreAzul
  case'3': U2 = 3; break; //Empire
  case'4': U2 = 4; break; //LGBT
  case'5': U2 = 5; break; //Empire Thug
 */
}

void ventana2(){ 
  
 stroke(0);
 rectMode(CORNER); 
 FondoBatalla();

 seleccionPersonaje1();
 seleccionPersonaje2();
 
 for(Ladrillo esc: brick1){Thor2.effect(esc.x); esc.aplicate(#987F50); esc.accion(28,0);}
 for(Ladrillo esc: brick2){Thor1.effect(esc.x); esc.aplicate(#E86080); esc.accion(-28,0);}
 
 pushMatrix();
  noStroke();
  nube1.display();
  nube2.display();
  nube3.display();
  nube4.display();
  nube5.display();
 popMatrix();
  fill(0);
  textSize (20);
  textAlign (CENTER);
  text ("Presiona - para atacar", 200,100);
  
  fill(0);
  textSize (20);
  textAlign (CENTER);
  text ("Presiona + para atacar", 1000,100);
 
}
void ventana3(){

  FondoBatalla();
 
  nube6.display();
  nube7.display();
  nube8.display();
  nube9.display();
  nube10.display();
  nube11.display();
  nube12.display();
  nube13.display();
  nube14.display();

 pushMatrix();
 fill(0);
 textSize(60);
 textAlign(CENTER);
 if (Thor1.Healt == 0){
 text("Jugador 1: ganador "  , width/2,height/2);
 }
 else if (Thor1.Healt > 0){
    text("Jugador 1: perdedor "  + Thor1.Healt,60,60);
 }
 
 
 textSize(20);
 textAlign(LEFT,BOTTOM);
 text("Presiona 'Surp'/'Delete' para volver a comenzar",10,height-10);
 popMatrix();
}

// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- PUEDES BORRAR ESTA PARTE EN ADELANTE...
/*
void PADLM(){
 int rell;
 noStroke();
 fill(#4F9CBF);
 rectMode(CORNERS);
 rect(0,0,width,height);
 
 fill(255);
 PFont Hot = createFont("Arial",10);
 textFont(Hot);
 textLeading(18);
 textAlign(LEFT,BOTTOM);
 textSize(160);
 text(":(",180,height/2-80);
 textAlign(LEFT,TOP);
 textSize(24);
 text("Se ha producido un error en el sistema, no ha sido posible restaurar\nPa\' mi se me ase ke Benja le pondra CERO compa\'",180,height/2-70);
 textSize(20);
 textAlign(LEFT,BOTTOM);
 text("Si no sabe que hacer registre\nel siguiente codigo:\n\nStop Code: 3L_CH1N0_53_C063_4_51_M15M0_3L_MUY_PU70",400,height/2+225);
 
 for(float matx = 0; matx < 200 ; matx += 5){
  for(float maty = 0; maty < 200 ; maty += 5){
   rectMode(CORNER);
   rell = int(random(2));
   switch(rell){
    case 0: fill(255); break;
    case 1: fill(#89C2DB); break;
   }
   rect(185+matx,(height/2+20)+maty,5,5);
  }
 }
 noFill();
 stroke(255);
 strokeWeight(7);
 rect(180,height/2+15,210,210);
 noLoop();
}
*/
