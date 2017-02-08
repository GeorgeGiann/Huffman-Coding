function text = huffmandeco(codeword,Dict)

    % Input arquments
    % codeword: coded word with huffman code
    % Dict: dictionary talbe: 1st column characters/ N characters
    %                         2nd column binary huffman code
    
    text=[];
   
    DictIn = 0;
    bitStart = 1;
    %loop throgh coded work bits
    while bitStart<length(codeword)
        found=0;
        %check binary words for a match
        while ~found
             DictIn = DictIn + 1;
            %if there is no match something went wrong
            if DictIn>length(Dict)
                %terminate function
                error('Not found compatible letter')
            end
            %every binary word is being compared with
            %coded words bits
            dicWord = Dict{DictIn,2};
            wordLen = length(dicWord);
            bitEnd=bitStart+wordLen-1;
            if bitEnd<=length(codeword)
                %if a binary word matches is replaced by the 
                %corresponding character
                if strcmp(codeword(bitStart:bitEnd),dicWord) 
                    text=strcat(text,Dict{DictIn,1});
                    %keep checking the remaining bits
                    bitStart=bitStart+wordLen;
                    found = 1;
                    DictIn = 0;
                end
            end
        end
    end
end