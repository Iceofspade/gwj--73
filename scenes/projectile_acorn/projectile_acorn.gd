extends Area2D

class_name ProjectileAcorn;


var direction: Vector2; # Normalized vector.
var speed: float;



func _ready() -> void:
	area_entered.connect(_on_area_entered);
	body_entered.connect(_on_body_entered);




func _on_area_entered(__area: Area2D) -> void:
	if __area.get_collision_layer_value(4): # Enemy
		__area.get_hit();
	queue_free();




func _on_body_entered(__body: Node2D) -> void:
	queue_free();



func _physics_process(delta: float) -> void:
	position += direction * speed * delta;
