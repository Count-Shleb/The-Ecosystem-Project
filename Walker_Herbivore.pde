class Walkerh extends LivingThing{
 
  Walkerh(){
    hp=1;
    ssize =random(5,10);
    size  = ssize;
    massmod = 2;
    mass = size*massmod;
    babysize = ssize*2;
    age = 0;
    lifespan = 3600;
  }
  
  void act(){
    age++;
    
    mass = size/2;
    
    force = PVector.random2D();
    acc = force.div(mass);
    vel.add(acc);
    vel.limit(mass/massmod);
    pos.add(vel);
    
    if(pos.x > width+size){ //containing the walker in the window
     pos.x = -size; 
    }
     if(pos.x < -size){
     pos.x = width+size;
   }
     if(pos.y > height+size){
     pos.y = -size; 
    }
     if(pos.y < -size){
     pos.y = height+size;
   }
    
    if(age >= lifespan){
      hp--;
    }
    
   //stroke(255);
  for (int i = 0; i < cols; i++) {
    //line(i*scl,0,i*scl,height);
    for (int j = 0; j < rows; j++) {
      //line(0,j*scl,width,j*scl);
      
      ArrayList<LivingThing> temp = grid[i][j];
      
      for(LivingThing p : temp){
        
        if(p instanceof Plant){
         
          if(dist(pos.x, pos.y, p.pos.x, p.pos.y)<size/2 + p.size/2){
        p.hp--;
        size += p.size/2048;
        // println("dead");
     
          }
        }
        
      }
      
    }
    
  }
   
    }
  
  void render(){
    
    
    fill(0,0,255);
    noStroke();
    
       float theta = vel.heading();
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta-PI*1.5);
    beginShape(TRIANGLES);
    vertex(0, -size);
    vertex(-size/2, size);
    vertex(size/2, size);
    endShape();
    popMatrix();
  }
  
   boolean babytime(){
     return size >= babysize;
   }
   
}
