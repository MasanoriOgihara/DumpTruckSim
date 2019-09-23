import world_util as util
import numpy as np
import argparse
from math import pi
from math import cos
from math import sin

# Check for verbosity option
parser = argparse.ArgumentParser(description='VAIL World Generation Script.')
parser.add_argument('-p','--plot', help='Enable Plotting', action='store_true')
args = parser.parse_args()

if ( args.plot == True ):
    import matplotlib.pyplot as plt

## VAIL PARKING LOT ##

# params
slen1 = 12 # radius of curvature of arcs
r1 = slen1/(pi/2)
eps = 1e-5
s1 = 100
s2 = 50
grade_rad = 0.0

# define s,k manually
s_in = [0, s1]
k_in = [0,  0]

# resample
n = 1000
s = np.linspace(0,s_in[-1],n)
k = np.interp(s, s_in, k_in)

# initial condition

#E_init   = 22.1068
#N_init   = -10.7145
#psi_init = 1.520
E_init   = 0.0
N_init   = 0.0
psi_init = 0.0

# create path
psi, E, N = util.integratePath(s, k, E_init, N_init, psi_init)

# obstacle information
# (N_m, E_m, Psi_rad, length_m, width_m) where Psi_rad is defined as the angle from North to the vehicle's length axis
obsList = [(-7.5, -4, 2, 2, 4), (-12.5, 8, 1.6, 2, 4)]
obsNArray = []
obsEArray = []

for N_m, E_m, Psi_rad, length_m, width_m in obsList:
    # plot each obstacle
    obsNArray.append([ N_m + length_m/2*cos(Psi_rad) + width_m/2*sin(Psi_rad),
                       N_m + length_m/2*cos(Psi_rad) - width_m/2*sin(Psi_rad),
                       N_m - length_m/2*cos(Psi_rad) - width_m/2*sin(Psi_rad),
                       N_m - length_m/2*cos(Psi_rad) + width_m/2*sin(Psi_rad),
                       N_m + length_m/2*cos(Psi_rad) + width_m/2*sin(Psi_rad)])

    obsEArray.append([ E_m - length_m/2*sin(Psi_rad) + width_m/2*cos(Psi_rad),
                       E_m - length_m/2*sin(Psi_rad) - width_m/2*cos(Psi_rad),
                       E_m + length_m/2*sin(Psi_rad) - width_m/2*cos(Psi_rad),
                       E_m + length_m/2*sin(Psi_rad) + width_m/2*cos(Psi_rad),
                       E_m - length_m/2*sin(Psi_rad) + width_m/2*cos(Psi_rad)])

# write to obstacle file of the same name
obsFile = open('straight.obs', 'w')
line = '%d ' % len(obsList)
for obs in obsList:
    line += '%f %f %f %f %f ' % obs
line += '\n'
obsFile.write(line)
obsFile.close()

# store in dict
world = {}
world['s_m'] = s
world['k_1pm'] = k
world['posE_m'] = E
world['posN_m'] = N
world['psi_rad'] = psi
world['edgeL_m'] = np.ones((n,))*7
world['edgeR_m'] = np.ones((n,))*-7
world['grade_rad'] = np.ones((n,))*grade_rad
world['UxDes_mps'] = np.ones((n,))*3
world['AxDes_mps2'] = np.zeros((n,))
world['isOpen'] = np.array((1,))

# write world file
util.writeToFile(world, 'straight.world')

# plot
if ( args.plot == True ):
    plt.plot(E,N)
    plt.axis('equal')
    for obsE, obsN in zip(obsEArray, obsNArray):
        plt.plot(obsE, obsN)
    plt.show()
