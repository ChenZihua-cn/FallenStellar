# FallenStellar Project Documentation

## Project Overview

FallenStellar is an ActionScript 3.0 2D text-based campus romance dating sim (Galgame) with AI-driven content generation. The game is built using Adobe AIR runtime and focuses on minimalist ASCII/Unicode art aesthetics.

## Architecture Overview

The project follows a modular architecture with clear separation of concerns:

```
src/
├── core/           # Core engine and systems
├── scenes/         # Game scene implementations
├── characters/     # Character and AI systems
├── ui/             # User interface components
└── utils/          # Utility functions

assets/
├── fonts/          # Font files
├── data/           # JSON data files (dialogues, events, characters)
└── scripts/        # Story scripts
```

## Design Patterns

### Singleton Pattern

Used for manager classes that require a single instance:

- **GameEngine**: Main game controller
- **SceneManager**: Scene transition manager

Example usage:

```actionscript
// Get the singleton instance
var engine:GameEngine = GameEngine.getInstance();
engine.initialize();
```

### Abstract Base Classes

Used for extensible components:

- **BaseScene**: Extend this to create new scenes
- **CharacterBase**: Extend this to create new characters
- **BaseUIComponent**: Extend this to create new UI components

### Configuration Pattern

**GameConfig** provides centralized configuration constants:

```actionscript
// Access configuration
var width:int = GameConfig.SCREEN_WIDTH;
var color:uint = GameConfig.COLOR_TEXT;
```

## Core Components

### GameConfig (`src/core/GameConfig.as`)

Centralized configuration constants for the entire game.

**Key Properties:**

| Property | Type | Value | Description |
|----------|------|-------|-------------|
| `SCREEN_WIDTH` | int | 800 | Screen width |
| `SCREEN_HEIGHT` | int | 600 | Screen height |
| `FPS` | int | 60 | Frames per second |
| `DEFAULT_FONT` | String | "Courier New" | Default font |
| `COLOR_TEXT` | uint | 0xFFFFFF | Text color (white) |
| `COLOR_BACKGROUND` | uint | 0x000000 | Background color (black) |

**Game States:**

- `STATE_MENU`: Menu state
- `STATE_PLAYING`: Playing state
- `STATE_PAUSED`: Paused state
- `STATE_DIALOGUE`: Dialogue state

### GameEngine (`src/core/GameEngine.as`)

Main game controller using Singleton pattern.

**Methods:**

| Method | Description |
|--------|-------------|
| `getInstance():GameEngine` | Get the singleton instance |
| `initialize():void` | Initialize the game engine |
| `currentState:String` | Get/set current game state |
| `sceneManager:SceneManager` | Get the scene manager |

**Usage Example:**

```actionscript
var engine:GameEngine = GameEngine.getInstance();
engine.initialize();
engine.state = GameConfig.STATE_PLAYING;
```

### SceneManager (`src/core/SceneManager.as`)

Manages scene transitions using Singleton pattern.

**Methods:**

| Method | Description |
|--------|-------------|
| `getInstance():SceneManager` | Get the singleton instance |
| `registerScene(name:String, sceneClass:Class):void` | Register a scene |
| `loadScene(sceneName:String, data:Object):void` | Load a scene |
| `update():void` | Update current scene |
| `currentScene:BaseScene` | Get current scene |
| `container:Sprite` | Get scene container |

**Usage Example:**

```actionscript
var manager:SceneManager = SceneManager.getInstance();
manager.registerScene("library", LibraryScene);
manager.loadScene("library", { character: "emilia" });
```

### TextRenderer (`src/core/TextRenderer.as`)

Base text rendering component with ASCII/Unicode support.

**Methods:**

| Method | Description |
|--------|-------------|
| `renderText(text:String, x:int, y:int):void` | Render text |
| `renderASCII(art:Array, x:int, y:int):void` | Render ASCII art |
| `appendText(text:String):void` | Append text |
| `clear():void` | Clear all text |
| `color:uint` | Set text color |
| `fontSize:int` | Set font size |

**Usage Example:**

```actionscript
var renderer:TextRenderer = new TextRenderer(400, 300);
renderer.color = GameConfig.COLOR_HIGHLIGHT;
renderer.renderText("Hello, world!", 10, 10);

var asciiArt:Array = ["  _____", " / Hello\\", " \\_____/"];
renderer.renderASCII(asciiArt, 10, 50);
```

## Base Classes

### BaseScene (`src/scenes/BaseScene.as`)

Abstract base class for all scenes.

**Lifecycle Methods:**

| Method | Description |
|--------|-------------|
| `onEnter(data:Object):void` | Called when scene is entered |
| `onExit():void` | Called when scene is exited |
| `update():void` | Called every frame while active |

**Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `isActive:Boolean` | Read-only | Whether scene is active |
| `sceneData:Object` | Read-only | Scene data passed from previous scene |

**Extending Example:**

```actionscript
package scenes {
    public class LibraryScene extends BaseScene {
        override protected function initialize():void {
            // Set up the scene
        }

        override public function onEnter(data:Object):void {
            super.onEnter(data);
            // Scene-specific enter logic
        }

        override public function update():void {
            super.update();
            // Per-frame update logic
        }
    }
}
```

### CharacterBase (`src/characters/CharacterBase.as`)

Abstract base class for all characters.

