package labsmart.unifei.edu.br.fragexample;

import controlP5.Button;
import controlP5.ControlEvent;
import controlP5.ControlP5;
import processing.core.PApplet;

/**
 * Created by walter on 10/11/16.
 */

public class Blank extends PApplet {

    ControlP5 cp5;
    Button []buttons;
    int w, h;
    int myColor;

    public void settings() {
        size(displayWidth, displayHeight);
    }

    public void setup() {
        w = displayWidth / 10;
        h = displayHeight / 7;

        cp5 = new ControlP5(this);
        buttons = new Button[3];
        buttons[0] = cp5.addButton("buttonRed")
                .setCaptionLabel("")
                .setColorBackground(color(255, 0, 0))
                .setPosition(2*w, h)
                .setSize(6*w, h);

        buttons[0] = cp5.addButton("buttonGreen")
                .setCaptionLabel("")
                .setColorBackground(color(0, 255, 0))
                .setPosition(2*w, 3*h)
                .setSize(6*w, h);

        buttons[0] = cp5.addButton("buttonBlue")
                .setCaptionLabel("")
                .setColorBackground(color(0, 0, 255))
                .setPosition(2*w, 5*h)
                .setSize(6*w, h);

        myColor = color(255, 255, 255);
    }

    public void draw() {
        background(myColor);
    }

    public void controlEvent(ControlEvent evt) {
        switch(evt.getController().getName()) {
            case "buttonRed":
                myColor = color(255, 32, 32);
                break;
            case "buttonGreen":
                myColor = color(32, 255, 32);
                break;
            case "buttonBlue":
                myColor = color(32, 32, 255);
                break;
        }
    }
}
