%% ANDREA CASTRONOVO --- 15/12/2021 ---------------------------------------

%% Script to test addppath and genpath

p = genpath('TestPathFunction'); %create a folder path to add call function
addpath(p);

[A,B] = TestFunction(10,20)

rmpath(p);