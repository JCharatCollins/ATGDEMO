extends Node

class_name Player1

const UP = "player1_up"
const DOWN = "player1_down"
const RIGHT = "player1_right"
const LEFT = "player1_left"
const BUTTON_A = "player1_A"
const BUTTON_B = "player1_B"
const BUTTON_C = "player1_C"
const BUTTON_S = "player1_S"

var last15Inputs = Array()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	record_inputs((translate_inputs(Input.get_action_strength(UP), Input.get_action_strength(DOWN), Input.get_action_strength(LEFT), Input.get_action_strength(RIGHT), Input.get_action_strength(BUTTON_A), Input.get_action_strength(BUTTON_B), Input.get_action_strength(BUTTON_C), Input.get_action_strength(BUTTON_S))), last15Inputs)

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
func record_inputs(inputString, targetArray) -> void:
	if (targetArray.size() > 15):
		targetArray.pop_back()
	targetArray.push_front(inputString)
	return