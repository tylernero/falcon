classdef Assignment
    %class for generating the Klee-Minty matri
    %   Detailed explanation goes here
    
    properties
        sizeN
    end
    
    methods
        function obj = Assignment(n)
            obj.sizeN = n;
        end
    end
    methods (Static)
        function [c] = costGen(obj)
            c = zeros(1,2*obj.sizeN^2);
            for i = 1:obj.sizeN^2
                c(i) = round(rand*100);
            end
        end
        
        function [A] = aMatrixGen(obj)
            A = zeros(2*obj.sizeN,2*obj.sizeN^2)
            for i = 1:obj.sizeN
                A(i,(i-1)*obj.sizeN+1:(i)*obj.sizeN)=1
                A(i,i+obj.sizeN^2) = 1
            end
            for i = (obj.sizeN+1):(2*obj.sizeN)
                for j = 1:obj.sizeN
                    A(i,((j-1)*(obj.sizeN)+i-obj.sizeN)) = 1
                    A(i,i+obj.sizeN^2) = 1
                    
                end
            end
        end
        
        function [b] = bVectorGen(obj)
            b = ones(2*obj.sizeN,1)
        end
        
        function [Basis] = basisGen(obj)
            b = zeros(2*obj.sizeN^2,1)
            for i = 1:obj.sizeN^2
                Basis(i) = obj.sizeN^2 + i
            end
        end
    end
end
