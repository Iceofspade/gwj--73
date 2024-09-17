extends Control

@onready var main = $"../../" #two above reference

func _process(delta: float) -> void:
	#if _on_restart_pressed():
		#get_tree().reload_current_scene()
	pass
func _on_resume_pressed() -> void:
	main.pauseMenu()


func _on_restart_pressed():
	#get_tree().reload_scene()
	pass


func _on_quit_pressed() -> void:
	get_tree().quit()
