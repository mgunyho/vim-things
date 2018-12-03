import numpy as np
import matplotlib.pyplot as plt
#from mpl_toolkits import mplot3d # 3D plotting

ipython = "get_ipython" in globals()

plt.close("all")


fig = plt.figure(facecolor = "w")
ax = fig.gca()



plt.show(block = not ipython)
