class Plant extends LivingThing{
 
  Plant(){
    hp=1;
    ssize =random(5,10);
    size  = ssize;
    mass = size/2;
    babysize = ssize*2;
   // println(babysize);
    growth = .025;
    age = 0;
    lifespan = 3600;
  }
  
  void act(){
    
    age++;
    
    size += growth;
    
    mass = size/2;
  }
  
  void render(){
    
    
    fill(0,255,0);
    noStroke();
    ellipse(pos.x, pos.y, size,size);
  }
  
  boolean babytime(){
     return size >= babysize;
   }
  
}
