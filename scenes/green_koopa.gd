extends CharacterBody2D


@export var speed : float = 80.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var direction : int = -1


func _physics_process(delta):
	handle_gravity(delta)
	handle_horizontal_movement(delta)
	move_and_slide()


func handle_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
		
func handle_horizontal_movement(delta):
	if is_on_wall():
		direction = - direction
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
