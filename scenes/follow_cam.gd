extends Camera2D

@export var player:CharacterBody2D


func _process(_delta: float) -> void:
	if is_instance_valid(player):
		position = player.position;
