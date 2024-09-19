extends Area2D

var Health = 3

func _ready() -> void:
	body_entered.connect(_on_body_entered);




func _on_body_entered(__body: PhysicsBody2D) -> void:
	if __body is Avatar:
		__body.die();




func get_hit() -> void:
	if Health > 0:
		Health -= 1
		print(Health)
	if Health <= 0:
		_die();
		pass




func _die() -> void:
	CollectiblesController.acorn_amount += 1;
	queue_free();
