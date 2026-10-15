extends StaticBody3D


@onready var prompt_play = $"../play1/hover"
@onready var speech = $"speech/speech1/1"
@onready var whisper =$"../WhisperPlayer"



func interact():
	speech.play("s1")
	whisper.play()
	await speech.animation_finished
	speech.stop()
	await get_tree().create_timer(3).timeout
	whisper.stop()

	
func show_prompt():
	prompt_play.visible = true

func hide_prompt():
	prompt_play.visible = false
