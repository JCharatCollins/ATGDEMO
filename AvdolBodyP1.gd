extends KinematicBody

class_name PlayerKBody



# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):

	.move_and_collide(velocity)
	
	print(translate_inputs(Input.get_action_strength("player1_up"), Input.get_action_strength("player1_down"), Input.get_action_strength("player1_left"), Input.get_action_strength("player1_right")))
	pass

func calculate_x_velocity(left, right, delta) -> float:
	if (get_node(Player2/AvdolP2/KinematicBody).get_global_transform().x
	return (Input.get_action_strength(get_node("../../").LEFT) - Input.get_action_strength(get_node("../../").RIGHT)) * (get_node("../../").Speed)
