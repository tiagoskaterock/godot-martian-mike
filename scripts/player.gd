extends CharacterBody2D

class_name Player

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_move : bool = true

func _physics_process(delta):
	add_gravity(delta)
	if can_move:
		handle_jump()
		handle_direction()
	move_and_slide()
	

func handle_jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump(1)	
		
		
func jump(jump_power):
	$Jump.play()
	velocity.y = JUMP_VELOCITY * jump_power
	
		
func handle_direction():		
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	set_sprite_direction(direction)	
	set_sprite_animation(direction)


func set_sprite_animation(direction) -> void:
	# on floor
	if direction == 1 and is_on_floor():
		$AnimatedSprite2D.play("run")
	elif direction == -1 and is_on_floor():
		$AnimatedSprite2D.play("run")
	elif direction == 0 and is_on_floor():
		$AnimatedSprite2D.play("idle")
		
	#off the floor
	if velocity.y < 0 and ! is_on_floor():
		$AnimatedSprite2D.play("jump")
	if velocity.y >= 0 and ! is_on_floor():
		$AnimatedSprite2D.play("fall")


func set_sprite_direction(direction):
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
		$Sprite2D.flip_h = true
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
		$Sprite2D.flip_h = false


func add_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta


func back_to_start_position():
	position = get_parent().get_node("Start").position


func die():
	scream()
	back_to_start_position()
	
	
func scream():	
	var scream = preload("res://scenes/scream.tscn").instantiate()
	get_parent().add_child(scream)
	
	
func happy():
	$Happy.play()
	
	
func stop():
	can_move = false
	velocity.x = 0
	$AnimatedSprite2D.play("idle")
	
