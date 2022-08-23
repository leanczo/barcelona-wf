import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class barcelonawfView extends WatchUi.WatchFace {
  	var logo;
    var font;
    
    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
    	font = WatchUi.loadResource(Rez.Fonts.font);
     	logo = WatchUi.loadResource(Rez.Drawables.Logo);
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get the current time and format it correctly
        var timeFormat = "$1$:$2$";
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (getApp().getProperty("UseMilitaryFormat")) {
                timeFormat = "$1$$2$";
                hours = hours.format("%02d");
            }
        }
        
        var widthScreen = dc.getWidth();
		var heightScreen = dc.getHeight();
		
		var bandWidth = widthScreen / 6;
		var band2positionX = widthScreen * 1 / 7;
		var band3positionX = widthScreen * 2 / 7;
		var band4positionX = widthScreen * 3 / 7;
		var band5positionX = widthScreen * 4 / 7;
		var band6positionX = widthScreen * 5 / 7;
		var band7positionX = widthScreen * 6 / 7;
		
        dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_BLUE);
		dc.fillRectangle(0, 0, bandWidth, heightScreen);
		
		dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_BLUE);
		dc.fillRectangle(band2positionX, 0, bandWidth, heightScreen);

		dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_BLUE);
		dc.fillRectangle(band3positionX, 0, bandWidth, heightScreen);
		
		dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_BLUE);
		dc.fillRectangle(band4positionX, 0, bandWidth, heightScreen);
		
		dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_BLUE);
		dc.fillRectangle(band5positionX, 0, bandWidth, heightScreen);
		
		dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_BLUE);
		dc.fillRectangle(band6positionX, 0, bandWidth, heightScreen);
		
		dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_BLUE);
		dc.fillRectangle(band7positionX, 0, bandWidth, heightScreen);
		
        // Logo
        var positionLogoX = (widthScreen / 2 ) - 45;
        var positionLogoY = (heightScreen / 2);
        dc.drawBitmap(positionLogoX, positionLogoY, logo);
        
        var positionTimeX = widthScreen / 2;
        var positionTimeY = heightScreen / 6 ;
        
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);
        dc.setColor(getApp().getProperty("ForegroundColor"), Graphics.COLOR_TRANSPARENT);
    	dc.drawText(positionTimeX, positionTimeY, font, timeString, Graphics.TEXT_JUSTIFY_CENTER);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
