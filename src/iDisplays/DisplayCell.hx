package iDisplays;

import flash.display.Sprite;
import model.cells.Cell;
import model.cells.ICellDisplay;
import model.display.IDisplayContainer;

/**
 * ...
 * @author val
 */
class DisplayCell extends DisplaySprite implements ICellDisplay
{

	public function new() 
	{
		super();
		
	} 
	private var color:UInt;
	private var cell:Cell;
	override public function set_source(value:Dynamic):Dynamic
	{
		super.set_source(value);
		cell = Std.instance(value, Cell);
		color = Cell.CELL_COLORS[Std.int(randRange(0, Cell.CELL_COLORS.length - 1))];
		
		return _source;
	}
	override public function updateView():Void
	{
		graphics.clear();
		graphics.beginFill(color);
		graphics.drawRoundRect(0, 0, cell.width, cell.height, cell.width * 0.15, cell.height * 0.15);
		graphics.endFill();
		
		graphics.beginFill(0);
		graphics.drawCircle(cell.width / 2, cell.height / 2, cell.width * 0.15);
		graphics.endFill();
	}
	override function updatePosition():Void
	{
		x = (cell.fieldX * cell.width) + (cell.fieldX*15);
		y = (cell.fieldY * cell.height) + (cell.fieldY*15);
	}
	public static function randRange(minNum:Float, maxNum:Float,offset:Float=1):Float 
	{
		return (Math.floor(Math.random() * (maxNum - minNum + offset)) + minNum);
	}
}