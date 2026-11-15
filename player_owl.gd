extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

const SPEED = 400.0
const JUMP_VELOCITY = -400.0

var max_speed = 400
var last_direction := Vector2(1,0)

func _physics_process(delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * max_speed 
	move_and_slide()
	
	if Input.is_action_just_pressed("attack"):
		await get_tree().create_timer(1)
		animation_player.play("attack")
	
	if direction.length() > 0:
		last_direction = direction
		play_walk_animation(direction)
		
	else:
		play_idle_animation(last_direction)
		


func play_walk_animation(direction):
	if direction.x > 0:
		$AnimatedSprite2D.play("walk_right")
		
	elif direction.x < 0:
		$AnimatedSprite2D.play("walk_left")
	
	elif direction.y > 0:
		$AnimatedSprite2D.play("walk_down")
		
	elif direction.y < 0:
		$AnimatedSprite2D.play("walk_up")	
			
func play_idle_animation(direction):
	if direction.x > 0:
		$AnimatedSprite2D.play("right")
		
	elif direction.x < 0:
		$AnimatedSprite2D.play("left")
	
	elif direction.y > 0:
		$AnimatedSprite2D.play("down")
		
	elif direction.y < 0:
		$AnimatedSprite2D.play("up")
	
