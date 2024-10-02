extends Control

var deck = ["C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12","C13"]#,
			#"S1","S2","S3","S4","S5","S6","S7","S8","S9","S10","S11","S12","S13",
			#"D1","D2","D3","D4","D5","D6","D7","D8","D9","D10","D11","D12","D13",
			#"H1","H2","H3","H4","H5","H6","H7","H8","H9","H10","H11","H12","H13"]
			
var current_deck = []
@onready var discard_pile = $"../Discard"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_deck()
	shuffle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:

func create_deck() -> void:
	current_deck = deck.duplicate()
	
func shuffle() -> void:
	randomize()
	current_deck.shuffle()
	
func draw():
	var top_card = current_deck[0]
	current_deck.erase(top_card)
	discard_pile.discard(top_card)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed == false:
			draw()
