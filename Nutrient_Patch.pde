class Nutrients extends LivingThing{
   
  Nutrients(){
    hp = random(10000,50000);
    ssize = hp /150;
    size = ssize;
    mass = size/2;
    //babysize = ssize*2;
   // println(babysize);
    growth = .025;
    age = 0;
    lifespan = 3600;
  }
  
  float alpha = 50;
  
  void act(){
    
    age += 1;
    
    alpha -= hp * .0000005;
    
      //stroke(255);
  for (int i = 0; i < cols; i++) {
    //line(i*scl,0,i*scl,height);
    for (int j = 0; j < rows; j++) {
      //line(0,j*scl,width,j*scl);
      
      ArrayList<LivingThing> temp = grid[i][j];
      
      for(LivingThing p : temp){
        
        if(p instanceof Plant){
         
          if(dist(pos.x, pos.y, p.pos.x, p.pos.y)<size/2 + p.size/2){
        p.size += p.growth;
        p.hunger = 0;
        alpha -= hp * .000000001;
        // println("dead");
     
          }
        }
        
      }
      
      for(LivingThing s : temp){
        
        if(s instanceof Walkers){
         
          if(dist(pos.x, pos.y, s.pos.x, s.pos.y)<size/2 + s.size/2){
        s.hunger = 0;
        s.size += .005;
        alpha -= hp * .000000001;
        // println("dead");
     
          }
        }
        
      }
      
    }
    
  }
    
  }
  
  void render(){
    
    fill(255, 255, 150, alpha);
    noStroke();
    ellipse(pos.x, pos.y, size,size);
  }
  
  
  boolean dead(){
    return alpha <= 0;
  }
}
