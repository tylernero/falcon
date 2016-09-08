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
            c = zeros(1, 2*(obj.sizeN^2)+2*obj.sizeN);
            for i = 1:obj.sizeN^2
                c(i) = -round(rand*100);
            end
        end
        
        function [A] = aMatrixGen(obj)
            matrixHeight = 2*obj.sizeN+obj.sizeN^2;
            matrixWidth = 2*(obj.sizeN^2)+2*obj.sizeN;
            slackStart = obj.sizeN^2;
            A = zeros((matrixHeight),matrixWidth);
            % left side nodes = 1
            for i = 1:obj.sizeN
                A(i,(i-1)*obj.sizeN+1:i*obj.sizeN)=1;
                A(i,i+slackStart) = 1;
            end
            % right side nodes = 1
            for i = (obj.sizeN+1):(2*obj.sizeN)
                for j = 1:obj.sizeN
                    A(i,((j-1)*(obj.sizeN)+i-obj.sizeN)) = 1;
                    A(i,i+slackStart) = 1;
                end
            end
            % no variable less then zero
            for i = (2*obj.sizeN)+1:matrixHeight
                A(i,i-2*obj.sizeN) = -1;
                A(i,i+slackStart) = 1;
            end
        end
        
        function [b] = bVectorGen(obj)
            b = zeros(2*obj.sizeN+obj.sizeN^2,1);
            for i = 1:2*obj.sizeN
                b(i) = 1;
            end
        end
        
        function [Basis] = basisGen(obj)
            b = zeros(2*obj.sizeN+obj.sizeN^2,1);
            for i = 1:2*obj.sizeN+obj.sizeN^2
                Basis(i) = i + obj.sizeN^2;
            end
        end
    end
end
