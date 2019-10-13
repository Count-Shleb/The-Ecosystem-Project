class Walkerd extends LivingThing{
 
  
  Walkerd(){
    hp=1;
    ssize =random(20,25);
    size  = ssize;
    massmod = 2000;
    mass = size*massmod;
    babysize = ssize*2;
    age = 0;
    lifespan = 7200;
  }
  
  void act(){
    age++;
    
    force = PVector.random2D();
    
    for(int i = 0; i < nutrients.size(); i++){
      
       LivingThing n = nutrients.get(i);
       
   if(n instanceof Nutrients){ 
     
     if(dist(pos.x, pos.y, n.pos.x, n.pos.y) <= 500){
    target = new PVector(n.pos.x + random(-n.size, n.size), n.pos.y + random(-n.size, n.size));
    force = target;
    force.sub(pos);
    force.add(PVector.random2D());
     }
    }
    
    }
    
     //stroke(255);
  for (int i = 0; i < cols; i++) {
    //line(i*scl,0,i*scl,height);
    for (int j = 0; j < rows; j++) {
      //line(0,j*scl,width,j*scl);
          
      ArrayList<LivingThing> temp = grid[i][j];
        
        for(LivingThing s : temp){
        
        if(s instanceof Walkers){
          
          if(dist(pos.x, pos.y, s.pos.x, s.pos.y)<size/2 + s.size/2){
        s.hp--;
        size += s.size/512;
      }
        }
        
      }
        
        for(LivingThing b : temp){
        
        if(b instanceof Walkerb){
          
          if(dist(pos.x, pos.y, b.pos.x, b.pos.y)<size/2 + b.size/2){
        b.hp--;
        size += b.size/128;
      }
        }
        
      }
      
    
    }
  }
  
    acc = force.div(mass);
    vel.add(acc);
    vel.limit(mass/massmod/2);
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
    
    
    fill(0,255,255);
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
