clc; close all;
utils.reset();

CMS_1 = [0 6 1 6];
CMS_2 = [6 1 9 1];

w = Wave(CMS_1,CMS_2, zeros(size(CMS_2)));
w.sample_rate = 9;

w.plt(2,1,1, "continuos");
w.dplt(2,1,2, "discrete");



