extends Node2D

@export_group("Nodes Accessed in Script")
@export var _charge_timer: Timer;
@export var _charge_progress_bar: ProgressBar;
@export var _avatar: Avatar;
@export_group("Resources Accessed in Script")
@export var _projectile_acorn_scene: PackedScene;

var _shot_charge_time: float;


func _ready() -> void:
	CollectiblesController.acorn_amount = 5;
	_shot_charge_time = _charge_timer.wait_time;




func _process(_delta: float) -> void:
	if _charge_timer.is_stopped(): return;
	
	_charge_progress_bar.value = _shot_charge_time - _charge_timer.time_left;



func _input(event: InputEvent) -> void:
	if CollectiblesController.acorn_amount == 0: return;
	if event.is_action_pressed("shoot"):
		_start_charging_shot();
	if event.is_action_released("shoot"):
		_shoot();




func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("slow_mo"):
		_enter_slow_mo();
	elif event.is_action_released("slow_mo"):
		_exit_slow_mo();




func _enter_slow_mo() -> void:
	Engine.time_scale = 0.1;




func _exit_slow_mo() -> void:
	Engine.time_scale = 1.0;




func _start_charging_shot() -> void:
	_charge_progress_bar.show();
	_charge_timer.start();




func _shoot() -> void:
	var __shot_power: float = _shot_charge_time - _charge_timer.time_left;
	var __force_multiplier: float = 3.0 * __shot_power + 1;
	_charge_progress_bar.hide();
	_charge_timer.stop();
	
	CollectiblesController.acorn_amount -= 1;
	var __projectile: ProjectileAcorn = _projectile_acorn_scene.instantiate();
	__projectile.global_position = global_position;
	__projectile.direction = (get_local_mouse_position() - position).normalized();
	__projectile.speed = 200 * __force_multiplier;
	get_parent().get_parent().add_child(__projectile);
	_avatar.shot_recoil(maxf(1, __force_multiplier / 2.0));
