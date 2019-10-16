class Plant extends LivingThing{
 
  Plant(){
    hp=1;
    ssize =random(5,10);
    size  = ssize;
    mass = size/2;
    babysize = ssize*2;
   // println(babysize);
    growth = .0075;
    age = 0;
    lifespan = 3600;
    hunger = 0;
  }
  
  void act(){
    
    tsize = size;
    
    age++;
    
    hunger++;
    
    if(hunger >= 300){
     hp--; 
    }
    
  }
  
  void render(){
    
    
    fill(hunger,255,0);
    noStroke();
    ellipse(pos.x, pos.y, size,size);
  }
  
}
