class Walkers extends LivingThing{
 
  Walkers(){
    hp=1;
    ssize = random(1,2);
    size  = ssize;
    massmod = 50;
    mass = size*massmod;
    babysize = ssize*2;
    age = 0;
    lifespan = random(1200,3600);
  }
  
  void act(){
    age++;
    
    force = PVector.random2D();    
    
    record = 500;
    
    locked = false;
    
     for(int i = 0; i < swarmpoint.size(); i++){
      
       LivingThing sp = swarmpoint.get(i);
        
        if(sp instanceof Swarmpoint){
          
          precord = record;
     if(dist(pos.x, pos.y, sp.pos.x, sp.pos.y) < precord){
     record = dist(pos.x, pos.y, sp.pos.x, sp.pos.y);
     }
        
       
          if(record < precord){
             if(dist(pos.x, pos.y, sp.pos.x, sp.pos.y) <= 500){
             locked = true;
             target = new PVector(sp.pos.x + random(-sp.size, sp.size), sp.pos.y + random(-sp.size, sp.size));
             force = PVector.random2D();
             force.add(target);
             force.sub(pos);
           }
          }
           
           if(!locked){
            PVector.random2D(force); 
           }
           
           }
        }
    
    
     //if(record < 250){
     // locked = true; 
     //}else{
     // locked = false; 
     //}
    
    acc = force.div(mass/massmod);
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
   
    }
  
  void render(){
    
    
    fill(255,0,255);
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

class Swarmpoint extends LivingThing{
  
  Swarmpoint(){
    size = 100;
    massmod = 1000;
    mass = size*massmod;
  }
  
  void act(){
    
       record = 500;
       
       //locked = false;
    
   for(int i = 0; i < nutrients.size(); i++){
      
       LivingThing n = nutrients.get(i);
       
   if(n instanceof Nutrients){
     
     precord = record;
     
     if(dist(pos.x, pos.y, n.pos.x, n.pos.y) <= precord){
     record = dist(pos.x, pos.y, n.pos.x, n.pos.y);
     }
     
    if(locked){
     if(dist(pos.x, pos.y, n.pos.x, n.pos.y) <= 500){
    target = new PVector(n.pos.x + random(-n.size, n.size), n.pos.y + random(-n.size, n.size));
    force = target;
    force.add(PVector.random2D());
    force.sub(pos);
    
     }
    }else{
     force = PVector.random2D();
    }
   
   }
    }
   
    if(record < 500){
      locked = true; 
     }else{
      locked = false; 
     }
    
    acc = force.div(mass);
    vel.add(acc);
    vel.limit(mass/(massmod*200));
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
   
   boolean dead(){
     return ecodead;
   }
   
}
