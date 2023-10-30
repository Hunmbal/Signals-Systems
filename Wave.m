%Author: Mustafa Ali #372704
%This class will help you create and manipulate periodic waves

classdef Wave

    properties
        t =0:0.001:18
        f = []
        A = []
        p = []
        wave = []
        sample_rate = 4;

    end

    properties (Access = private)
        r
        c
        i
        lbl
    end
    
    methods
        function obj = Wave(ff,aa, pp)
            
            if (length(ff) == length(aa) && length(ff) == length(pp))
                obj.f = ff;
                obj.A = aa;
                obj.p = pp;           
                obj = obj.update();
            else
                disp("Wave parameters should be of equal length!");
            end

        end
        
        function res = addwave(obj,ff,aa, pp)
            res = obj;
            res.f = [res.f, ff];
            res.A = [res.A, aa];
            res.p = [res.p, pp];
            res = res.update();
        end

        function [] = plt(obj, r, c, i, lbl)
            subplot(r,c,i);
            plot(obj.t,obj.wave);
            xlabel(lbl);
            axis([min(obj.t), max(obj.t), utils.getsetMinValue, utils.getsetMaxValue]), grid;
        end

        function [] = dplt(obj, r, c, i, lbl)
            t1 = min(obj.t):1:max(obj.t);
            y1 = zeros(size(t1));

            for ii = min(t1):max(t1)
                y1(ii+1) = obj.wave((ii+1)*(1000/obj.sample_rate)-(1000/obj.sample_rate)+1);
            end
               
            subplot(r,c,i);
            stem(t1,y1);
            xlabel(lbl);
            axis([min(obj.t), max(obj.t), utils.getsetMinValue, utils.getsetMaxValue]), grid;
        end 


    end


    methods (Access = private)
        function res = update(obj)

            y=zeros(size(obj.t));
            for row = 1:length(obj.f)
                y = y + real(obj.A(row) * exp(1i*2*pi*obj.f(row)*obj.t));
            end
            obj.wave = y;
            res = obj;


            utils.getsetMaxValue(max(y));
            utils.getsetMinValue(min(y));
        end
    end
end

