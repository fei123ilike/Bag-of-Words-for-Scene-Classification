% random ponits
a = imread('sun_abslhphpiejdjmpz.jpg');
b = getRandomPoints(a, 500);
x = b(:,1);
y = b(:,2);
sz = 5;
figure
imshow(a);
hold on;
scatter(y,x,sz,'b');

% harris ponits

c = imread('sun_afbxsdfksjhcunpb.jpg');
d = getHarrisPoints(c, 1000, 0.06);
x = d(:,1);
y = d(:,2);
sz = 5;
figure
imshow(c);
 hold on;
scatter(y,x,sz,'r');
