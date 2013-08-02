function Mss = sssignal(flip,T1,T2,TE,TR,dfreq)

  [A_te, B_te] = freeprecess(TE,T1,T2,dfreq);
  [A_tr, B_tr] = freeprecess(TR-TE,T1,T2,dfreq);

  flipM = yrot(flip);

% Mss = A_te*flipM*(A_tr*Mss + B_tr)+B_te
%
% (eye(3) - A_te*flipM*A_tr)*Mss = A_te*flipM*B_tr + B_te

Mss = inv(eye(3) - A_te*flipM*A_tr) * (A_te * flipM * B_tr + B_te);
