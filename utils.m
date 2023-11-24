%Author: Mustafa Ali #372704
%This class is made to reduce redundancy and help the user better
%understand signal processing. Will be regularly updated and optimised

classdef utils

    properties
        rows = 1;
        cols = 1;
    end

    methods

        %init
        function obj = utils(row,col)
            obj.rows = row;
            obj.cols = col;
        end
    
        %% Plot
        function [] = plot(obj, x, y, i, lbl)
            subplot(obj.rows,obj.cols,i);
            plot(x,y);
            xlabel(lbl);
            axis([min(x) max(x) abs(min(y))*-1.1 max(y)*1.1]), grid;
        end

        % Simple Plot
        function [] = splot(obj, y,i, lbl)
            subplot(obj.rows,obj.cols,i);
            plot(y);
            xlabel(lbl);
            %axis([min(x) max(x) abs(min(y))*-1.1 max(y)*1.1]), grid;
        end

        % Fourier Plot
        function [] = fplot(obj, x, y, i, lbl)
            [y_pks,t] = findpeaks(y,x);
            subplot(obj.rows,obj.cols,i);
            stem(x,y);
            xlabel(lbl);
            axis([min(x) t(end)*2 abs(min(y))*-1.1 max(y)*1.2]), grid;
            %set(gca,'XTick',0:pi/2:2*pi);
            %set(gca,'XTickLabel',{'0','pi/2','pi','3pi/2','2pi'});
        end

        %% Stem
        function [] = stem(obj, x, y, i, lbl)
            subplot(obj.rows,obj.cols,i);
            stem(x,y);
            xlabel(lbl);
            axis([min(x) max(x) abs(min(y))*-1.1 max(y)*1.1]), grid;
        end 

        %% Find Time Period
        function res = getPeriod(obj, t,y)
            [y_pks,x] = findpeaks(y,t);

            flag=0;
            for i = 1:length(x)
                if flag == 0 && max(y) == y_pks(i)
                    flag=1;
                    t1 = i;
                elseif flag == 1 && max(y) == y_pks(i)
                    res = x(i)-x(t1);
                    return;
                end
            end
            res = "wave too small";
        end

        %% Get Coefficients
        function [k,mag,ph] = getCoefficients(~, signal)
            k = 0:N-1;
            ak = zeros(1,9);
            temp=0;
            for ii=k
                for n = 1:N*100
                    temp = temp + signal(n) * exp(-1j*(2*pi/N)*ii*n);
                end
                temp = temp/N;
                ak(ii+1) = temp;

                if ii==0
                    ak(ii+1) = abs(temp/N);
                end
                temp=0;
            end
            mag = abs(ak);
            ph = angle(ak);
        end   

        %% Fourier
        function [res_y, res_t] = ft(~, t, y)
            N = length(t)-1;
            FS = N/max(t);            
              
            res_y = round(2*abs(fft(y))/N);
            res_y = res_y(1:N/2);

            res_t = FS*(0:N/2-1)/N;
        end   
    
    end
end
