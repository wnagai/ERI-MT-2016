package labsmart.unifei.edu.br.fragexample;

import processing.core.PApplet;

public class ColorfulBalls extends PApplet {

    Ball balls[];

    public void settings() {
        size(displayWidth, displayHeight);
    }

    public void setup() {
        balls = new Ball[PApplet.parseInt(random(10)) + 1];
        for (int i = 0; i < balls.length; i++)
            balls[i] = new Ball();
    }

    public void draw() {
        background(0);
        for(Ball ball : balls)
        {
            ball.update();
            ball.checkCollision();
            ball.draw();
        }
    }

    class Ball {
        int x, y, dirx, diry, size;
        int c;
        Ball() {
            if(width > height)
                this.size = height/16;
            else
                this.size = width/16;

            this.x = (int) (PApplet.parseInt(random(width/2)) + (int) width*0.25);
            this.y = (int) (PApplet.parseInt(random(height/2)) + (int) height*0.25);

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
            if (this.x < size/2 || this.x > width-size/2)
                this.dirx *= -1;
            if (this.y < size/2 || this.y > height-size/2)
                this.diry *= -1;
        }
    }
}
