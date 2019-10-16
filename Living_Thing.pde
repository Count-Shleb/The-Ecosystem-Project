abstract class LivingThing{
  
  float ssize, tsize, size, mass, massmod, hp, growth, babysize, age, lifespan , record, precord, count, hunger;
  PVector pos; 
  PVector vel; //naming variable of velocity
  PVector acc; // naming variable of acceleration
  PVector force; //naming variable of force
  PVector target;
  
  boolean locked = false;
  boolean birthing = false;
  
  LivingThing(){
    pos = new PVector((random(width)), (random(height))); //starting location of walker
    vel = new PVector(0,0); //how the walker moves
    acc = new PVector(0,0); 
    force = new PVector(0,0);
    target = new PVector(0,0);
  }
  
  void act(){
    
  }
  
  void render(){
    
  }
 
 boolean babytime(){
   return size >= babysize && tsize >= babysize;
 }
 
  boolean dead(){
  return hp <= 0 || ecodead;
  }
  
}
