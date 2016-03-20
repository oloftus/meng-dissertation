
layers = [5,5];
numBits = 3;

[in,out] = genParityData(numBits);
net = patternnet(layers,'trainrp');
net.inputs{1}.processFcns = {'removeconstantrows'};
net.layers{1}.transferFcn = 'logsig';
net.layers{2}.transferFcn = 'logsig';
tNet = train(net, in, out);
genFunction(tNet,'net','MatrixOnly','yes')
