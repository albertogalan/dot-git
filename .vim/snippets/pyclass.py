class Nameclass ():
    def __init__(self,obj):
        self.url = obj.val1
        self.keyword = obj.val2
        self.tricks=[]
    def init_class(self):
        print('init class..')
        return 1
    def read_temperature(self,device1):
        print('reading temperature from: '+ device1)
    def add_trick(self,trick):
        print('adding trick function2 ')
        sel.tricks.append(trick)



MyObject = type('MyObject', (object,), {})
obj1 = MyObject()
obj1.url='http://www'
obj1.keyword='key1'

aa=Nameclass(obj1)
