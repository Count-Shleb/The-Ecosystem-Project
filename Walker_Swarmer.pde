class Walkers extends LivingThing{
 
  Walkers(){
    hp=1;
    ssize = random(1,2);
    size  = ssize;
    mass = size*100;
    babysize = ssize*2;
    age = 0;
    lifespan = 1200;
  }
  
  void act(){
    age++;
    
    mass = size/2;
    
    force = PVector.random2D();
    
    for(int i = 0; i < nutrients.size(); i++){
      
       LivingThing n = engine.get(i);
       
   if(n instanceof Nutrients){ 
     
     if(dist(pos.x, pos.y, n.pos.x, n.pos.y) <= 100){
    target = new PVector(n.pos.x + random(-n.size, n.size), n.pos.y + random(-n.size, n.size));
    force = target;
    force.sub(pos);
    force.add(PVector.random2D());
     }
    }
    
    }
    
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
