import simpy

def gen(n):
    while True:
        for j in range(n):
            yield j

myGen = gen(3)
for i in range(100):
    print gen(i).next()
    #print i , myGen.next()