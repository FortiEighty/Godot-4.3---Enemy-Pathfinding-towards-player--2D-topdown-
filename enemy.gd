extends CharacterBody2D

# Setting the speed
@export var speed = 40

# Setting objects that are loaded on object spawn
@onready var playerObject = $"../player" # Player
@onready var nav_agent = $NavigationAgent2D # Navigation agent

# When object is spawned making a path to a player

func _ready() -> void:
	# If player exist
	if playerObject:
		makepath()

func _physics_process(delta: float) -> void:
	# Moving the object based on the next position of the route to the player
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()

func makepath():
	# Setting the agent target to the current player position
	nav_agent.target_position = playerObject.global_position
	

func _on_timer_timeout() -> void:
	# Recalculating route whenever timer is out
	makepath()
