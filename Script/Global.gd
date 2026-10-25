extends Node2D

var timer = 0
var  txt : String = ""
var i : int = 0
var score : int = 0
var max_score : int = txt.length()
var start = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_start() # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _set_dailouge( txt : String , timer : int ):
	self.timer=timer
	self.txt = txt
	start = true
	
func _start():
	if start==true:
		print("type: ", txt)
func _unhandled_key_input(event: InputEvent) -> void:
	var key = event as InputEventKey
	var time = get_tree().create_timer(timer)
	if start == true and not time.timeout:
		print(time)
		if key.keycode == KEY_BACKSPACE:
			return
		if key.unicode == 0:
			return
		var cur_char : String = txt[i]
		var typed_char = char(key.unicode)
		##compare
		if cur_char == typed_char:
			print("Correct! ", typed_char)
			i+=1
			score+=1
			if i >= max_score:
				print("Great JOB")
				i=0
				start = false
				return
		else:
			print("no score :(")
			i+=1
