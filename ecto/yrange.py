class Yrange(object):
   """
   ping pong like iterator
   """
   def __init__(self, n):
      self.i = 0
      self.n = n
      self.curr_direction = "up"

   def __iter__(self):
      return self

   def next(self):
      if self.curr_direction == "up":
         if self.i < self.n - 1:
            i = self.i
            self.i += 1
            return i
         else: # self. i == self.n - 1
            self.curr_direction = "down"
            return self.i
      else: # self.curr_direction == "down"
         if self.i > 0:
            i = self.i
            self.i -= 1
            return i 
         else:
            self.curr_direction = "up"
            return self.i