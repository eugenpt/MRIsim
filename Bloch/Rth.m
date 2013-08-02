% rotation matrix for a phi-rotation around axis y=x*tg(theta)
% http://www-mrsrl.stanford.edu/~brian/bloch/ says that
% It's easy to write is just as
%   Rth = Rz(theta)*Rx(phi)*Rz(-theta), which is quite logical

function R = Rth(phi,theta)
  R = zrot(theta)*xrot(phi)*zrot(-theta);
