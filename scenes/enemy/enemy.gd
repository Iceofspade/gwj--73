extends Area2D


func _ready() -> void:
	body_entered.connect(_on_body_entered);




func _on_body_entered(__body: PhysicsBody2D) -> void:
	if __body is Avatar:
		__body.die();




func get_hit() -> void:
	_die();




func _die() -> void:
	CollectiblesController.acorn_amount += 1;
	queue_free();
