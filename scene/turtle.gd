extends CharacterBody2D

@onready var self_area: Area2D = $Area2D

@onready var player_owl: CharacterBody2D = $"../PlayerOwl"
@onready var h_box_container: HBoxContainer = $"../Camera2D/HBoxContainer"

@onready var camera_2d: Camera2D = $"../Camera2D"

@export var target_to_chase: CharacterBody2D
const SPEED = 300.0

var turtle_lives = 2
'''11310
	10654'''

func _ready() -> void:
	
	self_area.area_entered.connect(_on_area_entered)
	$AnimatedSprite2D.play("idle")
	
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("playerattack") and self.visible:
		turtle_lives -= 1
		if turtle_lives == 0:
			player_owl.position = Vector2(551.0,10534.0)
			camera_2d.limit_bottom = 10031
			camera_2d.limit_top = 10708
			h_box_container.position = Vector2(-100,-500)
			self.hide()
			
			Global.lives = 4
			
	



	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Collision avec :", body.name)
	Global.lives -= 1
