class Scoreboard
{
  int score;
  
  Scoreboard() {
    score = 0;
  }
  
  void add(int points)
  {
    score += points;
  }
  
  void display()
  {
    PFont font;
    
    font = createFont("Arial", 28);
    textFont(font);
    text("Score: " + score, 10, 30);
  }
}