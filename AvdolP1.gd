extends Player1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name Avdol

export var Health = 144
export var Speed = 10
export var Weight = 10
export var StandHealth = 80
export var WakeupSpeed = 10


signal move_forward
signal move_back

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
