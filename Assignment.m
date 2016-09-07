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
            c = zeros(1,3*(obj.sizeN)^2);
            for i = 1:obj.sizeN^2
                c(i) = round(rand*100);
            end
        end
        
        function [A] = aMatrixGen(obj)
            A = zeros(2*(obj.sizeN)^2,3*(obj.sizeN)^2)
            % left side nodes = 1
            for i = 1:obj.sizeN
                A(i,(i-1)*obj.sizeN+1:(i)*obj.sizeN)=1
                A(i,i+obj.sizeN^2) = 1
            end
            % right side nodes = 1
            for i = (obj.sizeN+1):(2*obj.sizeN)
                for j = 1:obj.sizeN
                    A(i,((j-1)*(obj.sizeN)+i-obj.sizeN)) = 1
                    A(i,i+obj.sizeN^2) = 1  
                end
            end
            % no variable less then zero
            for i = (obj.sizeN^2)+1:2*(obj.sizeN^2)
                A(i,i-(obj.sizeN^2)) = 1
                A(i,i+(obj.sizeN)^2) = 1
            end
        end
        
        function [b] = bVectorGen(obj)
            b = ones(obj.sizeN^2,1)
        end
        
        function [Basis] = basisGen(obj)
            b = zeros(obj.sizeN^2,1)
            for i = 1:2*obj.sizeN^2
                Basis(i) = obj.sizeN^2 + i
            end
        end
    end
end
