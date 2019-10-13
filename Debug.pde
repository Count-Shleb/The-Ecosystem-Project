class Debug{
 
  int tsize;
  int tspace;
  
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
  text("PPOP: " + cppop,10,tspace);
  text("HPOP: " + chpop,210,tspace);
  text("CPOP: " + ccpop,410,width/tsize);
  text("SPOP: " + cspop,610,width/tsize);
  text("BPOP: " + cbpop,810,width/tsize);
  text("DPOP: " + cdpop,1010,width/tsize);
    
    stroke(255);
    
    for (int i = 0; i < cols; i++) {
    line(i*scl,0,i*scl,height);
    for (int j = 0; j < rows; j++) {
    line(0,j*scl,width,j*scl);
      
    }
    }
    
  }
  
}
