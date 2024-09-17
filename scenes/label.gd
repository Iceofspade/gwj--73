extends Label

const lines: Array[String] = [
	"Did you know squirrels can find food buried beneath a foot of now?",
	"A squirrel's front teeth never stops growing!",
	"Squirrels may lose 25 percent of their buried food to thieves!",
]

#func _unhandled_input(event):
	#TextManager.start_dialog(global_position, lines)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TextManager.start_dialog(global_position, lines)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#TextManager.start_dialog(global_position, lines)
