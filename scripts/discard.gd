extends Control

var discard_pile = []
@onready var top_texture = $DiscardCard
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:#
	
func discard(card):
	discard_pile.append(card)
	top_texture.texture = load("res://assets/sprites/cards/" + card + ".png")
