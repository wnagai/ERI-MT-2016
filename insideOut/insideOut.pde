PImage []images;
int []frequencies;
color []colors;
boolean isFinished = false;
int mood = -1;
String []feelings;
int imageWidth, imageHeight, squareSize, numClicks;

void setup()
{
  fullScreen();

  feelings = new String[5];
  feelings[0] = new String("Angry");
  feelings[1] = new String("Disgust");
  feelings[2] = new String("Fear");
  feelings[3] = new String("Joy");
  feelings[4] = new String("Sad");

  images = new PImage[5];
  images[0] = loadImage("angry.jpg");
  images[1] = loadImage("disgust.jpg");
  images[2] = loadImage("fear.jpg");
  images[3] = loadImage("joy.jpg");
  images[4] = loadImage("sad.jpg");

  numClicks = 10;
  imageWidth = displayWidth / 5;
  imageHeight = displayHeight / 5;
  squareSize = (displayWidth - imageWidth)/numClicks;

  frequencies = new int[5];
  for (int i = 0; i < 5; i++) {
    images[i].resize(imageWidth, imageHeight);
    frequencies[i] = 0;
  } 

  colors = new color[5];
  colors[0] = color(255, 0, 0);
  colors[1] = color(0, 255, 0);
  colors[2] = color(255, 0, 255);
  colors[3] = color(255, 192, 0);
  colors[4] = color(0, 0, 255);

  noStroke();
}

void mousePressed()
{
  int idx = whichImage(mouseX, mouseY);
  if (idx >= 0) {
    if (frequencies[idx] < numClicks)
      frequencies[idx]++;
    else {
      isFinished = true;
      mood = idx;
    }
  }
}

void draw()
{
  background(0);
  if (!isFinished)
  {
    for (int i = 0; i < 5; i++) {
      image(images[i], 0, images[i].height * i);
      fill(colors[i]);
      rect(imageWidth, i*imageHeight, squareSize*frequencies[i], imageHeight);
    }
  }
  else {
    int textSize = height / 10;
    fill(colors[mood]);
    textSize(textSize);
    text(feelings[mood], (width - textWidth(feelings[mood]))/2, height/2 - textSize/2);
    text("wins!!", (width - textWidth("wins!!"))/2, height / 2 + textSize/2);
  }
}

int whichImage(float x, float y)
{
  int idxImage = int(y / imageHeight);
  if (x > imageWidth)
    return -1;
  return idxImage;
}