extends PanelContainer

@export_group("Nodes Accessed in Script")
@export var _amount_label: Label;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_amount_label.text = str(CollectiblesController.acorn_amount);
	CollectiblesController.acorn_amount_changed.connect(_on_acorn_amount_changed);




func _on_acorn_amount_changed(__new_amount: int) -> void:
	_amount_label.text = str(__new_amount);
