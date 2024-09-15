extends Node2D

const SLOW_SPEED = 0.1
const NORMAL_SPEED = 1
var is_slowed:=false



func enter_slowmo():
	is_slowed = true
	var tweener = create_tween()
	tweener.tween_property(Engine,"time_scale",SLOW_SPEED,0.5)
	tweener.play()
	Engine.time_scale = SLOW_SPEED

func exit_slowmo():
	is_slowed = false
	var tweener = create_tween()
	tweener.tween_property(Engine,"time_scale",NORMAL_SPEED,0.25)
	tweener.play()
	Engine.time_scale = NORMAL_SPEED

func switch_slowmo_state():
	if is_slowed:
		enter_slowmo()
	else:
		exit_slowmo()
