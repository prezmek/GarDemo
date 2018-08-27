//
// Copyright 2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Timer;
using Toybox.Math;

var timer1;
var count1 = 0;
var r = 49;
var dir = -3;
var x = 0;
var y = 0;
var kat = 0.0;

class GNotesView extends WatchUi.View {

	hidden var mIcon;

    function initialize() {
        WatchUi.View.initialize();
		
		mIcon = WatchUi.loadResource(Rez.Drawables.id_apes);
		
    }

    function callback1() {
        count1 += 1;

		r += 1 * dir;
		if(r > 50 || r < 30) {
			dir *= -1;
		}

		x = 120 * Math.cos(kat);
		y = 120 * Math.sin(kat);
		kat += 0.003;
		if(kat > 2 * Math.PI) {
			kat = 0;
		}
		
        WatchUi.requestUpdate();
    }

    function onLayout(dc) {
        timer1 = new Timer.Timer();
        timer1.start(method(:callback1), 50, true);
    }

    function onUpdate(dc) {
        var string;

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
		
        dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
		dc.drawText(120, 20, Graphics.FONT_TINY, "Hello Im ppazio", Graphics.TEXT_JUSTIFY_CENTER);
		
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        string = "Count: " + count1;
        dc.drawText(40, (dc.getHeight() / 2) - 50, Graphics.FONT_MEDIUM, string, Graphics.TEXT_JUSTIFY_LEFT);
		
		dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_WHITE);
		dc.fillCircle(200, 200, r);
		
		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
		dc.drawLine(dc.getWidth() / 2, dc.getHeight() / 2, x + dc.getWidth() / 2, y + dc.getHeight() / 2);
		
		dc.drawBitmap(40, 100, mIcon);
    }

}
