%Script to define strike-dip-rake based on PCA analysis
clear;clc;close all
%% Parameters
Nboot=500;
filename='clusters.mat'; %This should contain a cell array [clusters] with each cluster
% --------------> M.M. UUSS - 03/2021  -----------------------------------
%% Load data
mydir=pwd; pdir=sprintf('%s/src/',pwd); % get working directory path
addpath(genpath(pdir));  %add src to path 
load(filename)

%% Pre-allocate
planarity=NaN*ones(length(clusters),1); mplanarity=NaN*ones(length(clusters),1);
splanarity=NaN*ones(length(clusters),1);
dip=NaN*ones(length(clusters),1);mdip=NaN*ones(length(clusters),1);
sdip=NaN*ones(length(clusters),1);
strike=NaN*ones(length(clusters),1);mstrike=NaN*ones(length(clusters),1);
sstrike=NaN*ones(length(clusters),1);

%% Start Loop for each cluster
 for i=1:length(clusters)
     %% Do each cluster
     fprintf('This is cluster %02d \n',i)
     [planarity(i,1),strike(i,1),dip(i,1)]=do_PCA(clusters{1,i});
     
     %% Now do the bootstrap
     [splanarity(i,1),sstrike(i,1),sdip(i,1),mplanarity(i,1),mstrike(i,1),mdip(i,1)]...
         =do_bstrPCA(clusters{1,i},Nboot);
 end
 
save cluster_5.mat