%% B-1

M = [0 0 1]';

%% B-1a

T1 = .600;
T2 = .100;
TE = .001;

M1_imm = yrot(pi/3)*M;

[A_te B_te] = freeprecess(TE,T1,T2,0);

M1 = A_te*M1_imm + B_te

%% B-1b

TR = .500;

[Afp, Bfp] = freeprecess(TR-TE,T1,T2,0);

M2_pre = Afp*M1 + Bfp;
M2_imm = yrot(pi/3)*M2_pre;

M2 = A_te*M2_imm+B_te


%% B-1c

dt = .001;

A_dt = A_te; B_dt = B_te;

Tmax = 5;

times = .000:.001:Tmax;
angles = zeros(size(times));
for j=0:floor(Tmax/TR)
  angles(2+j*floor(TR/dt)) = pi/3;
end;

Mt=zeros(3,length(times));
Mt(:,1) = M;

for j=2:length(times)
  Mt(:,j) = A_dt*Mt(:,j-1)+B_dt;
  Mt(:,j) = yrot(angles(j))*Mt(:,j);
end;

figure;
plot(times,Mt(1,:),times,Mt(2,:),times,Mt(3,:));
legend({'M_x','M_y','M_z'});


%% B-1d

% Mss = A_fp*(A_te*yrot(pi/3)*Mss+B_te)+B_fp
%
% (1-A_fp*A_te*yrot(pi/3))*Mss = A_fp*B_te+B_fp

Mss = (eye(3)-Afp*A_te*yrot(pi/3))^-1 * (Afp*B_te + Bfp)

%% B-1e

Mss = sssignal(pi/3,.600,.100,.001,.500,0)

%% B-1f and B-1g - why would I do that?

%% B-2


