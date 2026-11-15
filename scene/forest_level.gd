extends Node2D

@onready var h_box_container: HBoxContainer = $Camera2D/HBoxContainer
@onready var heart1: TextureRect = $Camera2D/HBoxContainer/heart1
@onready var heart2: TextureRect = $Camera2D/HBoxContainer/heart2
@onready var heart3: TextureRect = $Camera2D/HBoxContainer/heart3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match Global.lives:
		4:
			pass
		3:
			heart1.hide()
		2:
			heart1.hide()
			heart2.hide()
		1:
			heart1.hide()
			heart2.hide()
			heart3.hide()
		0:
			h_box_container.hide()
			
	if Global.lives <= 1:
		get_tree().change_scene_to_file("res://scene/death_scene.tscn")
