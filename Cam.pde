class Cam{
  
  PVector pos = new PVector(0,0);
  int speed;
  Cam(){
    
    
  }
  
  
  void update(){
    
    if(!shift){
     speed = 2; 
    }else{
     speed = 10; 
    }
    
    if(wkey){
     pos.y-=speed; 
    }
    if(skey){
     pos.y+=speed; 
    }
    if(dkey){
     pos.x+=speed;
    }
    if(akey){
     pos.x-=speed; 
    }
    if(rkey && pos.z > -300){
     pos.z-=speed; 
    }
    if(fkey && pos.z < 1000){
     pos.z+=speed;
    }
    
    text("pos.z" + pos.z, 255,255);
    
     camera(pos.x + width/4, pos.y+ height/4, pos.z+ height/2 / tan(PI*30.0 / 180.0), pos.x + width/4, pos.y + height/4, pos.z + 0, 0, 1, 0);
     //camera(pos.x, pos.y, pos.z , pos.x + width/4, pos.y + height/8, 0, 0, 1, 0);
     //camera(pos.x,pos.y / tan(PI*30.0 / 180.0),-1,0,0,0,0,1,0);
     //camera(pos.x + width/4, height/2.0, (pos.y/2.0) / tan(PI*30.0 / 180.0), pos.x + width/4, height/2.0, 0, 0, 1, 0);
    
  }
  
}
