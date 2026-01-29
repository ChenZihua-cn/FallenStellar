package core {
    import flash.display.Sprite;
    import scenes.BaseScene;

    /**
     * SceneManager - Scene transition manager using Singleton pattern.
     * Manages scene registration, loading, and transitions.
     */
    public class SceneManager {
        private static var _instance:SceneManager;
        private var _currentScene:BaseScene;
        private var _sceneContainer:Sprite;
        private var _scenes:Object = {};

        /**
         * Private constructor to enforce Singleton pattern.
         */
        public function SceneManager() {
            if (_instance) {
                throw new Error("SceneManager is a singleton. Use SceneManager.getInstance()");
            }
            _instance = this;
            _sceneContainer = new Sprite();
        }

        /**
         * Get the singleton instance of SceneManager.
         */
        public static function getInstance():SceneManager {
            if (!_instance) {
                _instance = new SceneManager();
            }
            return _instance;
        }

        /**
         * Register a scene class with a name.
         * @param name The unique identifier for this scene
         * @param sceneClass The class reference for the scene
         */
        public function registerScene(name:String, sceneClass:Class):void {
            _scenes[name] = sceneClass;
            trace("[SceneManager] Registered scene: " + name);
        }

        /**
         * Load a scene by name.
         * @param sceneName The name of the scene to load
         * @param data Optional data to pass to the scene
         */
        public function loadScene(sceneName:String, data:Object = null):void {
            // Unload current scene
            if (_currentScene) {
                _currentScene.onExit();
                if (_sceneContainer.contains(_currentScene)) {
                    _sceneContainer.removeChild(_currentScene);
                }
            }

            // Load new scene
            var sceneClass:Class = _scenes[sceneName] as Class;
            if (sceneClass) {
                _currentScene = new sceneClass();
                _currentScene.onEnter(data);
                _sceneContainer.addChild(_currentScene);
                trace("[SceneManager] Loaded scene: " + sceneName);
            } else {
                trace("[SceneManager] Scene not found: " + sceneName);
            }
        }

        /**
         * Update the current scene.
         */
        public function update():void {
            if (_currentScene && _currentScene.isActive) {
                _currentScene.update();
            }
        }

        /**
         * Get the scene container Sprite.
         */
        public function get container():Sprite {
            return _sceneContainer;
        }

        /**
         * Get the currently active scene.
         */
        public function get currentScene():BaseScene {
            return _currentScene;
        }
    }
}
