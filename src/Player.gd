extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 50

onready var animator = $AnimationPlayer

func _physics_process(_delta):
	velocity = Vector2(
		-int(Input.is_action_pressed('ui_left')) + int(Input.is_action_pressed('ui_right')),
		-int(Input.is_action_pressed('ui_up')) + int(Input.is_action_pressed('ui_down'))
	) * speed
	velocity = move_and_slide(velocity)

	pick_animation()

func pick_animation():
	if velocity.length() > 1:
		animator.current_animation = 'Walk'
	else:
		animator.current_animation = 'Idle'
