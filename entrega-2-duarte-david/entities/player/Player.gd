extends Sprite2D

@onready var cannon:Sprite2D = $Cannon

var speed = 200 #Pixeles

var projectile_container:Node

var velocity

func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container

func _physics_process(delta): 
	var direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	var mouse_position:Vector2 = get_global_mouse_position() # VECTOR OBJETIVO
	cannon.look_at(mouse_position)
	
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
	
	position.x += direction * speed * delta
