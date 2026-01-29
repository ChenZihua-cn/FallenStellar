package ui {
    import flash.display.Sprite;

    /**
     * BaseUIComponent - Abstract base class for all UI components.
     * Provides common UI functionality and properties.
     */
    public class BaseUIComponent extends Sprite {
        protected var _isVisible:Boolean = true;
        protected var _isEnabled:Boolean = true;
        protected var _width:Number;
        protected var _height:Number;

        /**
         * Constructor.
         * @param width The width of the component
         * @param height The height of the component
         */
        public function BaseUIComponent(width:Number = 0, height:Number = 0) {
            _width = width;
            _height = height;
            initialize();
        }

        /**
         * Initialize the UI component.
         * Override this method to set up component-specific initialization.
         */
        protected function initialize():void {
            // Override in subclasses
        }

        /**
         * Show the component.
         */
        public function show():void {
            _isVisible = true;
            visible = true;
        }

        /**
         * Hide the component.
         */
        public function hide():void {
            _isVisible = false;
            visible = false;
        }

        /**
         * Enable the component.
         */
        public function enable():void {
            _isEnabled = true;
            mouseEnabled = true;
        }

        /**
         * Disable the component.
         */
        public function disable():void {
            _isEnabled = false;
            mouseEnabled = false;
        }

        /**
         * Whether the component is visible.
         */
        public function get isVisible():Boolean {
            return _isVisible;
        }

        /**
         * Whether the component is enabled.
         */
        public function get isEnabled():Boolean {
            return _isEnabled;
        }
    }
}
