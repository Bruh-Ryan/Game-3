extends CanvasLayer

@onready var promptLabel : Label = $Dailogue_Box/Prompt_Label
@onready var time_left : Label = $Dailogue_Box/Time
@onready var timer : Timer = $Timer 
@onready var score_show : Label = $Dailogue_Box/Score
var prompt = "Howw you doing"
var time = 8
var start : bool = false
var index = 0
var score = 0
var max_score 
func _ready() -> void:
	timer.timeout.connect(_finish)
	display()

func _process(delta: float) -> void:
	# Only update the text if the timer is actually running
	if not timer.is_stopped():
		time_left.text = "Time Left : " + str(timer.time_left).pad_decimals(1)
		score_show.text = "Score : "+str(score)+" Target: "+str(max_score)

func display():
	timer.start(time)
	promptLabel.text = prompt
	max_score= prompt.length()
	index = 0
	score = 0
	start = true

func _unhandled_key_input(event: InputEvent) -> void:
	var key = event as InputEventKey
	if key == null:
		return
	if start == false:
		return
	if not key.pressed or key.echo:
		return
	if key.keycode == KEY_BACKSPACE:
		return
	if key.unicode == 0:
		return
	if index >= prompt.length():
		return
	var cur_char : String = prompt[index]
	var typed_char = char(key.unicode)
	##compare
	if cur_char == typed_char:
		print("Correct! ", typed_char)
		score += 1
	else:
		print("no score :(")
	index += 1
	if index >= max_score:
		print("Great JOB")
		_finish()

func _finish():
	if not start:
		return
	score_show.text = "Score : "+str(score)+" Target: "+str(max_score)
	score_tally()
	start = false
	timer.stop()

func _set_max_score():
	pass

func score_tally():
	var time_score = timer.time_left
