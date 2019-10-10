ArrayList<LivingThing> engine;

int ppop = 1000;
int hpop = 15;
int cpop = 2;

int cppop = 0;
int chpop = 0;
int ccpop = 0;

boolean ecodead = false;

Plant p;
Walkerh h;
Walkerc c;


void setup(){
  
  //size(800,800,P2D);
  fullScreen(P2D);
  frameRate(60);
  engine = new ArrayList<LivingThing>(10000);
  spop();
}

void spop(){
  for(int i = 0; i < ppop; i++){
     cppop++;
     Plant p= new Plant();
     engine.add(p);
  }
  
  for(int i = 0; i < hpop; i++){
    chpop++;
    Walkerh h = new Walkerh();
    engine.add(h);
  }
  
 for(int i = 0; i < cpop; i++){
   ccpop++;
   Walkerc c = new Walkerc();
    engine.add(c);
  }
}

  void draw(){
    background(0);
    
    if(chpop <= 0){
      //println("ecodead");
      ecodead = true;
      spop(); 
  }
    
  int i = engine.size()-1;
  while (i>=0) {
    LivingThing thing = engine.get(i);
    thing.act();
    thing.render();
    
    
     LivingThing p = engine.get(i);
   if(p instanceof Plant){
     
     if(p.dead()){
       cppop--;
     }
     
     if(cppop <= 1000){
       
       if(p.babytime()){
         cppop++;
         p.size = p.ssize;
         Plant pl = new Plant();
         engine.add(pl);
       } 
     }
  }
   
    LivingThing h = engine.get(i);
    
    if(h.dead()){
       chpop--;  
    }else{
       ecodead = false; 
    }
    
   if( h instanceof Walkerh){
     chpop++;
      //println(h.age);
   if(h.babytime()){
     
       h.size = h.ssize;
        Walkerh he = new Walkerh();
       engine.add(he); 
    }
   }
   
    LivingThing c = engine.get(i);
     if( c instanceof Walkerc){
       
       if(c.dead()){
         ccpop--; 
       }
       
     if(c.babytime()){
         ccpop++;
         c.size = c.ssize;
         Walkerc ca = new Walkerc();
         engine.add(ca); 
    
    }
    }
    
    if(thing.dead()){
       engine.remove(i); 
    }
   i--; 
  }
  
  
  
  }
