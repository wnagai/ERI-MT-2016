class Feeling
{
  String feeling;
  PImage image;
  color c;
  int frequency;

  Feeling(String feeling, PImage image, color c)
  {
    this.feeling = feeling;
    this.image = image;
    this.c = c;
    this.frequency = 0;
  }

  void resize(int w, int h)
  {
    image.resize(w, h);
  }
}