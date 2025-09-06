% Julian Chaoul 
 
funh = @(t,y) -y^2 + 2*y;

tspan = [0 4];
initialConditions = 0:1:3;
teven = 0:0.05:4;

figure; 
for ii = initialConditions
    [t,y] = ode45(funh,tspan,ii);
    plot(t,y,'k-');
    hold on; 
    
end
xlabel('Time');
ylabel('y');
title('Solutions');

%% Part 1
funh = @(t,y) -y^2 + 2*y;

figure; 
tspan = [0 4];
initialConditions = 1;
teven = 0:0.05:4;
[t,y] = ode45(funh,tspan,initialConditions);
yeven = interp1(t,y,teven);
plot(teven,yeven,'kx');
xlabel('Time');
ylabel('y');
title('Solutions');

% vect will be the placeholder of the exact values 
vect = zeros(size(teven));
for ii = 1 : length(vect)
    vect(ii) = 1 / (.5 + (.5*exp(-2*teven(ii)))); 
end
disp(vect);

error = abs(yeven - vect);
figure;
plot(teven, error);
xlabel('Time');
ylabel('Error');
title('Error Graph');

options = odeset('RelTol',1e-7);
[t, y] = ode45(funh, tspan, 1, options);
newYinterp = interp1(t, y, teven);
newError = abs(newYinterp - vect);
figure; 
plot(teven,newError);
xlabel('Time');
ylabel('Error');
title('Error with Reduced Tolerance');

%% solution to ODE  = C1 + C2e^-2t - t 
funh = @(t,y) [y(2); -2*y(2) - 2*y(1)];
y0 =[0;1];
tspan = [0 5];
[t, y] = ode45(funh, tspan, y0);


figure;
plot(t, y(:,1),'m');
hold on; 
plot(t, y(:,2),'b');
xlabel('Time');
ylabel('Solution');
title('2y'' + 2y + 2 = 0');

teven = 0:0.05:5;
yeven = interp1(t,y(:,1),teven);
zeven = interp1(t,y(:,2),teven);
yexact = 1*exp(-2*teven) - teven;

error = abs(yeven - yexact);
figure;
plot(teven, error, 'k');
xlabel('t');
ylabel('Error');

figure; 
plot(y(:,1),y(:,2)','k');
xlabel('y');
ylabel('z');
title('Phase Diagram');








