class Repeat:
    def __init__(self, x):
        self.__x = x

    def __next__(self):
        return self.__x
