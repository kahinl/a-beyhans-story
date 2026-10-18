extends Node
## Sahneye ilk giriste bir kez oynayan giris monologu (G08 room3, G17 attic).
## Sahne kokune "intro" adinda cocuk Node olarak ekle.

@export var played_flag: String = ""
@export var speech_key: String = ""
@export var label_path: NodePath = NodePath("../extraSpeech/line")
@export var delay: float = 1.6


func _ready() -> void:
	if played_flag != "" and bool(GameState.get(played_flag)):
		return

	await get_tree().create_timer(delay).timeout

	# Oyuncu bu arada sahneden ciktiysa bayrak yakilmasin, tekrar girince oynasin
	if not is_inside_tree():
		return
	if played_flag != "":
		if bool(GameState.get(played_flag)):
			return
		GameState.set(played_flag, true)

	await Speech.say(get_node_or_null(label_path) as Label, speech_key)
