int imageWidth, imageHeight, squareSize, numClicks;
int mood = -1;
boolean isFinished = false;
String urlBase;

JSONObject insideOutJSON;
JSONArray feelingsArray;
Feeling []feelings;

void setup()
{
  fullScreen();

  insideOutJSON = loadJSONObject("insideOut.json");
  urlBase = insideOutJSON.getString("url-base");
  feelingsArray = insideOutJSON.getJSONArray("feelings");

  feelings = new Feeling[feelingsArray.size()];
  for (int i = 0; i < feelingsArray.size(); i++) {
    JSONArray colorsArray = feelingsArray.getJSONObject(i).getJSONArray("color");
    feelings[i] = new Feeling(feelingsArray.getJSONObject(i).getString("feeling"), 
      loadImage(feelingsArray.getJSONObject(i).getString("image")), 
      color(colorsArray.getJSONObject(0).getInt("R"), 
      colorsArray.getJSONObject(0).getInt("G"), 
      colorsArray.getJSONObject(0).getInt("B")));
  }

  numClicks = 10;
  imageWidth = width / feelingsArray.size();
  imageHeight = height / feelingsArray.size();
  squareSize = (width - imageWidth)/numClicks;

  for (int i = 0; i < feelingsArray.size(); i++)
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