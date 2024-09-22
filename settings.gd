extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value/5)

func _on_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)


func _on_resolutions_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(2560,1440))
		1:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		2:
			DisplayServer.window_set_size(Vector2i(1600,900))
		3:
			DisplayServer.window_set_size(Vector2i(1280,720))
		4:
			DisplayServer.window_set_size(Vector2i(800, 600))
		5:
			DisplayServer.window_set_size(Vector2i(600, 400))
			

func _on_full_screen_toggled(toggled_on: bool) -> void:
	DisplayServer.WINDOW_MODE_FULLSCREEN
	

func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
