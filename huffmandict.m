function Tab = huffmandict(A,P)

%Input arquments
%A: array with 1 character in every position to encode
%   cell array with max N characters in every position to encode
%P: possibilities corresponding in each character position of A

tree = cell(length(A),1);

%Initialization of tree data structure
if isa(A,'char')
    for i=1:length(A)
        tree{i}=A(i) ;
    end
else 
    for i=1:length(A)
        tree{i}=A{i} ;
    end
end

%Creation of binary tree according to possibilities
while numel(tree)>2
    %sort possibilities and the tree nodes
    [P,I]=sort(P);
    tree=tree(I);
    %sum 2 minimum possibilities and merge the corresponding nodes to 1
    P(2)=P(1)+P(2);
    P(1)=[];
    tree{2}={tree{1},tree{2}};
    tree(1)=[];
   
end

global Dic;
Dic  = cell(length(A),2);
global Lcounter; 
Lcounter = 0;

codewords(tree,[]);

%retrospective function that calls itself till
%a leaf is found with depth-first search.
function codewords(node,word)
    if isa(node,'cell')
        %if left node if passed 0 is added to the binary word
        %else is added 1
       codewords(node{1},[word 0]) 
       codewords(node{2},[word 1]) 
    else
        Lcounter = Lcounter +1;
        Dic{Lcounter,1} = node ;
        Dic{Lcounter,2} = char('0'+word);
    end
end
 Tab = Dic;
end





