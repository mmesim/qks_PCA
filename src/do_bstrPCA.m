function [splanarity,sstrike,sdip,mplanarity,mstrike,mdip]=do_bstrPCA(a,Nboot)
%Function to do bootstrap for each cluster

%Preallocate memory
strike=NaN*(ones(Nboot,1));
dip=strike; planarity=strike;

N=length(a(:,1));
index=(1:N)';
%Start bootstrap loop
for i=1:Nboot
 bstr=randsample(index,N,true);   
 
 newcat=a(bstr,:);
 [planarity(i,1),strike(i,1),dip(i,1)]=do_PCA(newcat);
end

%Standar error
splanarity=std(planarity);
sstrike=std(strike);
sdip=std(dip);

%Mean values
mplanarity=mean(planarity);
mstrike=mean(strike);
mdip=mean(dip);

%end