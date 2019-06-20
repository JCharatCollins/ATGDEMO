extends Node

class_name MainPlayer

const UP = "game_up"
const DOWN = "game_down"
const RIGHT = "game_right"
const LEFT = "game_left"
const A_BUTTON = "game_A"
const B_BUTTON = "game_B"
const C_BUTTON = "game_C"
const S_BUTTON = "game_S"

var Charspeed = 10
var CharmaxHealth = 144
var Charweight = 10
var CharmaxStandHealth = 80

var allCurrentStates = []
var allCurrentStandStates = []
var currentState = null
var currentStandState = null

var standOn = false

signal standOn
signal standOff

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var statesMapCharActions = {
	"idle": $Character/States/Actions/Idle,
	"hitstun": $Character/States/Hitstun,
	"attack": $Character/States/Attack,
	"block": $Character/States/Block
}

onready var statesMapStandActions = {
	"idle": $CharacterStand/States/Actions/Idle,
	"hitstun": $CharacterStand/States/Actions/Hitstun,
	"attack": $CharacterStand/States/Actions/Attack,
	"block": $CharacterStand/States/Actions/Block
}

onready var statesMapCharMovement = {
	"idle": $Character/States/Movement/Idle,
	"crouch": $Character/States/Movement/Crouch,
	"forward": $Character/States/Movement/Forward,
	"backward": $Character/States/Movement/Backward,
	"jump": $Character/States/Movement/Jump
}

onready var statesMapStandMovement = {
	"idle": $CharacterStand/States/Movement/Idle,
	"crouch": $CharacterStand/States/Movement/Crouch,
	"forward": $CharacterStand/States/Movement/Forward,
	"backward": $CharacterStand/States/Movement/Backward,
	"jump": $CharacterStand/States/Movement/Jump
}

# Called when the node enters the scene tree for the first time.
func _ready():
	currentState = "idle"
	currentStandState = "idle"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var currentInputs = translate_inputs(Input.get_action_strength(UP), Input.get_action_strength(DOWN), Input.get_action_strength(LEFT), Input.get_action_strength(RIGHT), Input.get_action_strength(A_BUTTON), Input.get_action_strength(B_BUTTON), Input.get_action_strength(C_BUTTON), Input.get_action_strength(S_BUTTON))

	if currentInputs.ends_with("S"):
		standOn = true
		emit_signal("standOn")
	elif standOn == true and currentInputs.ends_with("S"):
		standOn = false
		emit_signal("standOff")
	
	if standOn == true:
		currentStandState.update()
	elif standOn == false:
		currentState.update()
		
	
#	pass

func translate_inputs(up , down, left, right, A, B, C, S):
	var inputs = [up-down, right-left]
	var buttons : String
	var inputstonotation = {[1.0, 1.0] : "9", [1.0, 0.0] : "8", [1.0, -1.0] : "7", [0.0, 1.0] : "6", [0.0, 0.0] : "5", [0.0, -1.0] : "4", [-1.0, 1.0] : "3", [-1.0, 0.0] : "2", [-1.0, -1.0] : "1"}
	buttons = buttons + inputstonotation[inputs]
	if (A == 1.0):
		buttons = buttons + "A"
	if (B == 1.0):
		buttons = buttons + "B"
	if (C == 1.0):
		buttons = buttons + "C"
	if (S == 1.0):
		buttons = buttons + "S"
	return buttons
	