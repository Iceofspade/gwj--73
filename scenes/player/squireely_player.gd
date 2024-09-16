extends CharacterBody2D

class_name Avatar;

@onready var slowmo_controler = $"slow motion controler"
@onready var ray = $RayCast2D
var speed:= 500
#var max_speed = 250

var max_knockback:= 1000000
var knockback_v = 750
var knockback_h = 900

var gravity_stregnth:= 1500
var decceleration:= 1500
#var max_deccerleration = 500
var ammo_count:= 0



func _ready() -> void:
	knockback_v = 750;
	knockback_h = 900;




func _physics_process(delta: float) -> void:
	ray.look_at(get_global_mouse_position())
	
	# Apply Gravity
	var mouse_angle = global_position.direction_to(get_global_mouse_position())
	if not is_on_floor():
		velocity.y += gravity_stregnth * delta 
	
	# Basic walking
	var direction := Input.get_axis("move_L", "move_R")
	if direction and is_on_floor():
		velocity.x = (direction * speed)
	else:
		velocity.x = move_toward(velocity.x, 0, decceleration * delta)
		#velocity.x = clamp(velocity.x, -decceleration, decceleration)
		
	if Input.is_action_just_released("shoot") and CollectiblesController.acorn_amount > 0:
		var trajectory = -(max_knockback * ((mouse_angle * 2).round()/2))
		velocity = trajectory;
		velocity.x = clamp(velocity.x, -knockback_h ,knockback_h )
		velocity.y = clamp(velocity.y, -knockback_v ,knockback_v )

	move_and_slide()




func shot_recoil(__force_multiplier: float) -> void:
	knockback_h = 900 * __force_multiplier;
	knockback_v = 750 * __force_multiplier;
	print(knockback_h)
	print(knockback_v)




func die() -> void:
	get_tree().reload_current_scene();
