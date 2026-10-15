extends StaticBody3D

@onready var prompt_play = $play2/hover
@onready var pistolPick = $"../Player/Head/Hands/AnimationPlayer"
@onready var hands = $"../Player/Head/Hands"

func interact():
	if not GameState.can_pick_pistol:
		return
		
	hide_prompt()
	
	GameState.pistol_picked = true
	visible = false
	collision_layer = 0 
	hands.visible = true
	
	pistolPick.play("allanims", -1, 0.5)
	pistolPick.seek(5.44, true)
	await get_tree().create_timer(0.8).timeout
	
	
	$"../charge".play()
	
	
	await get_tree().create_timer(2.20).timeout
	pistolPick.pause()
	
	
	
	
	
	queue_free()

func show_prompt():
	if GameState.can_pick_pistol:
		prompt_play.visible = true

func hide_prompt():
	if prompt_play:
		prompt_play.visible = false
