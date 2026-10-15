extends StaticBody3D

@onready var prompt_play = $"../play1/hover"
@onready var cassette = $"../cassette_cassette_0"
@onready var Visualnoise = $"../tvNoise"
@onready var action = $"../AnimationPlayer"
@onready var whiteNoise = $"../whiteNoise"
@onready var cassetPlayer = $"../Cassetteplayer"
@onready var men1 = $"../sittingHuman"
@onready var men2 = $"../liyingHuman"
@onready var glitch = $"../CanvasLayer"
@onready var whisper = $"../WhisperPlayer"
@onready var tone = $"../tone"
@onready var fade = $"../FadeLayer/AnimationPlayer"
@onready var card = $"../accessCard/AnimationPlayer"
@onready var person1 = $"../Person1"
@onready var person2 = $"../Person2"




var loop_start = 2.36
var loop_end = 6.0
var looping_cassette = false

func _ready():
	GameState.interaction_locked = false

	if GameState.casset_putted:
		$CollisionShape3D.disabled = true

		


func _process(delta):
	if looping_cassette:
		var pos = cassetPlayer.get_playback_position()
		if pos < loop_start or pos >= loop_end:
			cassetPlayer.seek(loop_start)

func interact():
	if GameState.interaction_locked: 
		return

	if GameState.Cassette_picked:
		GameState.interaction_locked = true 
		
		$CollisionShape3D.disabled = true
		cassette.visible = true
		action.get_animation("putCassette").loop_mode = Animation.LOOP_NONE
		action.play("putCassette")

		start_cassette_loop()

		await action.animation_finished
		action.pause()
		Visualnoise.visible = true
		whiteNoise.play()
		await get_tree().create_timer(0.1).timeout 
		glitch.visible = true 
		men1.visible = true  
		men2.visible = true  
		
		whisper.play()
		await get_tree().create_timer(2).timeout   
		
		action.play("flashBack1")
		person1.play()
		await action.animation_finished
		action.stop()
		
		tone.play()

		action.play("flashBack2")
		person2.play()
		await action.animation_finished
		action.stop()
		
		looping_cassette = false
		cassetPlayer.play(6.19)
		fade.play("fade_in")
		glitch.visible = false 
		card.get_animation("cardd").loop_mode = Animation.LOOP_NONE
		card.play("cardd")
		await get_tree().create_timer(0.72).timeout
		whisper.stop()
		cassetPlayer.stop()
		whiteNoise.stop()
		Visualnoise.visible = false
		men1.visible = false  
		men2.visible = false  

		await get_tree().create_timer(0.2).timeout
		fade.play_backwards("fade_in")
		fade.stop()

		GameState.casset_putted = true

	else:
		action.play("need1")

# This runs independently of interact()
func start_cassette_loop() -> void:
	cassetPlayer.play(0)  
	await get_tree().create_timer(2.34).timeout
	looping_cassette = true  

func show_prompt():
	prompt_play.visible = true

func hide_prompt():
	prompt_play.visible = false
