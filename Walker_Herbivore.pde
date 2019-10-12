class Walkerh extends LivingThing{
 
  Walkerh(){
    hp=1;
    ssize =random(5,10);
    size  = ssize;
    mass = size/2;
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
    vel.limit(mass);
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
    
    int i = 0;
    while (i < engine.size()) {
    LivingThing p = engine.get(i);
    if(p instanceof Plant) {
      if(dist(pos.x, pos.y, p.pos.x, p.pos.y)<size + p.size/2){
      p.hp--;
       size += p.size/128;
      }
    }
      i++;
    }
    }
  
  void render(){
    
    
    fill(0,0,255);
    noStroke();
    ellipse(pos.x, pos.y, size,size);
  }
  
   boolean babytime(){
     return size >= babysize || ecodead;
   }
   
}
