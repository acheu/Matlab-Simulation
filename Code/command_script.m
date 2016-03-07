% Main Command Script 2/25/16

% This create a physical layer simulation of nodes communicating with a
% gateway(s). For now, no Network layer is added
close all
clear

presetLoc = 'C:\Users\Owner\Documents\GitHub\Matlab-Simulation\presets\'; %file location of preset node arrangements

%% Parameters
loadPredetermined     = 1; %If True, the parameters below are superceded by a loaded-in file. 
    presetFile        = '3x3_grid_5.txt'; %File to load in formatted via the README
noNodes               = 60; %How many nodes do you want
noGate                = 1; %How many are Gateways BTW: ONLY SET AS 1
size                  = [10,10]; %meters by meters in 2-D Plane
freq                  = 5.8e9; %Hz, frequency of communication
height                = 1; %Meters, height off the ground
algo                  = 'SPIN'; %protocols; SPIN, DDiff 

bufferLimit           = 10; %How many entries into buffer before Node overflows
pPacket               = .6; %Probatility of missing whole packet

graphType             = 1; %1: Simple, 2: Path graph

fid = figure(1); 

%% Creation of Nodes
if loadPredetermined % Load in predetermined 
    d.freq = freq; d.height = height; 
    filID = fopen([presetLoc,presetFile]);
    lnread = fscanf(filID,'r'); 
    lineRE = ''; 
    parseitt = -1; 
    d.size = [0,0]; %just to instatiate the var
    
    while 1 %%This loop just processes and sorts the data in the text file
        lineRE = fgetl(filID);
        if isempty(lineRE)
            continue
        elseif lineRE < 0
%             disp('ending...')
            break
        else
            [point1, point2] = strtok(lineRE,',');
            point = [str2double(point1), str2double(point2(2:end))]; 
%             disp(point)

            if parseitt == -1
                d.size = point; 
                parseitt = parseitt + 1; 
            elseif parseitt == 0
                d.gates(1) = gateway_A(1,point);
%                 gates{1}.loc = point; 
%                 d.gates{1} = gates; 
                parseitt = parseitt + 1; 
            elseif parseitt > 0
                d.nodes(parseitt) = node_A(parseitt,point); 
%                 nodes{1}.loc = point; 
%                 disp('yo')
%                 d.nodes{parseitt} = nodes; 
                parseitt  = parseitt + 1;
            end
        end
        
    end
    d.noGate = 1; %I'm just presetting number of gates to 1 always
    d.noNodes = parseitt - 1; 
    axis([0,d.size(1),0,d.size(2)]);
    hold on 
    fclose(filID);
    guidata(fid,d); 

else % Randomize locations based on parameters
    d.size = size; d.freq =  freq; d.height = height; d.noNodes = noNodes; d.noGate = noGate; 
    axis([0,size(1),0,size(2)]);
    guidata(fid,d); 
    hold on 

    d.nodes = node_A(noNodes); %Generate nodes w/ A properties and locs 
    d.gates = gateway_A(noGate); %Generates gateways with A properties and locs
    d.nodes = randLoc(d.nodes); %randomizes their locations on the plane given by the params
    d.gates = randLoc(d.gates);
    guidata(fid, d);
end

%% Networking
physicalLayer(); d = guidata(fid); 
err = networkLayer(algo); 
if ~isempty(err), disp(err), end

%% Graphing

if graphType == 1
   simpleGraph(); %Graph that plots nodes by loc and shows if successfull communication
elseif graphType == 2
   pathGraph();  %Graph that shows the flow of data from node to node to gateway
else
   disp('ERROR: Graph type unspecified'); 
end 

hold off