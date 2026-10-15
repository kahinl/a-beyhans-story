extends StaticBody3D

@onready var prompt_play = $"../play1/hover"
@onready var pos = $AnimationPlayer
@onready var cry1 = $"../cry"
@onready var cry2 = $"../cry2"
@onready var pick = $"../pickup"
@onready var hung = $"../hungup"
@onready var ringing = $"../Ring"
@onready var run = $"../running"

var is_ringing = false

func _ready():
	GameState.phone_scene_visits += 1
	
	if GameState.phone_scene_visits >= 3 and not GameState.phone_picked:
			start_ringing()
			

func start_ringing():
	is_ringing = true
	ringing.play()

func interact():
	if not is_ringing:
		return

	is_ringing = false
	if ringing.playing:
		ringing.stop()
	
	GameState.phone_picked = true
	pick.play()
	pos.play("phone")
	await pos.animation_finished
	pos.pause()
	
	$CollisionShape3D.queue_free()
	
	await get_tree().create_timer(1).timeout 
	cry1.play()
	await cry1.finished
	cry2.play()
	run.play(3)
	await cry2.finished
	
	
	pos.play("RESET")
	await pos.animation_finished
	pos.pause()
	hung.play()
	
	
	

func show_prompt():
	if is_ringing:
		prompt_play.visible = true

func hide_prompt():
	if prompt_play:
		prompt_play.visible = false
