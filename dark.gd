extends ColorRect


@onready var rect = self
@onready var timer = $Timer

#func _ready():
	#timer.timeout.connect(_on_timer_timeout)
#
#func _on_timer_timeout():
	## Turn black instantly
	#modulate.a = 1.0  # fully opaque

func _ready():
	# Start transparent
	rect.modulate.a = 0.0
	# Wait 1 second, then fade
	await get_tree().create_timer(1.0).timeout

	var tween = create_tween()
	tween.tween_property(rect, "modulate:a", 1.0, 0.5)  # fade in over 0.5 sec
