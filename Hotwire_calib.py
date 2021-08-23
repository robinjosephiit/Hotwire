import numpy as np
import os
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
from scipy import signal
import math
#Reading all files

SR=int(input('Enter the sampling Rate'))
Time=int(input('Enter the number of seconds'))

file_path = 'E:\\OneDrive - Indian Institute of Science\\New experiments\\15-08-2021\\Robin\\Experiment(1)\\cali\\Unbundled'
file_dat = []
file_all = os.listdir(file_path)
for i in file_all:
    if i.endswith('.dat'):
        file_dat.append(i)
file_dat.pop()

Vel = np.zeros(len(file_dat))
Vel_calc = np.zeros(len(file_dat))
E = np.zeros(len(file_dat))
RMS=np.zeros(len(file_dat))
RMS_filt=np.zeros(len(file_dat))
Volt=np.zeros((SR*Time,len(file_dat)))
Velocity=np.zeros((SR*Time,len(file_dat)))
U_flc=np.zeros((SR*Time,len(file_dat)))
U_flc_filt=np.zeros((SR*Time,len(file_dat)))
                    
                    
print('Reading files')
#Opening files
for i in list(range(len(Vel))):
    file_v = open(file_path+'\\'+file_dat[i],'r')
    g = file_v.readlines()
    Vel[i] = float(g[2][15:-1])
    file_e = np.loadtxt(file_path+'\\'+file_dat[i], dtype=float, skiprows=23)
    E[i] = np.mean(file_e[:,1])
    Volt[:,i] = file_e[:,1]
#Linear fit


print('Finding Kings law constants')
z=np.zeros((100,2))
temp=0
for i in np.arange(0.01,1.01,0.01):
    n = i
    reg = LinearRegression().fit(Vel[:,None]**n, E[:,None]**2)
    # print('R_square = '+str(reg.score(Vel[:,None]**n, E[:,None]**2)))
    # # print('B = '+str(reg.coef_))
    # # print('A = '+str(reg.intercept_))
    # print('n = '+str(n))
    z[temp,0]=n
    z[temp,1]=reg.score(Vel[:,None]**n, E[:,None]**2)
    temp=temp+1
 
  

temp=np.where(z[:,1] == np.amax(z[:,1]))
n=z[temp,0]
reg = LinearRegression().fit(Vel[:,None]**n, E[:,None]**2)
print('R_square = '+str(reg.score(Vel[:,None]**n, E[:,None]**2)))
print('B = '+str(reg.coef_))
print('A = '+str(reg.intercept_))
print('n = '+str(n))
B=reg.coef_[0,0]
A=reg.intercept_[0]


for i in list(range(len(Vel))):
    Velocity[:,i]=((Volt[:,i]**2-(A))/B)**(1/n)

for i in list(range(len(Vel))):
    U_flc[:,i]=Velocity[:,i]-np.mean(Velocity[:,i])
    
fc = 1  # Cut-off frequency of the filter
w = fc / (SR / 2) # Normalize the frequency
order =4
bb, aa = signal.butter(order, w, 'high')

for i in list(range(len(Vel))):
    U_flc_filt[:,i] = signal.filtfilt(bb, aa, U_flc[:,i])

for i in list(range(len(Vel))):
    RMS_filt[i]=np.std(U_flc_filt[:,i])/np.mean(Velocity[:,i])
    RMS[i]=np.std(U_flc[:,i])/np.mean(Velocity[:,i])
    Vel_calc[i]=np.mean(Velocity[:,i])

%matplotlib qt
plt.figure(1)
plt.rcParams['font.size'] = '16'
plt.plot(z[:,0],z[:,1],'-o')
plt.xlabel('n')
plt.ylabel('Goodness of fit')
  

plt.figure(2)
plt.plot(Vel,Vel_calc,'-o')
plt.xlabel('Velocity from Manometer(m/s)', fontsize=16)
plt.ylabel('Velocity from Hot wire(m/s)', fontsize=16)


plt.figure(3)
plt.rcParams['font.size'] = '16'
plt.plot(Vel,RMS*100,'-o')
plt.plot(Vel,RMS_filt*100,'-o')
plt.grid()
plt.legend(['TI unfiltered','TI 1Hz filter'], fontsize=16)
plt.xlabel('Velocity(m/s)', fontsize=16)
plt.ylabel('Turbulence intensity(%)', fontsize=16)



