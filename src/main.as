package {
    import flash.display.Sprite;
    import flash.events.Event;
    import core.GameEngine;
    import core.GameConfig;

    [SWF(width="800", height="600", frameRate="60", backgroundColor="#000000")]
    public class Main extends Sprite {
        private var gameEngine:GameEngine;

        public function Main() {
            if (stage) init();
            else addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(e:Event = null):void {
            removeEventListener(Event.ADDED_TO_STAGE, init);

            // Initialize game engine
            gameEngine = GameEngine.getInstance();
            gameEngine.initialize();

            trace("[FallenStellar] Game initialized");
        }
    }
}