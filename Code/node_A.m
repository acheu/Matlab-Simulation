% dummy A type node. A types are the prototype node to test the physical
% layer construction 

function [n] = node_A (params, varargin)
    
    bufferLimit = params; 
    
    if length(varargin) == 1
        n = cell(1,varargin{1});
    %     data = guidata(gcf()); 

        for itt1 = 1:varargin{1}
            n{itt1}.type    = ['A node: ', num2str(itt1)]; %type of node
            n{itt1}.loc     = [0,0]; %Location is set elsewhere, either randLoc.m or loaded in a predetermined   
            n{itt1}.pow     = 0; %dBm ERP
            n{itt1}.data    = 100*rand(); %Random data from 0 to 100
            n{itt1}.receive = 0; %Boolean if the gateway has received the packet
            n{itt1}.sensitivity = -50; %dBm
            n{itt1}.buffer  = bufferSetup(n{itt1}.data, bufferLimit); %buffer, limit is set in params
            n{itt1}.memory  = []; %memory of data transmited
        end 
    end
    if length(varargin) == 2
            n{1}.type    = ['A node: ', num2str(varargin{1})]; %type of node
            n{1}.loc     = varargin{2}; %Location is set elsewhere, either randLoc.m or loaded in a predetermined   
            n{1}.pow     = 0; %dBm ERP
            n{1}.data    = 100*rand(); %Random data from 0 to 100
            n{1}.receive = 0; %boolean if the gateway has received the packet
            n{1}.sensitivity = -50; %dBm
            n{1}.buffer   = bufferSetup(n{1}.data, bufferLimit); 
            n{1}.memory  = []; %Empty memory 
    end
end

function[buffer] = bufferSetup(seed, bL)
    buffer = zeros(bL,1); 
    buffer(1) = seed; 
end