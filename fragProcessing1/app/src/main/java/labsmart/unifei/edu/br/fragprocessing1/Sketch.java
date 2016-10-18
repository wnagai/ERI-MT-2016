package labsmart.unifei.edu.br.fragprocessing1;

import processing.core.PApplet;

/**
 * Created by walter on 11/10/16.
 */

import processing.core.*;

public class Sketch extends PApplet {

    Ball myBall[];
    int amount;
    public void setup() {

        amount = PApplet.parseInt(random(10)) + 1;
        myBall = new Ball[amount];
        for (int i = 0; i < amount; i++)
            myBall[i] = new Ball();
    }

    public void draw() {
        background(0);
        fill(255);
        for (int i = 0; i < amount; i++) {
            myBall[i].update();
            myBall[i].checkCollision();
            myBall[i].draw();
        }
    }
    public void settings() {  size(displayWidth,displayHeight); }

    class Ball {
        int x, y, dirx, diry, size;
        int c;
        Ball() {
            if(width > height)
                this.size = height/16;
            else
                this.size = width/16;

            this.x = PApplet.parseInt(random(width/2)) + this.size;
            this.y = PApplet.parseInt(random(height/2)) + this.size;

            this.dirx = this.diry = PApplet.parseInt(random(10)) + 1;
            this.c = color(random(255), random(255), random(255));
        }
        public void draw() {
            fill(this.c);
            ellipse(this.x, this.y, this.size, this.size);
        }
        public void update() {
            this.x += this.dirx;
            this.y += this.diry;
        }
        public void checkCollision() {
            if (this.x < size/2 || this.x > width-size/2) this.dirx *= -1;
            if (this.y < size/2 || this.y > height-size/2) this.diry *= -1;
        }
    }
}
