function [ output_args ] = pSimplexFunc( input_args )
input_args
end


function[c] = kleeMintyCostArrayGen(n)
c = zeros(n,1);
for i = 1:n
    c(i) = 2^(n-i)
end
end
