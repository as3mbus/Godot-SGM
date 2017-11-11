extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var moveSpeed = 100
export var jumpHeight = 400
const gravity = 9.8
var velocity = Vector2()
var feet
var grounded

func _ready():
	set_physics_process(true)
	
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _physics_process(delta):
	velocity.y += gravity
	if (Input.is_action_pressed("ui_left")):
		velocity.x = -moveSpeed
	elif (Input.is_action_pressed("ui_right")):
		velocity.x = moveSpeed
	else:
		velocity.x = 0
	print()
	if(grounded):
		if(Input.is_action_pressed("player_jump")):
			velocity.y=-jumpHeight
			grounded = false
		else :
			velocity.y=0;
	var motion = velocity
	move_and_slide(motion)
	
func _process(delta):
	
		
		
	
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass


func _on_Area2D_body_entered( body ):
	if(body.get_groups().has("platform")):
		print("enter")
		grounded = true
	pass # replace with function body



func _on_Area2D_body_exited( body ):
	if(body.get_groups().has("platform")):
		print("exit")
		grounded = false
	pass # replace with function body
