%This file is used to test the positioning() function against randomly
%generated function inputs: length and width

%Defining input ranges
length = round(rand()*9)+1;
width = round(rand()*1)+1;

%Placing input into function and displaying function output
disp(positioning(width,length))
