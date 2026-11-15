extends CharacterBody2D

@onready var navigation_region_2d: NavigationRegion2D = $"../NavigationRegion2D"

@onready var area_2d_2: Area2D = $AnimatedSprite2D/Area2D2
@onready var h_box_container: HBoxContainer = $"../Camera2D/HBoxContainer"

@onready var navigation_agent: NavigationAgent2D = $AnimatedSprite2D/NavigationAgent2D
@onready var player_owl: CharacterBody2D = $"../PlayerOwl"
@onready var camera_2d: Camera2D = $"../Camera2D"
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var shell_lives = 2

func _ready() -> void:
	
	area_2d_2.area_entered.connect(_on_area_entered)

func _physics_process(delta: float) -> void:
		if Global.cur == true:
			navigation_agent.target_position = player_owl.global_position
			velocity = global_position.direction_to(navigation_agent.get_next_path_position())
			move_and_slide()
		


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("playerattack") and self.visible:
		shell_lives -= 1
		if shell_lives == 0 and Global.cur == true:
			self.hide()
			player_owl.position = Vector2(551.0,7700)
			camera_2d.limit_bottom = 7950
			camera_2d.limit_top = 6664
			h_box_container.position = Vector2(-100,-1280)
	


func _on_area_2d_area_entered(body: Node2D) -> void:
	Global.lives -= 1
	await get_tree().create_timer(1).timeout
