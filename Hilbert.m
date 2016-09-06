
classdef Hilbert
    properties
        sizeN
        Amatrix
    end
    
    methods
        function obj = Hilbert(n)
            obj.sizeN = n
            obj.Amatrix = zeros(obj.sizeN,2*obj.sizeN)
            for i = 1:obj.sizeN
                for j = 1:(i-2)
                    obj.Amatrix(i,j) = 1/((i-1)+j)
                end
                obj.Amatrix(i,obj.sizeN+i) = 1
            end
        end
    end
    
    methods (Static)
        function [c] = costGen(obj)
            c = zeros(1,2*obj.sizeN);
            for i = 1:obj.sizeN
                c(i) = 1;
            %c(end) = 1
            end
        end  
        function [A] = aMatrixGen(obj)
            A = obj.Amatrix
        end
        function [b] = bVectorGen(obj)
            b = zeros(obj.sizeN,1)
            for i = 1:obj.sizeN
                b(i) = sum(obj.Amatrix(i,1:obj.sizeN)) 
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
