ArrayList<LivingThing> engine;
ArrayList<LivingThing> [] [] grid;
ArrayList<LivingThing> nutrients;

int npop = 5;
int ppop = 2000;
int hpop = 15;
int cpop = 2;
int spop = 500;
int bpop = 25;

int cnpop = 0;
int cppop = 0;
int chpop = 0;
int ccpop = 0;
int cspop = 0;
int cbpop = 0;

int maxpop = 2000;

int scl = 100;

int cols;
int rows;

boolean ecodead = false;

int nchance = -1;
int ncounter = 0;

Nutrients n;
Plant p;
Walkerh h;
Walkerc c;
Walkers s;
Walkerb b;


void setup(){
  
  size(800,800,P2D);
  //fullScreen(P2D);
  frameRate(60);
  engine = new ArrayList<LivingThing>(5000);
  nutrients = new ArrayList<LivingThing>(50);
  
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
  for(int i = 0; i < npop; i++){
   cnpop++;
   Nutrients n = new Nutrients();
    engine.add(n);
    nutrients.add(n);
  }
  
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
  
  for(int i = 0; i < spop; i++){
   cspop++;
   Walkers s = new Walkers();
    engine.add(s);
  }
  
  for(int i = 0; i < bpop; i++){
   cbpop++;
   Walkerb b = new Walkerb();
    engine.add(b);
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
    
    if(ccpop <= 0 || chpop <= 0){
      println("ecodead");
      ecodead = true; 
  }
  
  if(ecodead){
   ecodead = false;
   spop(); 
  }
    
    nchance = -1;
   
    if(ncounter >= 600){
    nchance = int(random(0, 3));
    ncounter = 0;
    
    if(nchance >= 1){
    cnpop++;
    Nutrients nu = new Nutrients();
    engine.add(nu);
    nutrients.add(nu);
    }
    }
    
    ncounter++;
    
  int i = engine.size()-1;
  while (i>=0) {
    LivingThing thing = engine.get(i);
    thing.act();
    thing.render();
    
    LivingThing n = engine.get(i);
   if(n instanceof Nutrients){ 
     if(n.dead()){
       cnpop--;
       nutrients.remove(n);
     }
  }
  
     LivingThing p = engine.get(i);
   if(p instanceof Plant){     
     if(p.dead()){
       cppop--;
     }
     
     if(p.babytime()){
       p.size = p.ssize;
     if(cppop <= maxpop){
             
         cppop++;
         Plant pl = new Plant();
         engine.add(pl);
       } 
     }
  }
   
    LivingThing h = engine.get(i);
    
    
    
   if( h instanceof Walkerh){
     
     if(h.dead()){
       chpop--;        
    }
     
      //println(h.age);
   if(h.babytime()){
       chpop++;
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
    
    LivingThing s = engine.get(i);
   if(s instanceof Walkers){     
     if(s.dead()){
       cspop--;
     }
     
     if(s.babytime()){
       s.size = s.ssize;
     if(cspop <= maxpop){
             
         cspop++;
         Walkers sw = new Walkers();
         engine.add(sw);
       } 
     }
  }
  
  LivingThing b = engine.get(i);
   if(b instanceof Walkerb){     
     if(b.dead()){
       cbpop--;
     }
     
     if(b.babytime()){
       b.size = b.ssize;
     if(cbpop <= maxpop){
             
         cbpop++;
         Walkerb bi = new Walkerb();
         engine.add(bi);
       } 
     }
  }
    
    if(thing.dead()){
       engine.remove(i); 
       ncounter++;
    }
   i--; 
  }
  
   //text("HPOP: " + chpop,10,height-6);
  
  }
