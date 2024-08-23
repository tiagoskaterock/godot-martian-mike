extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):	
	add_gravity(delta)
	handle_jump()
	handle_direction()
	move_and_slide()
	

func handle_jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		
func handle_direction():		
	var direction = Input.get_axis("left", "right")	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	set_sprite_direction(direction)	
	set_sprite_animation(direction)


func set_sprite_animation(direction):
	if direction == 1:
		$AnimatedSprite2D.play("run")
	if direction == -1:
		$AnimatedSprite2D.play("run")
	if direction == 0:
		$AnimatedSprite2D.play("idle")


func set_sprite_direction(direction):
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
	if velocity.y < 0 and ! is_on_floor():
		$AnimatedSprite2D.play("jump")
	if velocity.y >= 0 and ! is_on_floor():
		$AnimatedSprite2D.play("fall") 


func add_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
