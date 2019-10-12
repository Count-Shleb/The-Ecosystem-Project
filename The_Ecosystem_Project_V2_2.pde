ArrayList<LivingThing> engine;
ArrayList<LivingThing> [] [] grid;

int ppop = 3000;
int hpop = 15;
int cpop = 2;

int cppop = 0;
int chpop = 0;
int ccpop = 0;

int maxpop = 3000;

int scl = 25;

int cols;
int rows;

boolean ecodead = false;

Plant p;
Walkerh h;
Walkerc c;


void setup(){
  
  size(1200,1200,P2D);
  //fullScreen(P2D);
  frameRate(60);
  engine = new ArrayList<LivingThing>(5000);
  
  cols = width/scl;     // Calculate cols & rows
  rows = height/scl;    
  
  // Initialize grid as 2D array of empty ArrayLists
  grid = new ArrayList[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new ArrayList<LivingThing>();
    }
  }
  
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
    
    for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].clear();
    }
  }
  
  for(LivingThing t : engine){
     int x = int(t.pos.x) / scl; 
     int y = int (t.pos.y) /scl;
     
     for (int n = -1; n <= 1; n++) {
      for (int m = -1; m <= 1; m++) {
        if (x+n >= 0 && x+n < cols && y+m >= 0 && y+m< rows) grid[x+n][y+m].add(t);
      }
    }
    
  }
    
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
     
     if(p.babytime()){
       
     if(cppop <= maxpop){
             
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
