extends Node3D


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	Wind.play()
	await get_tree().create_timer(2.0).timeout
	$breathing.play(3) 
	await get_tree().create_timer(10.0).timeout
	$breathing.stop()
	
	await  get_tree().create_timer(15).timeout
	$instractions/AnimationPlayer.play("inter")
	
	
	
