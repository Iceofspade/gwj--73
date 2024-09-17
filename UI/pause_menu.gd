extends Control

@onready var main = $"../../" #two above reference


func _on_resume_pressed() -> void:
	main.pauseMenu()


func _on_restart_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
