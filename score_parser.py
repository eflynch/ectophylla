from note import Note

def parse(path):
	all_notes = []
	score_file = open(path)
	for line in score_file:
		pitch, velocity, duration, time, x, y, tp = line.rstrip().split(" ")
		pitch = float(pitch)
		velocity = float(velocity)
		duration = int(duration)
		time = tuple(time)
		x = float(x)
		y = float(y)
		tp = float(tp)
		all_notes.append(Note(pitch, velocity, duration, time, x, y, tp))
	return all_notes