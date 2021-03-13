function [strike, dip]=get_strdip(eigval,eigvec)
%Define strike and dip

%Remove zeros from eigenvalue matrix
temp(1,1)=eigval(eigval(:,1)>0,1);
temp(1,2)=eigval(eigval(:,2)>0,2);
temp(1,3)=eigval(eigval(:,3)>0,3);
%Find the minum value
[~,index]=min(temp);
%End the corresponding eigenvector
N=eigvec(:,index);

%Now do the strike and the dip!
strike=-atan2d(N(2),N(1));
dip=acosd(N(3));

%A few exceptions and we are all set
if strike<0 ; strike=strike+360; end
if strike>360; strike=strike-360;end
if dip>90; dip=180-dip; end


end