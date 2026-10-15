extends StaticBody3D

@onready var prompt_play = $play6/hover
@onready var key = $"../defaultMaterial"
@onready var need =$"../speech/C1/speech2/2"


func interact():
	if GameState.doorHandel_picked: 
		key.visible = true
		$CollisionShape3D.queue_free()
		GameState.is_handel_installed = true 
	else:
		need.play("s4")

func show_prompt():
	prompt_play.visible = true

func hide_prompt():
	prompt_play.visible = false
