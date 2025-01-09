extends CharacterBody2D


const SPEED = 30.0
const JUMP_VELOCITY = -400.0

var direction := -1


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_on_wall():
		direction *= -1
		
	if direction == 1:
		$AnimatedSprite2D.flip_h = true
	else :
		$AnimatedSprite2D.flip_h = false
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
