extends MainPlayer

class_name CharStates

onready var statesMapCharMovement = {
	"idle": $Character/States/Movement/Idle,
	"crouch": $Character/States/Movement/Crouch,
	"forward": $Character/States/Movement/Forward,
	"backward": $Character/States/Movement/Backward,
	"jump": $Character/States/Movement/Jump
}

onready var statesMapCharActions = {
	"idle": $Character/States/Actions/Idle,
	"hitstun": $Character/States/Hitstun,
	"attack": $Character/States/Attack,
	"block": $Character/States/Block
}

signal charStatesCalculated

var movementFinished : bool
var actionsFinished : bool

onready var movementState = statesMapCharMovement["idle"]
onready var actionsState = statesMapCharActions["idle"]
# Called when the node enters the scene tree for the first time.
func _ready():
	movementFinished = false
	actionsFinished = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func stateInterfacer(movementStateP, actionsStateP):
	#Handles interstate logic, ex: can't be moving backwards and in hitstun at the same time
	if movementStateP == statesMapCharMovement["forward"] or movementStateP == statesMapCharMovement["backward"]:
		if actionsStateP == statesMapCharActions["hitstun"] or actionsStateP == statesMapCharActions["attack"] or actionsStateP == statesMapCharActions[" block"]:
			movementStateP = statesMapCharMovement["idle"]
	return [movementStateP, actionsStateP]
	
func _on_Movement_stateCalculated(state):
	movementFinished = true
	movementState = state
	if actionsFinished == true:
		emit_signal("charStatesCalculated", stateInterfacer(movementState, actionsState))
		movementFinished = false
		actionsFinished = false
		

func _on_Actions_stateCalculated(state):
	actionsFinished = true
	actionsState = state
	if movementFinished == true:
		emit_signal("charStatesCalculated", stateInterfacer(movementState, actionsState))
		movementFinished = false
		actionsFinished = false
		
	