extends Sprite2D

@onready var cannon:Sprite2D = $Cannon
var speed = 250 #Pixeles
var projectile_container:Node

var velocity: Vector2 = Vector2.ZERO
var acceleration: float = 600.0 
var friction: float = 150.0
var max_speed: float = 500.0

func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	var direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	input_vector.x = direction
	
	var mouse_position:Vector2 = get_global_mouse_position() # VECTOR OBJETIVO
	cannon.look_at(mouse_position)
	
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	position += velocity * delta
