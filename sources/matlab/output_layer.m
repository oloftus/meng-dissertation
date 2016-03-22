function y = output_layer(biases,weights,hidden)
    Q = size(hidden,2);

    function a = softmax_apply(n)
      nmax = max(n,[],1);
      n = bsxfun(@minus,n,nmax);
      numer = exp(n);
      denom = sum(numer,1); 
      denom(denom == 0) = 1;
      a = bsxfun(@rdivide,numer,denom);
    end

    y = softmax_apply(repmat(biases,1,Q) + weights*hidden);
end