% http://www-mrsrl.stanford.edu/~brian/bloch/

%% A-1

M = [1 0 0]';

%% A-2

T2 = .100;

t = .050;

M1 = diag([exp(-t/T2) exp(-t/T2) 1])*M

%% A-3

T1 = .600;

A3 = diag([exp(-t/T2) exp(-t/T2) exp(-t/T1)]);
B3 = [0 0 1-exp(-t/T1)]';

M1 = A3*M + B3


%% A-4

Rth(pi/4,pi/6)

%% A-5

[Afp,Bfp] = freeprecess(.001,.600,.100,10);

M = [1 0 0]';

ts = [1:1000];
Mt = zeros(3,length(ts));
Mt(:,1) = M;

for j=2:length(ts)
  Mt(:,j) = Afp*Mt(:,j-1)+Bfp;
end;

figure;
plot(ts,Mt(1,:),ts,Mt(2,:),ts,Mt(3,:));
legend({'Mx','My','Mz'});
