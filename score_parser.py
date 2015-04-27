from note_sphere import NoteSphere

def parse(self, path):
	all_notes = []
	score_file = open(path)
	tick = 0
	for line in score_file:
        pitch, velocity, duration, start_pos, end_pos, time, tick = line.split(" ")
        pitch = float(pitch)
        velocity = int(velocity)
        start_pos = tuple(start_pos)
        end_pos = tuple(end_pos)
        time = tuple(time)
        tick = tuple(tick)
        all_notes.append(NoteSphere(pitch, velocity, start_pos, end_pos, time, tick))
        tick += float(tick)
    return all_notes