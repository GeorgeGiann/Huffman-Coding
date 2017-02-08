function [Codeword, unk_let]= huffmanenco(text, Dict, N)

    %   Input arguments
    %   text : text to encode
    %   Dict: huffman dictionary, every letter or N letters  
    %           correspond to a binary sequence of 0 and 1
    %   N: Huffman extension
    
    unk_let=0;
    Codeword = [] ;
    %loop through text  letters
    for i=1:N:length(text)
        letter=[];
       for j=i:i+N-1
           if j<= length(text)
                letter=strcat(letter,text(j)) ;
           end
       end
       found= 0;
       index = 1;
       %loop through known words/letters 
       %to find huffman represantation
       while ~found
           %a text letter that matches with a letter in
           %the huffman represantation index, is replaced
           %with the corresponding binary word
           if strcmp(Dict{index,1},letter)
              found=1;
              Codeword = strcat(Codeword,Dict{index,2});
           else 
               index=index+1;
           end
           %if there is no match text letter is ignored
           %and letters-characters with no match 
           %are encountered
           if index>length(Dict)
             unk_let=unk_let+1;
             % error('Unrecognised letter: %s',letter) ;
             found=1;
           end
       end
    end

end