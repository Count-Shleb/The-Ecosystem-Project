class Walkerc extends LivingThing{
 
  Walkerc(){
    hp=1;
    ssize =random(10,15);
    size  = ssize;
    mass = size/2;
    babysize = ssize*2;
    age = 0;
    lifespan = 7200;
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
    
  }
  
  void render(){
    
    
    fill(255,0,0);
    noStroke();
    ellipse(pos.x, pos.y, size,size);
  }
  
  boolean babytime(){
     return size >= babysize || ecodead;
   }
  
}
