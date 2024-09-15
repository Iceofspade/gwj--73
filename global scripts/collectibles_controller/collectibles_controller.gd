extends Node

signal acorn_amount_changed(new_amount: int);


var _acorns_collected: int = 0;




func _ready() -> void:
	for __acorn: Acorn in get_tree().get_nodes_in_group("acorns"):
		__acorn.collected.connect(_on_acorn_collected);




func _on_acorn_collected() -> void:
	_acorns_collected += 1;
	acorn_amount_changed.emit(_acorns_collected);
