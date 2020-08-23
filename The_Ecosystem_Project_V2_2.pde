ArrayList<LivingThing> engine;
ArrayList<LivingThing> [] [] grid;
ArrayList<LivingThing> nutrients;
ArrayList <LivingThing> herbivores;
ArrayList <LivingThing> devourers;
ArrayList <LivingThing> swarmpoint;

int widths, heights;

int npop = 50;
int ppop = 500;
int hpop = 10;
int cpop = 2;
int spop = 250;
int bpop = 25;
int dpop = 2;
int sppop = 10;

int cnpop = 0;
int cppop = 0;
int chpop = 0;
int ccpop = 0;
int cspop = 0;
int cbpop = 0;
int cdpop = 0;

int maxpop = 500;

int scl = 25;

int cols;
int rows;

boolean ecodead = false;

boolean pause = false;

boolean wkey, akey, skey, dkey, rkey, fkey, space, shift;

int nchance = -1;
int ncounter = 0;

Nutrients n;
Plant p;
Walkerh h;
Walkerc c;
Walkers s;
Walkerb b;
Walkerd d;
Swarmpoint sp;

Cam cam;

Debug debug;

void keyPressed() {
  if( key == 'W' || key == 'w') wkey = true;
  if( key == 'A' || key == 'a') akey = true;
  if( key == 'S' || key == 's') skey = true;
  if( key == 'D' || key == 'd') dkey = true;
  if( key == 'R' || key == 'r') rkey = true;
  if( key == 'F' || key == 'f') fkey = true;
  if( key == ' ')               space = true;
  if (key == CODED && keyCode == SHIFT) shift = true;
  }

void keyReleased() {
  if( key == 'W' || key == 'w') wkey = false;
  if( key == 'A' || key == 'a') akey = false;
  if( key == 'S' || key == 's') skey = false;
  if( key == 'D' || key == 'd') dkey = false;
  if( key == 'R' || key == 'r') rkey = false;
  if( key == 'F' || key == 'f') fkey = false;
  if( key == ' ')               space = false;
  if (key == CODED && keyCode == SHIFT) shift = false;
  }

void setup(){
  size(600,600,P3D);
  //fullScreen(P2D);
  frameRate(60);
  engine = new ArrayList<LivingThing>(6000);
  nutrients = new ArrayList<LivingThing>(50);
  herbivores = new ArrayList<LivingThing>(50);
  devourers = new ArrayList<LivingThing>(10);
  swarmpoint = new ArrayList<LivingThing>(sppop);
  
  widths = width*4;
  heights = height*4;
  
  debug = new Debug();
  cam = new Cam();
  
  cols = widths/scl;     // Calculate cols & rows
  rows = heights/scl;    
  
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
    herbivores.add(h);
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
  
  for(int i = 0; i < sppop; i++){
   Swarmpoint s = new Swarmpoint();
    engine.add(s);
    swarmpoint.add(s);
  }
  
  for(int i = 0; i < bpop; i++){
   cbpop++;
   Walkerb b = new Walkerb();
    engine.add(b);
  }
  
  for(int i = 0; i < dpop; i++){
   cdpop++;
   Walkerd d = new Walkerd();
    engine.add(d);
    devourers.add(d);
  }
}


  void draw(){
    
    if(pause){
      background(0);
      cam.update();
      if(keyPressed && key == 'p'){
      debug.act();
      debug.show(); 
    }
    }
    
   if(!pause){
      
    background(0);
    
    cam.update();
    
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
    
    //if(ccpop <= 0){
    // println("cpopd");
    //}
    
    if(ccpop <= 0 || chpop <= 0){
     // println("ecodead");
      ecodead = true; 
  }
    
    nchance = -1;
   
    if(ncounter >= 300){
    nchance = int(random(0, 4));
    ncounter = 0;
    
    if(nchance >= 2){
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
     if(cppop < maxpop){
             
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
       herbivores.remove(h);
    }
     
      //println(h.age);
   if(h.babytime()){
       chpop++;
       h.tsize = h.ssize;
        Walkerh he = new Walkerh();
       engine.add(he);
       herbivores.add(he);
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
     if(cspop < maxpop){
             
         cspop++;
         Walkers sw = new Walkers();
         engine.add(sw);
         //sw.pos = s.pos;
       } 
     }
  }
  
  LivingThing sp = engine.get(i);
   if(sp instanceof Swarmpoint){     
     if(sp.dead()){
     swarmpoint.remove(sp);
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
  
   LivingThing d = engine.get(i);
   if(d instanceof Walkerd){     
     if(d.dead()){
       cdpop--;
       devourers.remove(d);
     }
     
     if(d.babytime()){
       d.tsize = d.ssize;
     if(cdpop <= maxpop){
             
         cdpop++;
         Walkerd de = new Walkerd();
         engine.add(de);
       } 
     }
  }
    
    if(thing.dead()){
       engine.remove(i); 
       ncounter++;
    }
   i--; 
  }
  
  if(ecodead){
   ecodead = false;
   spop(); 
  }
  
  if(keyPressed && key == 'p'){
    debug.act();
    debug.show();
  }
    }
  
  
  
   
    if(space){
      if(!pause){
        pause = true;
      }else{
      pause = false;
      }
    }
  }
  
