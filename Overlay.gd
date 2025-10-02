extends CanvasLayer

@onready var fader: ColorRect = $ColorRect

func _ready() -> void:
	print("Overlay ready")       # To show that overlay is ready
	fader.set_anchors_preset(Control.PRESET_FULL_RECT, true)

	# Start fully transparent black
	fader.color = Color(0, 0, 0, 0.0)

	# Wait for 1 second
	await get_tree().create_timer(1.0).timeout

	# Fade to black over 1 second
	var t := create_tween()
	t.tween_property(fader, "color:a", 1.0, 1.0)
	
	
