class Debug{
 
  int tsize;
  int tspace;
  
  boolean lines = false;
  
  Debug(){
  tsize = 32;
  tspace = width/tsize;
  }
  
  
  void act(){
    
  }
  
  void show(){
  
  fill(255);
  strokeWeight(5);
  stroke(0);
    
  textSize(tsize);  
  text("PPOP: " + cppop,10,width/tsize);
  text("HPOP: " + chpop,210,width/tsize);
  text("CPOP: " + ccpop,410,width/tsize);
  text("SPOP: " + cspop,610,width/tsize);
  text("BPOP: " + cbpop,810,width/tsize);
  text("DPOP: " + cdpop,1010,width/tsize);
  text("FR: " + frameRate,210,(width/tsize) + 64);
  text("FC: " + frameCount,210,(width/tsize) + 128);
    
  }
  
}
