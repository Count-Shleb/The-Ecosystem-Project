class Walkerd extends LivingThing{
 
  
  Walkerd(){
    hp=1;
    ssize =random(20,25);
    tsize = ssize;
    size  = ssize;
    massmod = 2000;
    mass = size*massmod;
    babysize = ssize*2;
    age = 0;
    lifespan = 7200;
  }
  
  void act(){
    age++;
    
    if(tsize > size){
     size += .025; 
    }
    
    if(tsize < size){
    size -= .025;  
    }
    
    force = PVector.random2D();
    
    record = 500;
    
    for(int i = 0; i < nutrients.size(); i++){
      
       LivingThing n = nutrients.get(i);
       
   if(n instanceof Nutrients){ 
     
     precord = record;
     
     if(dist(pos.x, pos.y, n.pos.x, n.pos.y) <= precord){
     record = dist(pos.x, pos.y, n.pos.x, n.pos.y);
     }
     
     if(record <= precord){
     if(dist(pos.x, pos.y, n.pos.x, n.pos.y) <= 500){
    target = new PVector(n.pos.x + random(-n.size, n.size), n.pos.y + random(-n.size, n.size));
    force = target;
    force.sub(pos);
    force.add(PVector.random2D());
     }
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
        tsize += s.size/512;
      }
        }
        
      }
        
        for(LivingThing b : temp){
        
        if(b instanceof Walkerb){
          
          if(dist(pos.x, pos.y, b.pos.x, b.pos.y)<size/2 + b.size/2){
        b.hp--;
        tsize += b.size/128;
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
