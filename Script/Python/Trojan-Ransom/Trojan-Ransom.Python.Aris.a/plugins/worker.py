import queue
import threading

class Worker(threading.Thread):
	def __init__(self,q, target):
		self.q = q
		self.target = target
		super().__init__()
	def run(self):
		while True:
			try:
				work = self.q.get(timeout=5)
			except queue.Empty:
				return
			self.target(work)
			self.q.task_done()