package {
    import flash.display.Sprite;
    import flash.events.Event;

    public class Main extends Sprite {

        public function Main() {
            if (stage) init();
            else addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(e:Event = null):void {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            // 游戏初始化代码从这里开始
            trace("Hello World from VSCode!");
            graphics.beginFill(0xFF0000);
            graphics.drawCircle(200, 200, 50);
            graphics.endFill();
        }
    }
}