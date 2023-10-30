%Author: Mustafa Ali #372704
%This class is made to reduce redundancy and help the user better
%understand signal processing. Will be regularly updated and optimised

classdef utils


    methods (Static)
    
        
        function [] = plt(x, y, r, c, i, lbl)
            subplot(r,c,i);
            plot(x,y);
            xlabel(lbl);
            axis([min(x) max(x) utils.getsetMinValue utils.getsetMaxValue]), grid;
        end

        function [] = stemplt(x, y, r, c, i, lbl)
            subplot(r,c,i);
            stem(x,y);
            xlabel(lbl);
            axis([min(x) max(x) utils.getsetMinValue utils.getsetMaxValue]), grid;
        end 


        function value = getsetMaxValue(x, y)
            persistent maxValue;
            
            if isempty(maxValue)
                maxValue=5;
            end

            if nargin > 0
                if maxValue < x
                    maxValue = x+3;
                end
            end

            value = maxValue;

            if nargin == 2
                maxValue = 0;
            end
        end
        
        function value = getsetMinValue(x, y)
            persistent minValue;
            
            if isempty(minValue)
                minValue=5;
            end

            if nargin > 0
                if minValue > x
                    minValue = x-3;
                end
            end

            value = minValue;

            if nargin == 2
                minValue = 0;
            end
        end

        function reset()
            utils.getsetMinValue(0, 0);
            utils.getsetMaxValue(0, 0);
        end
    
    end
end
