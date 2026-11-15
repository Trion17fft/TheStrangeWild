extends CharacterBody2D

@onready var self_area2: Area2D = $Area2Dshrimp

@onready var h_box_container: HBoxContainer = $"../Camera2D/HBoxContainer"

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var player_owl: CharacterBody2D = $"../PlayerOwl"

@onready var camera_2d: Camera2D = $"../Camera2D"

@export var target_to_chase: CharacterBody2D
const SPEED = 300.0
'''10017
	110654'''
	
var shrimp_lives = 2

func _ready() -> void:
	self_area2.area_entered.connect(_on_area_entered)
	animated_sprite_2d.play("idle")
	
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("playerattack") and self.visible:
		shrimp_lives -= 1
		if shrimp_lives == 0:
			Global.lives = 4
			player_owl.position = Vector2(551.0,9234.0)
			camera_2d.limit_bottom = 9354
			camera_2d.limit_top = 8700
			h_box_container.position = Vector2(-100,-880)
			Global.cur = true
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Collision avec :", body.name)
	Global.lives -= 1
