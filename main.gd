extends Node2D
@onready var flowerAnom = $flowerAnom
@onready var ghostAnom = $ghostAnom

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Scene started!")

	# Generate a random chance
	if randf() < 0.1:  # 10% chance
		_do_random_feature()
	else:
		print("No anomaly.")

func _do_random_feature():
	# Spawn anomaly
	flowerAnom.visible = true
	ghostAnom.visible = true
