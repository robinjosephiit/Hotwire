import numpy as np
from natsort import natsorted
import matplotlib.pyplot as plt
import os
from scipy import signal
import math
n = 0.46
A = 0.62183581
B = 0.31666322
SR=20000
time=20
def rms(arr):
    n=len(arr)
    square=0
    mean=0
    root=0
    for i in range(0,n):
        square += (arr[i]**2)
        
    mean = (square / (float)(n))
    root = math.sqrt(mean)
    return root
#Reading all files
file_path = 'E:\\OneDrive - Indian Institute of Science\\New experiments\\15-08-2021\\Robin\\Experiment(1)\\loc_615mm_6ms_\\Unbundled'
file_dat = []
file_all = os.listdir(file_path)
for i in file_all:
    if i.endswith('.dat'):
        file_dat.append(i)
file_dat = natsorted(file_dat)
file_dat.pop()

    
y = np.zeros(len(file_dat))
Vel = np.zeros(len(file_dat))
E = np.zeros((SR*time,len(file_dat)))
Time=np.zeros(SR*time)
U = np.zeros((SR*time,len(file_dat)))
E_avg = np.zeros(len(file_dat))
Vel_cal = np.zeros(len(file_dat))

#Opening files
for i in list(range(len(Vel))):
    print(i+1)
    file_v = open(file_path+'\\'+file_dat[i],'r')
    g = file_v.readlines()
    y[i] = float(g[1][15:])
    Vel[i] = float(g[2][15:-1])
    file_e = np.loadtxt(file_path+'\\'+file_dat[i], dtype=float, skiprows=23)
    E[:,i] = (file_e[:,1])
    U[:,i] = (((E[:,i]**2)-A)/B)**(1/n)
    E_avg[i] = np.mean(E[:,i])
    Vel_cal[i] = (((E_avg[i]**2)-A)/B)**(1/n)
Vel_inf = np.mean(Vel[:])
np.savetxt('U.txt',U,delimiter =' ')
np.savetxt('y.txt',y,delimiter =' ')
Time=file_e[:,0]

y=y*(-1)
Dim=np.shape(U)
Samples=Dim[0]
locations=Dim[1]

Umean=np.zeros(locations)
Urms=np.zeros(locations)
Urms_filt=np.zeros(locations)
Uflc=np.zeros((Samples,locations))
Uflc_filt=np.zeros((Samples,locations))
for i in range(0,locations):
    Umean[i]=np.mean(U[:,i])
    Uflc[:,i]=U[:,i]-Umean[i]
    
Uinf=np.mean(Umean[-5:])




#High pass filtering

fc = 1  # Cut-off frequency of the filter
w = fc / (SR / 2) # Normalize the frequency
order =4
bb, aa = signal.butter(order, w, 'high')

for i in range(0,locations):
    Uflc_filt[:,i] = signal.filtfilt(bb, aa, Uflc[:,i])

for i in range(0,locations):
    Urms_filt[i]=np.std(Uflc_filt[:,i])
    Urms[i]=np.std(Uflc[:,i])
    
    
  
   
    
   
#Calculating integral parameters: Adding zero to the array first
y_corr = np.insert(y,0,0,axis=0)
Vel = np.insert(Umean,0,0,axis=0)
Urms=np.insert(Urms,0,0,axis=0)
Urms_filt=np.insert(Urms_filt,0,0,axis=0)

U_norm=np.zeros(len(Vel))
U_sub=np.zeros(len(Vel))
U_norm = Vel/Uinf 
U_sub=1-U_norm
disp_t=np.trapz(U_sub,y_corr)
mom_t=np.trapz(np.multiply(U_norm,U_sub),y_corr)
H=disp_t/mom_t

f=np.zeros((Samples,locations))
P=np.zeros((Samples,locations))

for i in range(0,locations):
     print(i+1)
     temp=Uflc_filt[:,i]
     f1,P1 = signal.welch(temp, SR,nperseg=16384,nfft=16384)
     f[0:len(f1),i]=f1
     P[0:len(f1),i]=P1

%matplotlib qt
plt.figure(3)    
plt.loglog(f[0:len(f1),0], P[0:len(f1),0])
plt.loglog(f[0:len(f1),4], P[0:len(f1),4])
plt.loglog(f[0:len(f1),9], P[0:len(f1),9])
plt.loglog(f[0:len(f1),19], P[0:len(f1),19])
plt.loglog(f[0:len(f1),30], P[0:len(f1),30])
plt.xlabel('frequency [Hz]')
plt.legend(['wall','close to wall','medium height from wall','away from wall','freestream'])
plt.ylabel('PSD [V**2/Hz]')
plt.xlim(1,10000)
plt.ylim(.1E-9,0.1)
plt.grid()
plt.show()

    



#plotting mean
%matplotlib qt
plt.figure(1)
plt.plot(y_corr/disp_t,U_norm,'-o')
plt.xlabel('y/$\delta$',fontsize=18)
plt.ylabel('U/U$_\infty$',fontsize=18)
plt.xlim((0,10))
plt.ylim((0,1.1))
plt.xticks(fontsize=18)
plt.yticks(fontsize=18)

plt.grid()

plt.figure(2)
plt.plot(y_corr/disp_t,Urms_filt*100/Uinf,'-o')
plt.xlabel('y/$\delta$*',fontsize=18)
plt.ylabel('(Urms/U$_\infty)*100$',fontsize=18)
# plt.xlim((0,10))

plt.xticks(fontsize=18)
plt.yticks(fontsize=18)
plt.grid()

# temp=Uflc[:,1]
# np.savetxt('U1.txt',temp,delimiter =' ')

%matplotlib qt
plt.figure(4)   
plt.subplot(5,1,1)
plt.plot(Time,Uflc_filt[:,0])
plt.title('Wall');plt.xlim(0,3);plt.ylim(-1,2)
plt.subplot(5,1,2)
plt.plot(Time,Uflc_filt[:,4])
plt.title('Close to Wall');plt.xlim(0,3);plt.ylim(-1,2)
plt.subplot(5,1,3)
plt.plot(Time,Uflc_filt[:,9])
plt.title('Medium height from Wall');plt.xlim(0,3);plt.ylim(-1,2)
plt.subplot(5,1,4)
plt.plot(Time,Uflc_filt[:,19])
plt.title('Away from Wall');plt.xlim(0,3);plt.ylim(-1,2)
plt.subplot(5,1,5)
plt.plot(Time,Uflc_filt[:,30])
plt.title('Freestream');plt.xlim(0,3);plt.ylim(-1,2)

