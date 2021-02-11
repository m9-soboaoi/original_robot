float baseH = 130;
float armL1 = 50;
float armL2 = 45;
float armL3 = 35;
float armW1 = 10;
float armW2 = 10;
float armW3 = 10;
float armH3 = 3;
float angle0 = 0;
float angle1 = 30;
float angle2 = 0;
float l1 = 0;
float b = 0;
float diameter = 10;
float dif = 1.0;
float low = 5.0;
float middle = 7.0;
float high = 9.0;
float speed = 300;


void setup(){
  size(1200, 800, P3D);
  //background(#C48D39);
  
  camera(180, 180, 180, 0, 0, 100, 0, 0, -1);
  
  noStroke();  
}

void draw(){
  
  background(#C48D39);
  
  if(keyPressed){
    if(key == 'a'){
      angle0 = angle0 + dif;
    }
    if(key == 'A'){
      angle0 = angle0 - dif;
    }
    if(key == 's'){
      l1 = l1 + dif;
      if(l1>=40){
        l1 = 40;
      }
    }
    if(key == 'S'){
      l1 = l1 - dif;
      if(l1<=0){
        l1 = 0;
      }
    }
    if(key == 'd'){
      angle1 = angle1 + dif;
    }
    if(key == 'D'){
      angle1 = angle1 - dif;
    }
    if(key == 'f'){
      angle2 = angle2 + low;
    }
    if(key == 'F'){
      angle2 = angle2 - low;
    }
     if(key == 'g'){
      angle2 = angle2 + middle;
    }
    if(key == 'G'){
      angle2 = angle2 - middle;
    }
     if(key == 'h'){
      angle2 = angle2 + high;
    }
    if(key == 'H'){
      angle2 = angle2 - high;
    }
    if(mousePressed){
      b = b + speed;
    }
  }
  
  //base
  rotateZ(radians(angle0));
  translate(0,0,baseH/2);
  fill(#0D810C);
  box(10,10,baseH);
  
  //1st link
  translate(0,5+armW1/2,baseH/2-armL1/2+l1);
  fill(#17C115);
  box(armW1,armW1,armL1);
  
  //2nd link
  //go to 2nd joint
  translate(0,armW1/2+armW2/2,armL1/2-armW2/2);
  rotateY(radians(angle1));  
  //go to center of 2nd joint
  translate(0,0,armL2/2-armW2/2);
  fill(#4AE048);
  box(armW2,armW2,armL2);
  
  //3rd link
  //go to 3rd joint
  translate(armW2/2+armW3/2,0,armL2/2-armW3/2);
  rotateX(radians(angle2)); 
  //go to center of 3rd joint
  translate(0,0,armL3/2-armW3/2);
  fill(#C8D1C8);
  box(armW3,armH3,armL3);
  
  //ball
  translate(0,armH3/2+diameter/2+b,armL3/2-diameter/2);
  fill(255);
  sphere(diameter/2);

}
