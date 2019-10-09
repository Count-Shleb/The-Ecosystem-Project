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
    LivingThing c = engine.get(i);
    
    if( c instanceof Walkerc) {
      if(dist(pos.x, pos.y, c.pos.x, c.pos.y)<c.size-.5){
      hp--;
      c.size+=size/16;
      // println("dead");
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
