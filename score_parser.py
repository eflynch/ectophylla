from note import Note

def parse(path):
	all_notes = []
	score_file = open(path)
	global_tick = 0
	for line in score_file:
		print line.split(" ")
		# import pdb; pdb.set_trace()
		pitch, velocity, duration, start_pos, end_pos, time, x, y, tp, tick = line.rstrip().split(" ")
		pitch = float(pitch)
		velocity = float(velocity)
		duration = int(duration)
		start_pos = tuple(start_pos)
		end_pos = tuple(end_pos)
		time = tuple(time)
		x = float(x)
		y = float(y)
		tp = float(tp)
		new_tick = float(tick)
		global_tick += new_tick
		all_notes.append(Note(pitch, velocity, duration, start_pos, end_pos, time, x, y, tp, global_tick))
	return all_notes