#!/usr/bin/python
import numpy as np
import matplotlib.pyplot as plt

fo = open("train.csv", "r")

   

w = np.random.rand(2,1)    #step 2
#step 3
data1 = np.loadtxt("train.csv", dtype=np.object, delimiter=",")
data1 = np.delete(data1, (0), axis=0)
splits= np.hsplit(data1,[0, 1])

X_train = splits[1]
Y_train = splits[2]
X = X_train.flatten()
Y = Y_train.flatten()
#plt.plot(Y,X)
#plt.show()
X0 = np.ones((10000,1), dtype=np.int)
X_train = np.hstack((X0,X_train))
XT = np.transpose(X_train)
wT = np.transpose(w)
tp = np.dot(wT, XT)
TP = tp.flatten
plt.plot(Y, X,'rx')
plt.plot(TP,X)
plt.show()
#step 4
#w_direct = (X_train^T*X_train)^(-1)*X_train^t*Y_train
#print X_train

