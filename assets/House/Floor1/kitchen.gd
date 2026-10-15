extends Node3D
@onready var somthing = $somthing


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameState.kitchen_entered == 0:
		GameState.kitchen_entered += 1
		await get_tree().create_timer(3).timeout
		somthing.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
