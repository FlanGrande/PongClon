extends KinematicBody2D

onready var window = get_tree().get_root();

var speed = Vector2(5, 5)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_checks()
	
	pass

func move_checks():
	move_and_collide(speed)
	
	pass

func send_to_center():
	position = Vector2(window.size.x / 2, window.size.y / 2)
	speed = Vector2(5, 5)
	
	pass

func _on_Area2D_body_entered(body):
	if(body.is_in_group("bounds")):
		speed.y = -speed.y
	
	if(body.is_in_group("player_bars")):
		speed = Vector2(speed.x * 1.1, speed.y * 1.1)
		speed.x = -speed.x
	
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if(area.is_in_group("goals")):
		send_to_center()
	
	pass # Replace with function body.
