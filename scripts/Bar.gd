extends KinematicBody2D

export var id = 0

var speed = Vector2(0, 10)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_checks()
	
	speed = Vector2(0, 10)
	pass

func move_checks():
	if(Input.is_action_pressed("SHIFT_%s" % id)):
		speed = speed * 2
	
	if(Input.is_action_pressed("UP_%s" % id)):
		move_and_collide(-speed)
	elif(Input.is_action_pressed("DOWN_%s" % id)):
		move_and_collide(speed)
	
	pass

func _on_Area2D_body_entered(body):
	if(body.is_in_group("balls")):
		body.speed.x = -body.speed.x
	pass # Replace with function body.
