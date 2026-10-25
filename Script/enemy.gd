extends Node2D

@onready var sprite : AnimatedSprite2D = $EnemySprite
var health = 100
var attacks = ["Left-Punch","Right-Punch","Block"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func animation():
	pass
	
func _attack():
	var choice = randf_range(0,2)
	
	match choice:
		0:
			print("lp")
		1:	
			print("rp")
		2:
			print("block")
