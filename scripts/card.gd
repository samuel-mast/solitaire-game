extends Control

@onready var card_texture = $CardTexture
var deck = ["C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12","C13"]
var card = ""
#var card_texture = ""
var faceup = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card = deck[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed == false:
			flip()
			
func flip():
	if faceup:
		card_texture.texture = load("res://assets/sprites/cards/Backs/back_0.png")
		faceup =! faceup
	else:
		card_texture.texture = load("res://assets/sprites/cards/" + card + ".png")
		faceup =! faceup
