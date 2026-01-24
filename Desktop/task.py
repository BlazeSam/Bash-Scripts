 # Task Manager
class Stack:
    def __init__(self):    
        self.items = []
        self.num = 0

    def appendStack(self, task):
        self.num += 1
        self.items.append(task)

    def pop(self):
        self.num -= 1
        