function [in,out] = genParityData(numBits)
    
    in = [];
    out = [];
    val = 1;

    while true
        for i = 1:numBits
            in(i,val) = bitget(val,i); %#ok<*AGROW>
        end

        colSum = sum(in(:,val));
        if mod(colSum, 2) == 0
           out(1,val) = 1;
        else
           out(2,val) = 1;
        end

        if colSum == numBits; break; end
        val = val + 1;
    end
end