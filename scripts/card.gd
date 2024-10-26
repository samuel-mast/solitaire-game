extends Node2D

# Ace is 1, King is 13
@export var value = 1
# Club is 0, Spade is 2, Heart is 1, Diamond is 3
@export var suite = 0

var draggable = false
var current_drag = false
var can_drop = false
var body_ref
var offset : Vector2
var initialPos : Vector2
@onready var area_2d: Area2D = $Area2D
@onready var card: Node2D = $"."

# Constructor
#func _init(s,v) -> void:
#	value = v
#	suite = s


func _process(delta: float) -> void:
	if !draggable:
		return
	
	if Input.is_action_just_pressed("click"):
		current_drag = true
		initialPos = global_position
		offset = get_global_mouse_position() - global_position
		Global.is_dragging = true
	if Input.is_action_pressed("click"):
		global_position = get_global_mouse_position() - offset
	elif Input.is_action_just_released("click"):
		Global.is_dragging = false
		current_drag = false
		var tween = get_tree().create_tween()
		if can_drop:
			card.z_index = body_ref.z_index + 1
			tween.tween_property(self, "position", body_ref.global_position - Vector2(0,-10), 0.2).set_ease(Tween.EASE_OUT)
		else:
			tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)



func _on_area_2d_mouse_entered() -> void:
	if !Global.is_dragging:
		draggable = true

func _on_area_2d_mouse_exited() -> void:
	if !Global.is_dragging:
		draggable = false

#func _on_area_2d_area_entered(area: Area2D) -> void:
#	if current_drag and area.is_in_group('droppable'):
#		can_drop = true
#		area_ref = area


#func _on_area_2d_area_exited(area: Area2D) -> void:
#	if current_drag and area.is_in_group('droppable'):
#		can_drop = false
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if current_drag and body.is_in_group('droppable'):
		can_drop = true
		body_ref = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if current_drag and body.is_in_group('droppable'):
		can_drop = false
