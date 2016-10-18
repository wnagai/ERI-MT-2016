//import processing.sound.*;    // uncomment for Processing
import cassette.audiofiles.SoundFile;  // cassette library for Android mp3 sounds

SoundFile file[];

void setup()
{
  fullScreen();

  file = new SoundFile[4];
  file[0] = new SoundFile(this, "167337__willy-ineedthatapp-com__pup-alert.mp3");
  file[1] = new SoundFile(this, "167338__willy-ineedthatapp-com__pup-fat.mp3");
  file[2] = new SoundFile(this, "167346__willy-ineedthatapp-com__droplet-good5.mp3");
  file[3] = new SoundFile(this, "167347__willy-ineedthatapp-com__droplet-good4.mp3");
}

void draw()
{
  background(255);
  fill(0);
  if (mousePressed)
  {
    // right
    if (mouseX > width*0.75) {
      rect(width*0.75, 0, width*0.25, height);
      file[0].play();
    }
    // left
    else if (mouseX < width*0.25) {
      rect(0, 0, width*0.25, height);
      file[1].play();
    }      
    // top
    else if (mouseY < height*0.25) {
      rect(0, 0, width, height*0.25);
      file[2].play();
    }      
    // bottom
    else if (mouseY > height*0.75) {
      rect(0, height*0.75, width, height*0.25);
      file[3].play();
    } else
      rect(width*0.25, height*0.25, width/2, height/2);
  }
}