package iDisplays;
import flash.display.DisplayObject;
import flash.display.Sprite;
import model.display.IDisplay;
import model.display.IDisplayContainer;

/**
 * ...
 * @author val
 */
class DisplaySprite extends Sprite implements IDisplayContainer
{

	public function new() 
	{
		super();
	}
	private var _source:Dynamic;
	public var source(get,set):Dynamic;
	public function get_source():Dynamic
	{
		return _source;
	}
	public function set_source(value:Dynamic):Dynamic
	{
		_source = value;
		return _source;
	}
	public function adChild(child:Dynamic):Void
	{
		addChild(Std.instance(child, DisplayObject));
	}
	public function adChildAt(child:Dynamic, index:Int):Void
	{
		addChildAt(Std.instance(child, DisplayObject), index);
	}
	public function updatePosition():Void
	{
		
	}
	public function updateView():Void
	{
		
	}
	public function removeFromParent():Void
	{
		
	}
}