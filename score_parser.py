from note_sphere import NoteSphere

def parse(path):
	all_notes = []
	score_file = open(path)
	global_tick = 0
	for line in score_file:
		print line.split(" ")
		# import pdb; pdb.set_trace()
		pitch, velocity, duration, start_pos, end_pos, time, tick = line.split(" ")
		pitch = float(pitch)
		velocity = float(velocity)
		duration = int(duration)
		start_pos = tuple(start_pos)
		end_pos = tuple(end_pos)
		time = tuple(time)
		new_tick = float(tick)
		all_notes.append(NoteSphere(pitch, velocity, duration, start_pos, end_pos, time, tick))
		global_tick += new_tick
	return all_notes