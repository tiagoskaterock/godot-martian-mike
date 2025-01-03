extends CharacterBody2D

class_name Player

const SPEED : float = 200.0
const JUMP_VELOCITY : float = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_move : bool = true
var jump_force : float = .8
var is_falling : bool = true
var height_in_the_air : int = 0
var jump_max_height : int = 13
const coyote_jump_tolerance : int = 50

func _physics_process(delta):
	add_gravity(delta)
	if can_move:
		handle_jump()
		handle_direction()
	move_and_slide()
	

func handle_jump():
	if Input.is_action_pressed("jump") and is_on_floor() and ! is_falling:
		$Jump.play()
		jump(jump_force)
		height_in_the_air += 1
	if Input.is_action_pressed("jump") and ! is_on_floor() and ! is_falling:
		jump(jump_force)
		height_in_the_air += 1
		
	if is_on_floor():
		is_falling = false
		height_in_the_air = 0
		
	if height_in_the_air > jump_max_height and ! is_on_floor():
		is_falling = true
		
	if Input.is_action_just_released("jump") and ! is_on_floor():
		is_falling = true
		
	if velocity.y > coyote_jump_tolerance:
		is_falling = true
		
		
func jump(jump_power):
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
	get_parent().get_node("LevelTimer").start_counter()
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
	
