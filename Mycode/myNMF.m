function [W,H,xr] = myNMF(S,r,i)
M = abs(S);
A = angle(S);
W = rand([size(M,1) r]);
H = rand([r size(M,2)]);
  for n = 1:i
   
%     dH = W'*(W*H - S);
%     H = H - mu*dH;
%     dW = (W*H-S)*H';
%     W = W - mu*dW;
%     W = abs(W);
%     H = abs(H);

    H = H.*((W'*M)./(W'*W*H));
    W = W.*(M*H')./(W*H*H');
   
  end
  
  Sr = W*H;
  Sr = Sr.*exp(1i*A);
  xr = istft(Sr);