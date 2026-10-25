extends Node2D

var scenes = [{"txt" : "Time to BEAT you UP", "time" : 8},{"txt":"You bet you can't beat me","time":12}]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_up_scene()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_up_scene():
	var current_scene = scenes[0]
	Global._set_dailouge(String(current_scene["txt"]), int(current_scene["time"]))
