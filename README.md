# 2D_Space_Adventure
A godot game where you play as a Space ship trying to survive an endless onslaught of enemies
The player controls a spaceship and must survive an endless onslaught of enemy ships while collecting upgrades and earning points.

The game features randomly spawning enemies, multiple weapon upgrades, shields, and a scoring system. The objective is to survive as long as possible while achieving the highest score.

<img width="533" height="958" alt="Screenshot 2026-02-15 184349" src="https://github.com/user-attachments/assets/703eb3e6-5ca2-4fc0-a6b1-78c97cc0d96c" />

## Features

- **Enemy Spawning:** Regular and faster enemy ships spawn throughout the game, creating an endless survival challenge.

- **Laser System:** Players can shoot lasers to destroy incoming enemies and earn points.

- **Weapon Upgrades:** Collecting upgrades allows players to increase the number of lasers their spaceship fires.

- **Shield System:** Players can collect shields that protect their spaceship from enemy collisions. Each collision consumes a shield charge.

- **Health System:** The player has a limited amount of health. Once their health reaches zero, the game ends.

- **Scoring System:** Destroying enemy ships increases the player's score.

- **Sound Effects:** Includes sound effects for shooting, explosions, and shield interactions.

- **Main Menu:** Players can start the game or exit through the main menu.

## Installation and Setup

### Requirements

- Godot Engine 4.5 or newer
- Git (optional)

### Installation

1. Download and install Godot Engine 4.5 or newer using https://godotengine.org/download/

2. Clone the repository using Git:

   ```
   git clone https://github.com/Marcosauras/2D_Space_Adventure.git
   ```
3. Open the Godot Project Manager.

4. Select **Import** and navigate to the downloaded project folder.

5. Select the `project.godot` file to import the project.

6. Open the project in Godot.

7. Press **F5** or select **Run Project** to start the game.

## How to Play

The objective of 2D Space Adventure is to survive for as long as possible while destroying enemy ships and collecting upgrades.
Players control a spaceship that moves horizontally across the screen. Enemy ships approach from above, and the player must destroy or avoid them to stay alive.
Destroying enemies earns points, while collecting upgrades can improve the player's weapons or provide additional shields.

### Game Mechanics

- Destroy enemy ships to increase your score.
- Avoid collisions with incoming enemies.
- Collect falling stars to receive weapon or shield upgrades.
- Use shields to protect your spaceship from damage.
- Survive as long as possible to achieve a higher score.

## Project Structure

The project is organized into three main directories to separate game assets, scenes, and programming logic.

- **Assets/** - Contains the images, fonts, sprites, and sound effects used throughout the game.
- **scenes/** - Contains the Godot scenes responsible for the main menu, gameplay, enemies, weapons, and upgrades.
- **scripts/** - Contains the GDScript files responsible for player movement, enemy behavior, weapon systems, upgrades, and game management.

The main project configuration files and README are kept in the root directory for easy access.

### Important Files

| File | Description |
|------|-------------|
| `project.godot` | Main Godot project configuration |
| `main.tscn` | Main gameplay scene |
| `main_menu.tscn` | Main menu scene |
| `Player.gd` | Handles player movement, shooting, health, and upgrades |
| `enemy_spawner.gd` | Controls the spawning of enemy ships |
| `blue_enemy_basic.gd` | Controls basic enemy behavior |
| `blue_enemy_fast.gd` | Controls faster enemy behavior |
| `laser.gd` | Handles laser movement and collisions |
| `shield.gd` | Handles shield behavior and enemy collisions |
| `upgrade_spawner.gd` | Controls the spawning of upgrades |
| `upgrade_star.gd` | Handles upgrade collection |
| `game_state.gd` | Manages shared gameplay signals and score |
| `game_over_label.gd` | Handles the game-over display and restart input |

### Technologies Used

- **Godot Engine 4.5+** - Game development engine
- **GDScript** - Programming language used for gameplay logic
- **Godot Scenes and Signals** - Used to organize gameplay objects and communicate between components

## License and Credits

### Third-Party Assets

This project uses the Kenney Space Shooter asset collection.

- **Creator:** Kenney Vleugels
- **Website:** https://kenney.nl/
- **License:** Creative Commons Zero (CC0 1.0)

The original license information is included in the `Kenney Space Shooter Assets/license.txt` file.

Additional background and font assets are included in the project. Their original sources and licensing terms are being reviewed.
