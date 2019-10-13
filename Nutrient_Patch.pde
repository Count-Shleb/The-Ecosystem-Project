class Nutrients extends LivingThing{
 
  Nutrients(){
    hp = random(1000,50000);
    ssize = hp /128;
    size = ssize;
    mass = size/2;
    //babysize = ssize*2;
   // println(babysize);
    growth = .025;
    age = 0;
    lifespan = 3600;
  }
  
  void act(){
    
    age++;
    
      //stroke(255);
  for (int i = 0; i < cols; i++) {
    //line(i*scl,0,i*scl,height);
    for (int j = 0; j < rows; j++) {
      //line(0,j*scl,width,j*scl);
      
      ArrayList<LivingThing> temp = grid[i][j];
      
      for(LivingThing s : temp){
        
        if(s instanceof Walkers){
         
          if(dist(pos.x, pos.y, s.pos.x, s.pos.y)<size/2 + s.size/2){
        hp-=.025;
        s.size += .0025;
        // println("dead");
     
          }
        }
        
      }
      
    }
    
  }
    
  }
  
  void render(){
    
    
    fill(255,255,150, 50);
    noStroke();
    ellipse(pos.x, pos.y, size,size);
  }
  
}
