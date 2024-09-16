extends Node

signal acorn_amount_changed(new_amount: int);


var acorn_amount: int = 5:
	set(value):
		acorn_amount = value;
		acorn_amount_changed.emit(acorn_amount);




func _ready() -> void:
	for __acorn: Acorn in get_tree().get_nodes_in_group("acorns"):
		__acorn.collected.connect(_on_acorn_collected);




func _on_acorn_collected() -> void:
	acorn_amount += 1;
