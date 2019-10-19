class ColorUtils
{
	public static function SetColor(mc:MovieClip, r:Number, g:Number, b:Number)
	{
		var clr = new Color(mc);
		var trans = new Object();
		trans = clr.getTransform();
	
		trans.rb = r;
		trans.gb = g;
		trans.bb = b;

		clr.setTransform(trans);
	}
	
	public static function Colorize(mc:MovieClip, r:Number, g:Number, b:Number)
	{
		var clr = new Color(mc);
		var trans = clr.getTransform();		
	
		trans.rb = r - 100;
		trans.gb = g - 100;
		trans.bb = b - 100;
		
		clr.setTransform(trans);
	}

	public static function Colorize2(mc, r, g, b)
	{
		var clr = new Color(mc);
		
		var topR = r + 100 > 255 ? 255 : r+100;
		var topG = g + 100 > 255 ? 255 : g+100;
		var topB = b + 100 > 255 ? 255 : b+100;
		
		var lowR = r - 20 < 0 ? 0 : r-20;
		var lowG = g - 20 < 0 ? 0 : g-20;
		var lowB = b - 20 < 0 ? 0 : b-20;
		
		ColorUtils.ColorizeGradient(mc, topR,topG,topB, lowR, lowG, lowB);
	}


	// ==== colorize ======== //
	// applies colours specified in the arguments to a
	// greyscale image.
	// White is replaced by col1, black is replaced by col2
	// greys in between are coloured smoothly between the two colours
	public static function ColorizeGradient(mc, r1, g1, b1, r2, g2,b2)
	{
		var clr = new Color(mc);
		var trans = clr.getTransform();		
	   
		trans.ra = (r1-r2)*100/255;
		trans.ga = (g1-g2)*100/255;
		trans.ba = (b1-b2)*100/255;

		trans.rb = r2;
		trans.gb = g2;
		trans.bb = b2;

		mc.setTransform(trans);
	}
}