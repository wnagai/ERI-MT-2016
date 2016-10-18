int mood = -1;
int []frequencies;
int imageWidth, imageHeight, squareSize, numClicks;
color []colors;
boolean isFinished = false;
String []feelings;
JSONObject insideOutJSON;
JSONArray feelingsArray;
PImage []images;
//PImage wallpaper;

void setup()
{
  //size(960, 600);
  fullScreen();

  insideOutJSON = loadJSONObject("insideOut.json");

  String urlBase;
  urlBase = insideOutJSON.getString("url-base");

  //wallpaper = loadImage(urlBase + insideOutJSON.getString("wallpaper"));
  //wallpaper.resize(width, height);

  feelingsArray = insideOutJSON.getJSONArray("feelings");
  feelings = new String[feelingsArray.size()];
  images = new PImage[feelingsArray.size()];
  colors = new color[feelingsArray.size()];
  for (int i = 0; i < feelingsArray.size(); i++) {
    feelings[i] = feelingsArray.getJSONObject(i).getString("feeling");
    images[i] = loadImage(feelingsArray.getJSONObject(i).getString("image"));
    JSONArray colorsArray = feelingsArray.getJSONObject(i).getJSONArray("color");
    colors[i] = color(colorsArray.getJSONObject(0).getInt("R"), 
      colorsArray.getJSONObject(0).getInt("G"), 
      colorsArray.getJSONObject(0).getInt("B"));
  }

  numClicks = 10;
  imageWidth = width / feelingsArray.size();
  imageHeight = height / feelingsArray.size();
  squareSize = (width - imageWidth)/numClicks;

  frequencies = new int[feelingsArray.size()];
  for (int i = 0; i < feelingsArray.size(); i++) {
    images[i].resize(imageWidth, imageHeight);
    frequencies[i] = 0;
  }

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
  //background(wallpaper);
  background(0);

  if (!isFinished) {
    for (int i = 0; i < feelingsArray.size(); i++) {
      image(images[i], 0, images[i].height * i);
      fill(colors[i]);
      rect(imageWidth, i*imageHeight, squareSize*frequencies[i], imageHeight);
    }
  } else {
    //wallpaper.filter(GRAY);
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