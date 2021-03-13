function [eigvec,eigval]=get_eig(a)
%Fuction to calculate eigenvalues and eigenvectors

%Define Coordinates
lat=a(:,7); lon=a(:,8); dep=a(:,9);
%--------------------------------
%Eigenvalues and eigenvectors
%Convert to Cartesian and demean
x=(lon-mean(lon)).*cosd(lat)*111.11;
y=(lat-mean(lat)).*111.11;
z=mean(dep)-dep;
%-------------------------------
%Stack into an array
M=[x y z];
%Covariance Matrix
C=cov(M);
%Ta-da!
[eigvec,eigval] = eig(C);

end
