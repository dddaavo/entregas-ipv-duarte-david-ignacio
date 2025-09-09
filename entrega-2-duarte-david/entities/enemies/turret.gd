extends Sprite2D

@export var projectile_scene:PackedScene

var projectile_container:Node
var player

func _ready():
	randomize()
	var screen_size = get_viewport_rect().size
	var random_x = randf_range(0, screen_size.x)
	var random_y = randf_range(0, screen_size.y / 2)
	position = Vector2(random_x, random_y)

func set_values(player, projectile_container):  
	self.player = player
	self.projectile_container = projectile_container
	$Timer.start()

func _on_timer_timeout() -> void:
	fire()
	
func fire():
	var projectile:Projectile = projectile_scene.instantiate()
	projectile_container.add_child(projectile)
	projectile.set_starting_values($FirePosition.global_position, (player.global_position - $FirePosition.global_position).normalized())
	projectile.connect("delete_requested", _on_projectile_delete_requested)

func _on_projectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
