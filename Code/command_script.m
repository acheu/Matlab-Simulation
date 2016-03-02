% Main Command Script 2/25/16

% This create a physical layer simulation of nodes communicating with a
% gateway(s). For now, no Network layer is added
close all
clear

%% Parameters
loadPredetermined     = false; %If True, the parameters below are superceded by a loaded-in file. 
noNodes               = 60; %How many nodes do you want
noGate                = 1; %Of the nodes, how many are Gateways BTW: ONLY SET AS 1
size                  = [10,10]; %meters by meters in 2-D Plane
freq                  = 5.8e9; %Hz, frequency of communication
height                = 1; %Meters, height off the ground
algo                  = 'SPIN'; %protocols; SPIN, DDiff 

%% Creation of Nodes
if loadPredetermined % Load in predetermined 
    d.nodes = node_A(noNodes-noGate); %Generate nodes w/ A properties and locs 
    d.gates = gateway_A(noGate); %Generates gateways with A properties and locs
    
else % Randomize locations based on parameters
    d.size = size; d.freq =  freq; d.height = height; 
    fid = figure(1);
    axis([0,size(1),0,size(2)]);
    hold on 
    guidata(fid,d); 

    d.nodes = node_A(noNodes-noGate); %Generate nodes w/ A properties and locs 
    d.gates = gateway_A(noGate); %Generates gateways with A properties and locs
    d.nodes = randLoc(d.nodes); %randomizes their locations on the plane given by the params
    d.gates = randLoc(d.gates);
end

%% Networking

guidata(fid, d);

physicalLayer(); d = guidata(fid); 
err = networkLayer(algo); 
if ~isempty(err), disp(err), end

%% Graphing
% The following is a basic graph that displays all the nodes that ARE and
% ARE NOT able to communicate 

for itt1 = 1:noNodes-noGate
    if strcmp(d.nodes{itt1}.receive,'NO')
        scatter(d.nodes{itt1}.loc(1),d.nodes{itt1}.loc(2),'rx')
    else
        scatter(d.nodes{itt1}.loc(1),d.nodes{itt1}.loc(2),'ro')
    end
end

for itt2 = 1:noGate
    scatter(d.gates{itt2}.loc(1),d.gates{itt2}.loc(2),'b')
end

hold off