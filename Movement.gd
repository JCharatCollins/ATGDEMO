extends CharStates

class_name charMovement

signal stateCalculated
#TODO: Replace jumpInProgress with a check to see if the KinematicBody is above the ground
var jumpInProgress = false

onready var statesMapCharMovement = {
	"idle": $Idle,
	"crouch": $Crouch,
	"forward": $Forward,
	"backward": $Backward,
	"jump": $Jump
}

var currentState = String()

func _ready():
	pass

func _process(delta):
	var input : String = .get_node("root/Spatial/Player").currentInputs
	currentState = statesMapCharMovement[convert_input_to_state(input)]
	if currentState == statesMapCharMovement["jump"]:
		jumpInProgress == true
	if jumpInProgress == true:
		currentState = statesMapCharMovement["jump"]
	.emit_signal("stateCalculated", currentState)

func convert_input_to_state(input):
	match input.left(1):
		"1":
			currentState = "crouch"
		"2":
			currentState = "crouch"
		"3":
			currentState = "crouch"
		"4":
			currentState = "backward"
		"5":
			currentState = "idle"
		"6":
			currentState = "forward"
		"7":
			currentState = "jump"
		"8":
			currentState = "jump"
		"9":
			currentState = "jump"

func _on_Jump_jump_end():
	jumpInProgress = false
	pass
