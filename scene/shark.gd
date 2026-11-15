extends CharacterBody2D

@onready var area_2d: Area2D = $Area2D

@onready var h_box_container: HBoxContainer = $"../Camera2D/HBoxContainer"
@onready var player_owl: CharacterBody2D = $"../PlayerOwl"
@onready var camera_2d: Camera2D = $"../Camera2D"


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	
	area_2d.area_entered.connect(_on_area_entered)

var shark_lives = 2

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("playerattack") and self.visible:
		if shark_lives == 0 and Global.cur == true:
			get_tree().change_scene_to_file("res://scene/win.tscn")
			
			
			


func _on_area_2d_area_entered(body: Node2D) -> void:
	print("Collision avec :", body.name)
	Global.lives -= 1
