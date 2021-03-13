function [planarity,strike,dip]=do_PCA(a)
%Function for PCA work-flow
%Get eigenvalues and eigenvectors
[eigvec,eigval]=get_eig(a);
%Now check planarity
planarity=get_planarity(eigval);
%Now do the strike and dip
[strike,dip]=get_strdip(eigval,eigvec);
%--------------------------------

end

