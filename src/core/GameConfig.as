package core {
    /**
     * GameConfig - Centralized configuration constants for the game.
     * Single source of truth for all configuration values.
     */
    public class GameConfig {
        // ==================== Screen Settings ====================
        public static const SCREEN_WIDTH:int = 800;
        public static const SCREEN_HEIGHT:int = 600;
        public static const FPS:int = 60;

        // ==================== Text Rendering Settings ====================
        public static const FONT_SIZE:int = 16;
        public static const LINE_HEIGHT:int = 20;
        public static const DEFAULT_FONT:String = "Courier New";

        // ==================== Grid World Settings ====================
        public static const GRID_CELL_SIZE:int = 20;
        public static const GRID_WIDTH:int = 40;
        public static const GRID_HEIGHT:int = 30;

        // ==================== Game States ====================
        public static const STATE_MENU:String = "menu";
        public static const STATE_PLAYING:String = "playing";
        public static const STATE_PAUSED:String = "paused";
        public static const STATE_DIALOGUE:String = "dialogue";

        // ==================== Colors ====================
        public static const COLOR_TEXT:uint = 0xFFFFFF;
        public static const COLOR_BACKGROUND:uint = 0x000000;
        public static const COLOR_HIGHLIGHT:uint = 0xFFFF00;
        public static const COLOR_DIALOGUE:uint = 0xCCCCCC;
        public static const COLOR_SYSTEM:uint = 0x00FF00;
    }
}
