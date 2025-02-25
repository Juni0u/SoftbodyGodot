extends RigidBody2D
var robot_id
signal bone_collided(myself:RigidBody2D, collider:Node)
signal bone_collision_finished(myself:RigidBody2D, collider:Node)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 30
	connect("body_entered", _on_body_entered)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(collider:Node):
	var my_id = self.get_groups()[1]
	if not(collider.is_in_group(my_id)):
		bone_collided.emit(self,collider)
	
func _on_body_exited(collider:Node):
	bone_collision_finished.emit(self,collider)
		
