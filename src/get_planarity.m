function l2=get_planarity(eigval)
%Function to compute planarity
%This is to define planarity and area

eigval=sort(eigval(:),'descend');
l1=1-(eigval(2)+eigval(3))/(2*eigval(1));
l2=1-((2*eigval(3))./(eigval(1)+eigval(2)));

if eigval(3)==0
    l3=0;
else
    l3=eigval(2)./eigval(3);
    l4=pi*eigval(1)*eigval(2);
end


end