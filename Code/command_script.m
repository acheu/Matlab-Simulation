% Main Command Script

% This create a physical layer simulation of nodes communicating with a
% gateway(s). For now, no Network layer is added

clear

noNodes   = 5; %How many nodes do you want
noGate    = 1; %Of the nodes, how many are Gateways
size      = [10,10]; %meters by meters in 2-D Plane
freq      = 5.8e9; %Hz, frequency of communication

d.size = size; d.freq =  freq; 
fid = figure(1);
axis([0,size(1),0,size(2)]);
hold on 
guidata(fid,d); 

d.nodes = node_A(noNodes-noGate); %Generate nodes w/ A properties and locs 
d.gates = gateway_A(noGate); %Generates gateways with A properties and locs

guidata(fid, d);

n = cell2mat(d.nodes); 
nloc = n.loc;
g = cell2mat(d.gates);
gloc = g.loc; 

% scatter(nloc,'or')
% scatter(gloc,'*b')

% legend('Node', 'Gateway')
hold off