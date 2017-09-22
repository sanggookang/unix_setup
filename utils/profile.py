import os
try:
    import cPickle
except:
    import pickle

class profile(object):
    def __init__(self, filename='', objects={}, requirements={}):
        if not os.path.isfile(filename):
            self.objects = objects
            self.requirements = requirements
        else:
            with open(filename, 'rb') as f:
                self.objects, self.requirements = pickle.load(f)
    def addArray(self, name, array, requirements=[], replace=False):
        if name in self.objects and not replace:
            self.objects[name] += array
        else:
            self.objects[name] = array
        for requirement in requirements:
            if requirement in self.objects:
                if name in self.requirements and requirement not in self.requirements:
                    self.requirements.append(requirement)
                if name not in self.requirements:
                    self.requirements = [requirement]
    def addLine(self, name, line, replace=False):
        self.addArray(name, [line], replace)
    def get(self, name):
        return self.objects[name]
    def addLinesFromFile(self, name, filename, start, end=None, requirements=[], combine=True, replace=False):
        if not os.path.isfile(filename):
            print("File does not exist")
        with open(filename, 'r') as f:
            for _ in range(start - 1):
                f.readline()
            output = []
            if not end:
                end = 1
            else:
                end = end - start + 1
            for _ in range(end):
                output.append(f.readline().strip('\n\r'))
            if combine:
                output = ['\n'.join(output)]
            self.addArray(name, output, replace)
    def saveToDisk(self, filename):
        with open(filename, 'wb') as f:
            pickle.dump(self.objects, f)
    def remove(self, name):
        for key in self.requirements:
            
        del self.objects[name]

