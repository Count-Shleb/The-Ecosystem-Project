class Plant extends LivingThing{
 
  Plant(){
    hp=1;
    ssize =random(5,10);
    size  = ssize;
    mass = size/2;
    babysize = ssize*2;
   // println(babysize);
    growth = .0025;
    age = 0;
    lifespan = 3600;
    count = 0;
  }
  
  void act(){
    
    age++;
    
    count++;
    
    if(count >= 300){
     hp--; 
    }
    
  }
  
  void render(){
    
    
    fill(count,255,0);
    noStroke();
    ellipse(pos.x, pos.y, size,size);
  }
  
  boolean babytime(){
     return size >= babysize;
   }
  
}
