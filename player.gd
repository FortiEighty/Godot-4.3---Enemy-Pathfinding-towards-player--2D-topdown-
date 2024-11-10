extends CharacterBody2D

const speed = 100
var dir : Vector2

func _physics_process(delta: float) -> void:
	# Setting the velocity
	velocity = dir * speed
	# Moving object 
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	# Getting user input
	dir.x = Input.get_axis("ui_left", "ui_right")
	dir.y = Input.get_axis("ui_up", "ui_down")
	# Calculating the direction and setting the variable
	dir = dir.normalized()
