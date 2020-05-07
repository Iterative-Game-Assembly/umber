extends KinematicBody2D

var line
var path
var path_follower

func _ready():
	line = Line2D.new()
	line.width = 2

	path = Path2D.new()
	path_follower = PathFollow2D.new()

	owner.call_deferred('add_child', line)
	path.add_child(path_follower)
	owner.call_deferred('add_child', path)

func _physics_process(delta):
	if path:
		pass

func _unhandled_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		var points = owner.get_node('Navigation2D').get_simple_path(global_position, event.global_position)

		line.points = points

		path.curve.clear_points()
		for point in points:
			path.curve.add_point(point)
