class Walkerh extends LivingThing{
 
  Walkerh(){
    hp=1;
    ssize =random(2.5,12.5);
    tsize = ssize;
    size  = ssize;
    massmod = 250;
    mass = size*massmod;
    babysize = ssize*2;
    age = 0;
    lifespan = random(3600,7200);
  }
  
  void act(){
    age++;
    
    if(tsize > size){
     size += .025; 
    }
    
    if(tsize < size){
    size -= .025;  
    }
    
        record = 500;
    
    locked = false;
    
     for(int i = 0; i < nutrients.size(); i++){
      
       LivingThing n = nutrients.get(i);
        
        if(n instanceof Nutrients){
          
          precord = record;
     if(dist(pos.x, pos.y, n.pos.x, n.pos.y) < precord){
     record = dist(pos.x, pos.y, n.pos.x, n.pos.y);
     }
        
       
          if(record < precord){
             if(dist(pos.x, pos.y, n.pos.x, n.pos.y) <= 500){
               n.count ++;
             locked = true;
             target = new PVector(n.pos.x + random(-n.size, n.size), n.pos.y + random(-n.size, n.size));
             force = target;
             //force.add(PVector.random2D());
             force.sub(pos);
           }
          }
           
           if(dist(pos.x, pos.y, n.pos.x, n.pos.y)<size + n.size/2){
            locked = false; 
           }
           
           if(!locked){
            PVector.random2D(force); 
           }
           
           
           }
        }
    
    
     if(locked){
    acc = force.div(mass);
    }else{
    acc = force.div(mass/massmod);  
    }
    
    vel.add(acc);
    vel.limit(mass/massmod/3);
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
        tsize += p.size/2500;
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
