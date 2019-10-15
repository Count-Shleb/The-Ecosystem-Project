class Walkerd extends LivingThing{
 
  
  Walkerd(){
    hp=1;
    ssize =random(20,25);
    tsize = ssize;
    size  = ssize;
    massmod = 750;
    mass = size*massmod;
    babysize = ssize*5;
    age = 0;
    lifespan = random(3600, 7200);
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
    
    record = 2000;
    
    for(int i = 0; i < swarmpoint.size(); i++){
      
       LivingThing sp = swarmpoint.get(i);
        
        if(sp instanceof Swarmpoint){
          
          precord = record;
     if(dist(pos.x, pos.y, sp.pos.x, sp.pos.y) < precord){
     record = dist(pos.x, pos.y, sp.pos.x, sp.pos.y);
     }
        
       if(sp.count >= 100){
          if(record < precord){
             if(dist(pos.x, pos.y, sp.pos.x, sp.pos.y) <= 2000){
             locked = true;
             target = new PVector(sp.pos.x + random(-sp.size/4, sp.size/4), sp.pos.y + random(-sp.size/4, sp.size/4));
             force = PVector.random2D();
             force.add(target);
             force.sub(pos);
           }
          }
          }
           
           if(!locked){
            PVector.random2D(force); 
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
        tsize += s.size/500;
      }
        }
        
      }
        
        for(LivingThing b : temp){
        
        if(b instanceof Walkerb){
          
          if(dist(pos.x, pos.y, b.pos.x, b.pos.y)<size/2 + b.size/2){
        b.hp--;
        tsize += b.size/100;
      }
        }
        
      }
      
    
    }
  }
  
   if(locked){
    acc = force.div(mass);
    }else{
    acc = force.div(mass/massmod);  
    }
    
    vel.add(acc);
    vel.limit(mass / massmod / 5);
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
