class Walkers extends LivingThing{
 
  Walkers(){
    hp=1;
    ssize = random(1,2);
    size  = ssize;
    massmod = 250;
    mass = size*massmod;
    babysize = ssize*2;
    age = 0;
    lifespan = random(600,1200);
    hunger = 0;
  }
  
  void act(){
    age++;
    
    hunger++;
    
    if(hunger >= 300){
     hp--; 
    }
    
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
               sp.count ++;
             locked = true;
             target = new PVector(sp.pos.x + random(-sp.size, sp.size), sp.pos.y + random(-sp.size, sp.size));
             force = target;
             //force.add(PVector.random2D());
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
    if(locked){
    acc = force.div(mass);
    }else{
    acc = force.div(mass/massmod);  
    }
    
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
    
    
    fill(255, 0, 255);
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
   
}

class Swarmpoint extends LivingThing{
  
  Swarmpoint(){
    size = 100;
    massmod = 50;
    mass = size*massmod;
  }
  
  void act(){
    
    //ellipse(pos.x,pos.y,size,size);
    
    count = 0;
    
       record = 500;
       
       locked = false;
    
   for(int i = 0; i < nutrients.size(); i++){
      
       LivingThing n = nutrients.get(i);
       
   if(n instanceof Nutrients){
     
     precord = record;
     
     if(dist(pos.x, pos.y, n.pos.x, n.pos.y) <= precord){
     record = dist(pos.x, pos.y, n.pos.x, n.pos.y);
     }
     
  
      if(record < precord){
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
   
    for(int i = 0; i < swarmpoint.size(); i++){
      
       LivingThing sp = swarmpoint.get(i);
       
   if(sp instanceof Swarmpoint){
     
     if(sp != this){
        float ang = atan2(pos.y - sp.pos.y, pos.x - sp.pos.x);
   float dist = pos.dist(new PVector(sp.pos.x,sp.pos.y));
   
   if(dist < size * 2.5){
     float repel = map(dist,0,100,50,0);
     vel.x += -repel * cos(ang);
     vel.y += -repel * sin(ang);
   }
 
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
    
    if(pos.x > width+1){ //containing the walker in the window
     pos.x = -1; 
    }
     if(pos.x < -1){
     pos.x = width+1;
   }
     if(pos.y > height+1){
     pos.y = -1; 
    }
     if(pos.y < -1){
     pos.y = height+1;
   }

  }
   
   boolean dead(){
     return ecodead;
   }
   
}
