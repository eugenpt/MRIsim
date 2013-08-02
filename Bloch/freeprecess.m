function [Afp,Bfp] = freeprecess(t,T1,T2,df)

  Afp = diag([exp(-t/T2) exp(-t/T2) exp(-t/T1)])*zrot(2*pi*t*df);
  Bfp = [0 0 1-exp(-t/T1)]';

