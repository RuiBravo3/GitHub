import simpy
import numpy as np
import generator

def main():
    print("Simulation Start.")      #print Start
    env = simpy.Environment()       #creat the simulation Environment.
    env.process(traffic_light(env)) #creat a process for the simulation.
    env.run(until=120)              #run the simulation until t time
    print("Simulation Complete.")   #print complete

def traffic_light(env):
    while True:
        print("light Green at t = " + str(env.now))
        yield env.timeout(30)
        print("light Yellow at t = " + str(env.now))
        yield env.timeout(5)
        print("light Red at t = " + str(env.now))
        yield env.timeout(20)

# return the UpperBound

def getCeil(n):
    return np.ceil(n)
# return the FloorBound
def getFloor(n):
    return np.floor(n)

def binomial(n,p,k=None):
    return np.random.binomial(n,p,k)

if __name__ == '__main__':
    main()
print(getCeil(3.3) ,getFloor(3.3))

for j in range(9):
    print generator.gen(j).next()
