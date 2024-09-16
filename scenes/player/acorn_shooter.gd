extends Node2D

@export_group("Resources Accessed in Script")
@export var _projectile_acorn_scene: PackedScene;



func _ready() -> void:
	CollectiblesController.acorn_amount = 5;




func _input(event: InputEvent) -> void:
	if CollectiblesController.acorn_amount == 0: return;
	if event.is_action_pressed("shoot"):
		_start_charging_shot();
	if event.is_action_released("shoot"):
		_shoot();




func _start_charging_shot() -> void:
	pass




func _shoot() -> void:
	CollectiblesController.acorn_amount -= 1;
	var __projectile: ProjectileAcorn = _projectile_acorn_scene.instantiate();
	__projectile.global_position = global_position;
	__projectile.direction = (get_local_mouse_position() - position).normalized();
	__projectile.speed = 750;
	get_parent().get_parent().add_child(__projectile);
