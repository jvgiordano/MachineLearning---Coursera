% Week 2 - Stanford Machine Learning
% Tutorial
% By: Jonny Giordano
% March 16, 2019

%% Plotting Review
t = [0:0.01:0.98];
y1 = sin(2*pi*4*t);
y2 = cos(2*pi*4*t);
plot(t, y1);
hold on
plot(t,y2,'r');
legend('sin', 'cos')
title('My Plot')
print -dpng 'myplot.png'
hold off

figure(2)
subplot(1,2,1) %Divides plot in 1x2 grid, access first element
plot(t, y1)
subplot(1,2,2)
plot(t, y2)

figure(3)
A = magic(5);
imagesc(A)
colorbar, colormap gray;

%% Control Statement Review

for i = 1:10
    v(i) = 2^i;
end

i = 1;
while i <= 5
    v(i) = 100;
    i = i + 1;
end

i = 1;
while true
    v(i) = 999;
    i = i+1;
    if i == 6
        break
    end
end


%% Quiz

A = ones(10,10);
x = 2*ones(10,1);

v = zeros(10, 1);
for i = 1:10
  for j = 1:10
    v(i) = v(i) + A(i, j) * x(j);
  end
end

