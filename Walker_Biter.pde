class Walkerb extends LivingThing{
 
  Walkerb(){
    hp=1;
    ssize =random(2.5, 5);
    size  = ssize;
    mass = size*50;
    babysize = ssize*2;
    age = 0;
    lifespan = 3600;
  }
  
  void act(){
    age++;
    
    force = PVector.random2D();
    
    //stroke(255);
  for (int i = 0; i < cols; i++) {
    //line(i*scl,0,i*scl,height);
    for (int j = 0; j < rows; j++) {
      //line(0,j*scl,width,j*scl);
      
      ArrayList<LivingThing> temp = grid[i][j];
      
      for(LivingThing s : temp){
        
        if(s instanceof Walkers){
         
           if(dist(pos.x, pos.y, s.pos.x, s.pos.y) <= 25){
             target = new PVector(s.pos.x + random(-s.size, s.size), s.pos.y + random(-s.size, s.size));
             force = target;
             force.sub(pos);
             force.add(PVector.random2D());
           }
          
          if(dist(pos.x, pos.y, s.pos.x, s.pos.y)<size/2 + s.size/2){
        s.hp--;
        size += s.size/2048;
        // println("dead");
     
          }
        }
        
      }
      
    }
    
  }
  
    acc = force.div(mass);
    vel.add(acc);
    vel.limit(mass/100);
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
    
    }
  
  void render(){
    
    
    fill(255,255,0);
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