**Methods:**

| Method | Description |
|--------|-------------|
| `interact(action:String, player:PlayerCharacter):void` | Interact with character |
| `getDialogue(context:String):String` | Get character dialogue |

**Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `name:String` | Read-only | Character name |
| `description:String` | Read/write | Character description |
| `stats:Object` | Read-only | Character stats (affection, trust, familiarity) |
| `asciiArt:Array` | Read/write | ASCII art representation |

**Extending Example:**

```actionscript
package characters {
    public class Emilia extends CharacterBase {
        public function Emilia() {
            super("艾米莉亚");
            description = "一个喜欢在图书馆阅读的安静女孩";
            asciiArt = [
                "    ⊂_ヽ",
                "　 ＼＼ Λ＿Λ",
                "　　 ＼('ㅅ')"
            ];
        }

        override public function getDialogue(context:String):String {
            return "你好...";
        }
    }
}
```

### BaseUIComponent (`src/ui/BaseUIComponent.as`)

Abstract base class for all UI components.

**Methods:**

| Method | Description |
|--------|-------------|
| `show():void` | Show the component |
| `hide():void` | Hide the component |
| `enable():void` | Enable interaction |
| `disable():void` | Disable interaction |

**Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `isVisible:Boolean` | Read-only | Component visibility |
| `isEnabled:Boolean` | Read-only | Component enabled state |

**Extending Example:**

```actionscript
package ui {
    public class DialogueBox extends BaseUIComponent {
        private var _textRenderer:TextRenderer;

        public function DialogueBox(width:Number, height:Number) {
            super(width, height);
            _textRenderer = new TextRenderer(width, height);
            addChild(_textRenderer);
        }

        public function showDialogue(speaker:String, text:String):void {
            _textRenderer.renderText(speaker + ":\n" + text);
        }
    }
}
```

## Entry Point

### Main (`src/main.as`)

The main entry point for the application.

**Responsibilities:**

- Initialize the GameEngine
- Minimal logic - delegates to GameEngine

**Current Implementation:**

```actionscript
package {
    import flash.display.Sprite;
    import flash.events.Event;
    import core.GameEngine;

    [SWF(width="800", height="600", frameRate="60", backgroundColor="#000000")]
    public class Main extends Sprite {
        private var gameEngine:GameEngine;

        public function Main() {
            if (stage) init();
            else addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(e:Event = null):void {
            removeEventListener(Event.ADDED_TO_STAGE, init);

            gameEngine = GameEngine.getInstance();
            gameEngine.initialize();

            trace("[FallenStellar] Game initialized");
        }
    }
}
```

## Asset Structure

### Data Files

Located in `assets/data/`:

- **characters.json**: Character definitions
- **dialogues.json**: Dialogue data
- **events.json**: Event definitions

**Character JSON Example:**

```json
{
    "character_id": {
        "name": "Character Name",
        "description": "Brief description",
        "personality": {
            "openness": 0.7,
            "friendliness": 0.5
        },
        "ascii_art": [
            "line 1",
            "line 2"
        ]
    }
}
```

**Dialogue JSON Example:**

```json
{
    "character_name": {
        "greeting": ["Hello!", "Hi there!"],
        "topics": {
            "weather": "It's nice today.",
            "studies": "Classes are tough."
        }
    }
}
```

**Event JSON Example:**

```json
{
    "event_id": {
        "name": "Event Name",
        "location": "library",
        "trigger": {
            "type": "time",
            "value": "afternoon"
        },
        "dialogue": "dialogue_id"
    }
}
```

## Extensibility Guidelines

### Creating a New Scene

1. Extend `BaseScene` class
2. Override `initialize()` for setup
3. Override `onEnter()` for scene enter logic
4. Override `update()` for per-frame updates
5. Register with `SceneManager`

### Creating a New Character

1. Extend `CharacterBase` class
2. Set name, description, and ASCII art in constructor
3. Override `getDialogue()` for custom dialogue
4. Override `interact()` for custom interactions

### Creating a New UI Component

1. Extend `BaseUIComponent` class
2. Add component-specific properties and methods
3. Use `show()`, `hide()`, `enable()`, `disable()` as needed

## Build Configuration

The project uses `asconfig.json` for build configuration:

```json
{
    "config": "flex",
    "compilerOptions": {
        "output": "bin/my-game.swf",
        "source-path": ["src"]
    },
    "mainClass": "Main"
}
```

## API Reference Summary

### Core Package

| Class | Description |
|-------|-------------|
| `GameConfig` | Configuration constants |
| `GameEngine` | Main game controller (singleton) |
| `SceneManager` | Scene manager (singleton) |
| `TextRenderer` | Text rendering component |

### Scenes Package

| Class | Description |
|-------|-------------|
| `BaseScene` | Abstract base for all scenes |

### Characters Package

| Class | Description |
|-------|-------------|
| `CharacterBase` | Abstract base for all characters |
| `PlayerCharacter` | Player-controlled character |

### UI Package

| Class | Description |
|-------|-------------|
| `BaseUIComponent` | Abstract base for all UI components |

## Development Notes

- The codebase follows ActionScript 3.0 conventions
- Use ASDoc comments for API documentation
- Maintain clear separation between logic and presentation
- Extend base classes rather than modifying core code
- Keep configuration in GameConfig, avoid hardcoded values
