extends CharacterBody2D

@onready var navigation_region_2d: NavigationRegion2D = $"../NavigationRegion2D"
@onready var area_2d: Area2D = $AnimatedSprite2D/Area2D
@onready var navigation_agent: NavigationAgent2D = $AnimatedSprite2D/NavigationAgent2D
@onready var player_owl: CharacterBody2D = $"../PlayerOwl"
@onready var self_area: Area2D = $Area2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
		if Global.cur == true:
			navigation_agent.target_position = player_owl.global_position
			velocity = global_position.direction_to(navigation_agent.get_next_path_position())
			move_and_slide()
		
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("playerattack") and self.visible:
		self.hide()
			
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	Global.lives -= 1
	await get_tree().create_timer(1).timeout
