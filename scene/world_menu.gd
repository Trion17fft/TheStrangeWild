extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var selected_carousel_node = $carouselcontainer.position_offset_node.get_child($carouselcontainer.selected_index)
	print(selected_carousel_node.name)
	print(selected_carousel_node.size)
	print(selected_carousel_node.position)


func _on_left_pressed() -> void:
	$carouselcontainer._left()
	

func _on_right_pressed() -> void:
	$carouselcontainer._right()
