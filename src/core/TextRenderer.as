package core {
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;

    /**
     * TextRenderer - Base text rendering component.
     * Supports ASCII/Unicode text rendering with customizable styling.
     */
    public class TextRenderer extends Sprite {
        private var _textField:TextField;
        private var _textFormat:TextFormat;
        private var _width:int;
        private var _height:int;

        /**
         * Create a new TextRenderer.
         * @param width The width of the text area
         * @param height The height of the text area
         */
        public function TextRenderer(width:int, height:int) {
            _width = width;
            _height = height;
            initialize();
        }

        /**
         * Initialize the text renderer.
         */
        private function initialize():void {
            // Create text format
            _textFormat = new TextFormat();
            _textFormat.font = GameConfig.DEFAULT_FONT;
            _textFormat.size = GameConfig.FONT_SIZE;
            _textFormat.color = GameConfig.COLOR_TEXT;
            _textFormat.align = TextFormatAlign.LEFT;
            _textFormat.leading = 4;

            // Create text field
            _textField = new TextField();
            _textField.width = _width;
            _textField.height = _height;
            _textField.defaultTextFormat = _textFormat;
            _textField.multiline = true;
            _textField.wordWrap = true;
            _textField.selectable = false;

            addChild(_textField);
        }

        /**
         * Render text at the specified position.
         * @param text The text to render
         * @param x The x position
         * @param y The y position
         */
        public function renderText(text:String, x:int = 0, y:int = 0):void {
            _textField.text = text;
            _textField.x = x;
            _textField.y = y;
        }

        /**
         * Render ASCII art as text.
         * @param art Array of strings representing ASCII art
         * @param x The x position
         * @param y The y position
         */
        public function renderASCII(art:Array, x:int = 0, y:int = 0):void {
            var text:String = art.join("\n");
            renderText(text, x, y);
        }

        /**
         * Append text to the current content.
         * @param text The text to append
         */
        public function appendText(text:String):void {
            _textField.appendText(text);
        }

        /**
         * Clear all text.
         */
        public function clear():void {
            _textField.text = "";
        }

        /**
         * Set the text color.
         */
        public function set color(value:uint):void {
            _textFormat.color = value;
            _textField.setTextFormat(_textFormat);
        }

        /**
         * Set the font size.
         */
        public function set fontSize(value:int):void {
            _textFormat.size = value;
            _textField.setTextFormat(_textFormat);
        }

        /**
         * Get the current text content.
         */
        public function get text():String {
            return _textField.text;
        }

        /**
         * Set the text content directly.
         */
        public function set text(value:String):void {
            _textField.text = value;
        }
    }
}
