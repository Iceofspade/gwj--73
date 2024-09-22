extends Control

func _ready():
	$AnimationPlayer.play("RESET")
func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func Esc():
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		resume()
#@onready var main = $"../../" #two above reference

#func _process(delta: float) -> void:
	#if _on_restart_pressed():
		#get_tree().reload_current_scene()
	#pass
func _on_resume_pressed():
	#main.pauseMenu() <-Alpha
	resume()
	pass


func _on_restart_pressed():
	#get_tree().reload_scene() <-Alpha
	resume()
	get_tree().reload_current_scene()
	pass


func _on_quit_pressed():
	get_tree().quit()
	
func _process(delta):
	Esc()
