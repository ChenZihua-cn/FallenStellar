package core {
    import flash.display.Sprite;
    import flash.events.Event;

    /**
     * GameEngine - Main game controller using Singleton pattern.
     * Manages the game loop and coordinates all game systems.
     */
    public class GameEngine extends Sprite {
        private static var _instance:GameEngine;
        private var _currentState:String;
        private var _sceneManager:SceneManager;
        private var _isInitialized:Boolean = false;

        /**
         * Private constructor to enforce Singleton pattern.
         */
        public function GameEngine() {
            if (_instance) {
                throw new Error("GameEngine is a singleton. Use GameEngine.getInstance()");
            }
            _instance = this;
        }

        /**
         * Get the singleton instance of GameEngine.
         */
        public static function getInstance():GameEngine {
            if (!_instance) {
                _instance = new GameEngine();
            }
            return _instance;
        }

        /**
         * Initialize the game engine.
         * Should be called once from the main entry point.
         */
        public function initialize():void {
            if (_isInitialized) {
                return;
            }

            // Initialize scene manager
            _sceneManager = SceneManager.getInstance();

            // Set initial state
            _currentState = GameConfig.STATE_MENU;

            // Add game loop
            addEventListener(Event.ENTER_FRAME, onGameLoop);

            _isInitialized = true;
            trace("[GameEngine] Initialized");
        }

        /**
         * Main game loop - called every frame.
         */
        private function onGameLoop(event:Event):void {
            update();
            render();
        }

        /**
         * Update game logic.
         */
        private function update():void {
            if (_sceneManager) {
                _sceneManager.update();
            }
        }

        /**
         * Render game state.
         */
        private function render():void {
            // Rendering is handled by display objects
        }

        /**
         * Get the current game state.
         */
        public function get currentState():String {
            return _currentState;
        }

        /**
         * Set the current game state.
         */
        public function set state(value:String):void {
            _currentState = value;
        }

        /**
         * Get the scene manager.
         */
        public function get sceneManager():SceneManager {
            return _sceneManager;
        }
    }
}
