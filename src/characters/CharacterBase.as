package characters {
    /**
     * CharacterBase - Abstract base class for all characters.
     * Provides common character properties and methods.
     */
    public class CharacterBase {
        protected var _name:String;
        protected var _description:String;
        protected var _asciiArt:Array;
        protected var _stats:Object;

        /**
         * Constructor.
         * @param name The character's name
         */
        public function CharacterBase(name:String) {
            _name = name;
            _stats = {
                affection: 0,
                trust: 0,
                familiarity: 0
            };
        }

        /**
         * Interact with this character.
         * @param action The action being performed
         * @param player The player character (optional)
         */
        public function interact(action:String, player:PlayerCharacter = null):void {
            // Override in subclasses
        }

        /**
         * Get dialogue from this character.
         * @param context The context for the dialogue
         * @return The dialogue string
         */
        public function getDialogue(context:String):String {
            // Override in subclasses
            return "...";
        }

        /**
         * Get the character's name.
         */
        public function get name():String {
            return _name;
        }

        /**
         * Get the character's description.
         */
        public function get description():String {
            return _description;
        }

        /**
         * Set the character's description.
         */
        public function set description(value:String):void {
            _description = value;
        }

        /**
         * Get the character's stats.
         */
        public function get stats():Object {
            return _stats;
        }

        /**
         * Get the character's ASCII art representation.
         */
        public function get asciiArt():Array {
            return _asciiArt;
        }

        /**
         * Set the character's ASCII art representation.
         */
        public function set asciiArt(value:Array):void {
            _asciiArt = value;
        }
    }
}
