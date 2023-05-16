clear all 
close all
clc
Nx=11;
Ny=11;
Nz=11;
clf
hold on
[i,j]=meshgrid(1:Nx,1:Ny);
k=zeros(Ny,Nx)+Nz;
surf(i,j,k)
[i,k]=meshgrid(1:Nx,1:Nz);
j=zeros(Nz,Nx)+Ny;
surf(i,j,k)
[j,k]=meshgrid(1:Ny,1:Nz);
i=zeros(Nz,Ny)+Nx;
surf(i,j,k)
[i,j]=meshgrid(1:Nx,1:Ny);
k=zeros(Ny,Nx)+1;
surf(i,j,k)
[i,k]=meshgrid(1:Nx,1:Nz);
j=zeros(Nz,Nx)+1;
surf(i,j,k)
[j,k]=meshgrid(1:Ny,1:Nz);
i=zeros(Nz,Ny)+1;
surf(i,j,k)
view(30,30)