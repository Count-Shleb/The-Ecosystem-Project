class Plant extends LivingThing{
 
  Plant(){
    hp=1;
    ssize =random(5,10);
    size  = ssize;
    mass = size/2;
    babysize = ssize*2;
   // println(babysize);
    //growth = 1;
    growth = .0025;
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
  
  void baby(){
   if(babytime()){
       size = ssize;
     if(cppop < maxpop){
             
         cppop++;
         Plant pl = new Plant();
         engine.add(pl);
         pl.pos.x = pos.x + random(-10,10);
         pl.pos.y = pos.y + random(-10,10);
       } 
     }
  }
  
}
