package iDisplays;
import flash.events.MouseEvent;
import model.cells.Cell;

/**
 * ...
 * @author val
 */
class DisplayField extends DisplaySprite
{

	public function new() 
	{
		super();
		addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}
	
	private function onMouseUp(e:MouseEvent):Void 
	{
		var displayCell:DisplayCell = Std.instance(e.target, DisplayCell);
		var cell:Cell = Std.instance(displayCell.source, Cell);
		
		if (Math.abs(hMouseSpeed) > Math.abs(vMouseSpeed))
		{
			if (hMouseSpeed > 0) cell.swapRight();
			else cell.swapLeft();
		}
		
		if (Math.abs(vMouseSpeed) > Math.abs(hMouseSpeed))
		{
			if (vMouseSpeed > 0) cell.swapTop();
			else cell.swapBottom();
		}
	}
	private var lastMouseX:Float;
	private var lastMouseY:Float;
	private var hMouseSpeed:Float;
	private var vMouseSpeed:Float;
	private var swapDirection:String;
	private function onMouseMove(e:MouseEvent):Void 
	{
		hMouseSpeed = mouseX - lastMouseX;
		vMouseSpeed = mouseY - lastMouseY;
		
		lastMouseX = mouseX;
		lastMouseY = mouseY;
	}
	
}