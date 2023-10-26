extends CharacterBody2D

#export so it appears at the inspector when selecting the player
@export var speed = 300
@export var gravity = 30
@export var jump_force = 300

#handles calculations that must happen before each physics step
func _physics_process(delta):
	
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 500:
			velocity.y = 500
	
	#should add this conditional under else clause, so it can only jump when on floor
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force
	
	#get_axis method returns -1 for first parameter and 1 for second, 0 for both
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	
	velocity.x = speed * horizontal_direction
	
	move_and_slide()
