extends Sprite2D

@export var speed:float = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	position.x += direction * speed * delta
