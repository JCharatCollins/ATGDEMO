extends Node


onready var statesMapCharActions = {
	"idle": $Idle,
	"hitstun": $Hitstun,
	"attack": $Attack,
	"block": $Block,
}

var currentState = String()

var stunCounter : int

func _ready():
	pass

func _process(delta):
#	I'm gonna outline the logic here, but without other systems, 
#	handling this tree of states is stupidly abstract.
#	I expect none of this to be actually useful once we get the model,
#	etc. but it's good to have anyways. We'll do this in comments, of course.

	var currentState = String()
	
	var input : String = get_node("root/Spatial/Player").currentInputs
	
	
	if input.does_not_contain(an attack button):
		currentState = statesMapCharActions["idle"]
	if kinematicBody.is_getting_hit():
		currentState = statesMapCharActions["hitstun"]
		if input.contains_backwards_input_matching_hit():
			currentState = statesMapCharActions["block"]
	
		
	
	pass
