/**
* PolarInfinitas TYPE2: A cillexia project by Christian Bietsch
* Website: www.cillexia.net
*/

// ========== RECORD SETTINGS ==========
static final int TOTAL_FRAMES = 240;    // Total frames to record
static boolean RECORD = false;          // record
static final String NAME = "anima";     // name
static final String FORMAT = "png";     // formate

int counter = 0;                        // counts frames

void setup() {
  size(400, 400);  // image size
}

//** File name: folder/name.format */
final String fileName() { return NAME+"/"+NAME+nf(counter,4)+"."+FORMAT; }

void draw() {
  final float progress = RECORD ? float(counter) / TOTAL_FRAMES : float(counter % TOTAL_FRAMES) / TOTAL_FRAMES;
  draw(progress);
  if (RECORD && counter == 0) { println("Start to record: "+ NAME); }
  if (RECORD) { saveFrame(fileName()); }
  counter++;
  if (RECORD) { println("Save: "+ counter +"/"+TOTAL_FRAMES); }
  if (RECORD && counter == TOTAL_FRAMES) { println("DONE"); exit(); }
}

/** Draws each anima frame with progress [0.0...1.0-frame] (Never reaches 1.0, since this is the beginning of the next cycle) */
void draw(float progress) {
  background(80);
  translate(width*0.5, height*0.5);
  
  final float r = width*0.8;
  
  noStroke();
  
  /* TYPE 2 */
  float p = -1.0+(progress*2.0);
  float p2 = p > 0 ? 1.0-p : -1.0-p;
  if (abs(p2) < abs(p)) {
    // DYNAMIC CIRCLE BLACK
    fill(0); circle(0, 0, r*p);
    // DYNAMIC CIRCLE WHITE
    fill(255); circle(0, 0, r*p2);
  } else {
    // DYNAMIC CIRCLE WHITE
    fill(255); circle(0, 0, r*p2);
    // DYNAMIC CIRCLE BLACK
    fill(0); circle(0, 0, r*p);
  }
  
  /* cillexia */
  textSize(width*0.04);
  textAlign(CENTER, CENTER);
  fill(130);
  text("cillexia", 0, height*0.47);
  fill(30);
  rotate(PI);
  text("cillexia", 0, height*0.47);
}
