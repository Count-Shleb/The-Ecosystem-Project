abstract class LivingThing{
  
  float ssize, size, mass, hp, growth, babysize, age, lifespan;
  PVector pos; 
  PVector vel; //naming variable of velocity
  PVector acc; // naming variable of acceleration
  PVector force; //naming variable of force
  
  LivingThing(){
     pos = new PVector((random(width)), (random(height))); //starting location of walker
    vel = new PVector(0,0); //how the walker moves
    acc = new PVector(0,0); 
    force = new PVector(0,0);
  }
  
  void act(){
    
  }
  
  void render(){
    
  }
 
 boolean babytime(){
   return false;
 }
 
  boolean dead(){
  return hp <= 0 || ecodead;
  }
  
}
