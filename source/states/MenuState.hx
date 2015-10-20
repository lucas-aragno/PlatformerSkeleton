package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxStringUtil;

/**
 * @author: Lucas Aragno
 **/

class MenuState extends FlxState
{
	// Options for the menu
	public static inline var OPTIONS:Int = 3;
	public static inline var TEXT_SPEED:Float = 600;

	private var _text1:FlxText;
	private var _text2:FlxText;
	private var _text3:FlxText;	
	private var _text4:FlxText;
	private var _text5:FlxText;

	private var _pointer:FlxSprite;

	private var _option:Int;


	override public function create():Void
	{
		FlxG.mouse.visible = false;
		FlxG.state.bgColor = 0xFFFFFFFF;
				
		// First word of the title		
		_text1 = new FlxText( -220, FlxG.height / 4, 320, "Platformer");
		_text1.moves = true;
		_text1.size = 40;
		_text1.color = 0x000000;
		_text1.antialiasing = true;
		_text1.velocity.x = TEXT_SPEED;
		add(_text1);

		// Second word of the title

		_text2 = new FlxText(FlxG.width - 50, FlxG.height / 2.5, 320, "Skeleton");
		_text2.moves = true;
		_text2.size = _text1.size;
		_text2.color = _text1.color;
		_text2.antialiasing = _text1.antialiasing;
		_text2.velocity.x = - TEXT_SPEED;
		add(_text2);

		_text3 = new FlxText(FlxG.width * 2 / 3, FlxG.height * 2 / 3, 150, "Play");
		_text4 = new FlxText(FlxG.width * 2 / 3, FlxG.height * 2 / 3 + 30, 150, "About the developer");
		_text5 = new FlxText(FlxG.width * 2 / 3, FlxG.height * 2 / 3 + 80, 150, "Visit flixel.org");
		_text3.color = _text4.color = _text5.color = 0x000000;
		_text3.size = _text4.size = _text5.size = 16;
		_text3.antialiasing = _text4.antialiasing = _text5.antialiasing = true;
		add(_text3);
		add(_text4);
		add(_text5);

		_pointer = new FlxSprite();
		_pointer.loadGraphic("assets/images/pointer.png");
		_pointer.x = _text3.x - _pointer.width - 10;
		add(_pointer);
		_option = 0;


		super.create();
	}
	

	override public function destroy():Void
	{
		super.destroy();
	}


	override public function update():Void
	{
				
		if (_text1.x > FlxG.width / 5)	
		{
			_text1.velocity.x = 0;
		}
		
		if (_text2.x < FlxG.width / 2.5) 
		{
			_text2.velocity.x = 0;
		}
		
		switch(_option)    
		{
			case 0:
				_pointer.y = _text3.y;
			case 1:
				_pointer.y = _text4.y;
			case 2:
				_pointer.y = _text5.y;
		}
		
		if (FlxG.keys.justPressed.UP)
		{
			_option = (_option + OPTIONS - 1) % OPTIONS; 
			FlxG.sound.play("assets/sounds/menu.wav", 1, false);
		}
		
		if (FlxG.keys.justPressed.DOWN)
		{
			_option = (_option + OPTIONS + 1) % OPTIONS;
			FlxG.sound.play("assets/sounds/menu.wav", 1, false);
		}
		
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER", "C"]))
		{
			switch (_option) 
			{
				case 0:
					//FlxG.cameras.fade(0xff969867, 1, false, startGame);
					FlxG.sound.play("assets/sounds/coin.wav", 1, false);
				case 1:
					FlxG.openURL("http://lucas-aragno.github.io");
				case 2:
					FlxG.openURL("http://flixel.org");
			}
		}
		
		super.update();
	}	
}