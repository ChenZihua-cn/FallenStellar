package scenes {
    import flash.display.Sprite;

    /**
     * BaseScene - Abstract base class for all scenes.
     * Provides common scene lifecycle methods that can be overridden.
     */
    public class BaseScene extends Sprite {
        protected var _isActive:Boolean = false;
        protected var _sceneData:Object;

        /**
         * Constructor.
         */
        public function BaseScene() {
            super();
            initialize();
        }

        /**
         * Initialize the scene.
         * Override this method to set up scene-specific initialization.
         */
        protected function initialize():void {
            // Override in subclasses
        }

        /**
         * Called when the scene is entered.
         * @param data Optional data passed from the previous scene
         */
        public function onEnter(data:Object = null):void {
            _isActive = true;
            _sceneData = data;
        }

        /**
         * Called when the scene is exited.
         */
        public function onExit():void {
            _isActive = false;
            _sceneData = null;
        }

        /**
         * Called every frame while the scene is active.
         * Override this method to implement scene-specific update logic.
         */
        public function update():void {
            // Override in subclasses for per-frame updates
        }

        /**
         * Whether this scene is currently active.
         */
        public function get isActive():Boolean {
            return _isActive;
        }

        /**
         * The data associated with this scene.
         */
        public function get sceneData():Object {
            return _sceneData;
        }
    }
}
