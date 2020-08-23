class Walkerb extends LivingThing{

  Walkerb(){
    hp=1;
    ssize = random(2, 2.5);
    size  = ssize;
    massmod = 250;
    mass = size*massmod;
    babysize = ssize*2;
    age = 0;
    lifespan = random(1200, 3600);
  }
  
  void act(){
    age++;
    
    tsize = size;
    
    force = PVector.random2D();
    
     record = 2000;
    
    for(int i = 0; i < swarmpoint.size(); i++){
      
       LivingThing sp = swarmpoint.get(i);
        
        if(sp instanceof Swarmpoint){
          
          precord = record;
     if(dist(pos.x, pos.y, sp.pos.x, sp.pos.y) < precord){
     record = dist(pos.x, pos.y, sp.pos.x, sp.pos.y);
     }
        
       
          if(record < precord){
             if(dist(pos.x, pos.y, sp.pos.x, sp.pos.y) <= 2000){
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
        
        
         //stroke(255);
  for (int i = 0; i < cols; i++) {
    //line(i*scl,0,i*scl,height);
    for (int j = 0; j < rows; j++) {
      //line(0,j*scl,width,j*scl);
          
      ArrayList<LivingThing> temp = grid[i][j];
        
        for(LivingThing s : temp){
        
        if(s instanceof Walkers){
          
          if(s.size <= size){
          if(dist(pos.x, pos.y, s.pos.x, s.pos.y)<size/2 + s.size/2){
        s.hp--;
        size += s.size/1000;
      }
        }
        }
        
      }
      
    }
  }
  
  for(int i = 0; i < devourers.size(); i++){
      
       LivingThing d = devourers.get(i);
       
   if(d instanceof Walkerd){
     

   
   float dist = pos.dist(new PVector(d.pos.x,d.pos.y));
   
   if(dist < d.size * 2.5){
     float ang = atan2(pos.y - d.pos.y, pos.x - d.pos.x);
     float repel = map(dist,0,100,50,0);
     force.x += repel * cos(ang);
     force.y += repel * sin(ang);
   }
 
     
     
   }
       }
  
    acc = force.div(mass);
    vel.add(acc);
    vel.limit(mass/massmod/2);
    pos.add(vel);
    
    if(pos.x > widths+size){ //containing the walker in the window
     pos.x = -size; 
    }
     if(pos.x < -size){
     pos.x = widths+size;
   }
     if(pos.y > heights+size){
     pos.y = -size; 
    }
     if(pos.y < -size){
     pos.y = heights+size;
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
