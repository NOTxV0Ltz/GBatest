class Счетчик:
    def init(self):
        self.__значение = 0

    def add(self):
        self.__значение += 1

    def get(self):
        return self.__значение

with Счетчик() as счетчик:
    счетчик.add()
    print(счетчик.get())
