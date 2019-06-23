extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update(delta):
	var velocity = Vector3()
	#TODO: Make sure this reference to character actually works
	velocity.x = $"root/Spatial/Player/Character".charSpeed * delta * -1
	move_and_collide(velocity)
	