class Walkerc extends LivingThing{
 
  
  Walkerc(){
    hp=1;
    ssize =random(5,10);
    size  = ssize;
    massmod = 4;
    mass = size*massmod;
    babysize = ssize*2;
    age = 0;
    lifespan = 7200;
  }
  
  void act(){
    age++;
    
     record = 250;
     
     locked = false;
    
     for(int i = 0; i < herbivores.size(); i++){
      
       LivingThing h = herbivores.get(i);
        
        if(h instanceof Walkerh){
          
          precord = record;
     if(dist(pos.x, pos.y, h.pos.x, h.pos.y) < precord){
     record = dist(pos.x, pos.y, h.pos.x, h.pos.y);
     }
        
        if(h.size <= size * 1.25){
          if(record < precord){
             if(dist(pos.x, pos.y, h.pos.x, h.pos.y) <= 250){
               locked = true;
             target = new PVector(h.pos.x + random(-h.size, h.size), h.pos.y + random(-h.size, h.size));
             force = PVector.random2D();
             force.add(target);
             force.sub(pos);
           }
          }
        }
           
           if(!locked){
           force = PVector.random2D();
           }
           
          if(dist(pos.x, pos.y, h.pos.x, h.pos.y)<size/2 + h.size/2){
        h.hp--;
        size += h.size/25;
        // println("dead");
      }
        }
        }
        
        if(!locked){
        
           //stroke(255);
  for (int i = 0; i < cols; i++) {
    //line(i*scl,0,i*scl,height);
    for (int j = 0; j < rows; j++) {
      //line(0,j*scl,width,j*scl);
          
      ArrayList<LivingThing> temp = grid[i][j];
        
        for(LivingThing b : temp){
        
        if(b instanceof Walkerb){
          
           precord = record;
     if(dist(pos.x, pos.y, b.pos.x, b.pos.y) < precord){
     record = dist(pos.x, pos.y, b.pos.x, b.pos.y);
     }
          
          if(record < precord){
             if(dist(pos.x, pos.y, b.pos.x, b.pos.y) <= 250){
               locked = true;
             target = new PVector(b.pos.x + random(-b.size, b.size), b.pos.y + random(-b.size, b.size));
             force = PVector.random2D();
             force.add(target);
             force.sub(pos);
           }
          }
        
           
           if(!locked){
           force = PVector.random2D();
           }
           
          if(dist(pos.x, pos.y, b.pos.x, b.pos.y)<size/2 + b.size/2){
        b.hp--;
        tsize += b.size/100;
      }
        }
        
      }
      
    
    }
  }
       
        }
       
    acc = force.div(mass/massmod * 2);
    vel.add(acc);
    vel.limit(mass/massmod/3);
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
    
    
    fill(255,0,0);
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
