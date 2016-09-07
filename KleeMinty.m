classdef KleeMinty
    %class for generating the Klee-Minty matri
    %   Detailed explanation goes here
    
    properties
        sizeN
    end
    
    methods
        function obj = KleeMinty(n)
            obj.sizeN = n;
        end
    end
    methods (Static)
        function [c] = costGen(obj)
            c = zeros(1,2*obj.sizeN);
            for i = 1:obj.sizeN
                c(i) = -2^(obj.sizeN-i);
            %c(end) = 1
            end
        end
        
        function [A] = aMatrixGen(obj)
            A = zeros(obj.sizeN,2*obj.sizeN)
            for i = 1:obj.sizeN
                for j = 1:(i-1)
                    A(i,j) = 2^(i-j+1)
                end
                A(i,i) = 1
                A(i,obj.sizeN+i) = 1
            end
        end
        
        function [b] = bVectorGen(obj)
            b = zeros(obj.sizeN,1)
            for i = 1:obj.sizeN
                b(i) = (5^i)
            end
        end
        
        function [Basis] = basisGen(obj)
            b = zeros(obj.sizeN,1)
            for i = 1:obj.sizeN
                Basis(i) = obj.sizeN + i
            end
        end
    end
end
