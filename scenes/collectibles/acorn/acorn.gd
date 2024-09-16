extends Area2D

class_name Acorn;

signal collected;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_avatar_entered);




func _on_avatar_entered(___avatar) -> void:
	collected.emit();
	queue_free();
