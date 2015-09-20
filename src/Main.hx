package ;

import flash.display.DisplayObject;
import flash.events.Event;
import flash.Lib;
import flash.display.Sprite;
import iDisplays.DisplayCell;
import iDisplays.DisplayField;
import iDisplays.DisplaySprite;
import model.cells.Cell;
import model.cells.CellSquare;
import model.display.IDisplay;
import model.field.LevelField;
import model.level.Level;

/**
 * ...
 * @author val
 */

class Main extends Sprite 
{
	public function new() 
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}
	
	private function onAddedToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		
		init();
		
	}
	private function init():Void
	{
		
		var levelField:LevelField = new LevelField();
		levelField.iDisplay = new DisplayField();
		levelField.getCellDisplayFunction = getCellDisplayFunction;
		
		var levelDO:DisplayObject = cast(levelField.iDisplay, DisplayObject);
		addChild(levelDO);
		
		var level:Level = new Level();
		level.width = 7;
		level.height = 7;
		level.levelNum = 1;
		level.moves = 20;
		level.scoreMinimum = 1000;
		level.scoreMaximum = 3000;
		level.type = LevelField.TYPE_SQUARES;
		
		level.cells = [];
		var cell:CellSquare;
		
		for (x in 0...7)
		{
			for (y in 0...7)
			{				
				cell = new CellSquare(levelField.controller);
				cell.level = 1;
				
				cell.fieldX = x;
				cell.fieldY = y;
				cell.width = 700 / 7.5;
				cell.height = 700 / 7.5;
				cell.iDisplay = new DisplayCell();
				
				level.cells.push(cell);
			}
		}
		
		levelField.playLevel(level);
		
		levelDO.x = 768 / 2 - levelDO.width / 2;
		levelDO.y = 1024 / 2 - levelDO.height / 2;
	}
	public function getCellDisplayFunction(cell:Cell):IDisplay
	{
		var displayCell:DisplayCell = new DisplayCell();
		
		return displayCell;
	}
	private function drawRect(x:Float,y:Float,w:Float,h:Float):Void
	{
		this.graphics.beginFill(0x000000);
		this.graphics.drawRect(x, y, w, h);
		this.graphics.endFill();
	}
	static function main() 
	{
		Lib.current.addChild(new Main());
	}
}