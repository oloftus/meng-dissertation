
layers = [5,5];
numBits = 3;

[in,out] = genParityData(numBits);
net = patternnet(layers,'trainrp');
tNet = train(net, in, out);
genFunction(tNet,'net','MatrixOnly','yes')
