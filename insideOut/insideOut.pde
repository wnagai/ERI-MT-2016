int imageWidth, imageHeight, squareSize, numClicks;
int mood = -1;
boolean isFinished = false;

Feeling []feelings;

void setup()
{
  fullScreen();

  feelings = new Feeling[5];

  feelings[0] = new Feeling("Angry", loadImage("angry.jpg"), color(255, 0, 0));
  feelings[1] = new Feeling("Disgust", loadImage("disgust.jpg"), color(0, 255, 0));
  feelings[2] = new Feeling("Fear", loadImage("fear.jpg"), color(255, 0, 255));
  feelings[3] = new Feeling("Joy", loadImage("joy.jpg"), color(255, 192, 0));
  feelings[4] = new Feeling("Sad", loadImage("sad.jpg"), color(0, 0, 255));

  numClicks = 10;
  imageWidth = displayWidth / 5;
  imageHeight = displayHeight / 5;
  squareSize = (displayWidth - imageWidth)/numClicks;

  for (int i = 0; i < feelings.length; i++)
    feelings[i].resize(imageWidth, imageHeight);

  noStroke();
}

void mousePressed()
{
  int idx = whichImage(mouseX, mouseY);
  if (idx >= 0) {
    if (feelings[idx].frequency < numClicks)
      feelings[idx].frequency++;
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
    for (int i = 0; i < feelings.length; i++) {
      image(feelings[i].image, 0, feelings[i].image.height * i);
      fill(feelings[i].c);
      rect(imageWidth, i*imageHeight, squareSize*feelings[i].frequency, imageHeight);
    }
  } else {
    int textSize = height / 10;
    fill(feelings[mood].c);
    textSize(textSize);
    text(feelings[mood].feeling, (width - textWidth(feelings[mood].feeling))/2, height/2 - textSize/2);
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