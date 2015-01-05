% Shows the passed set of shapes in the passed figuref

function showShapes2(T_k, fig, axisVec)

[nshapes, npoints ] = size(T_k);

colors = 'bgrcmyk';
figure(fig); colormap(gray); set(gcf,'DoubleBuffer','On'); clf; axis(axisVec);
for i=1:nshapes
   hold on;
   %get x,y points for one i
   X = reshape(T_k(i,:), [56 2]); 
   xpts = X(:,1);
   ypts = X(:,2);
   hold on;
   plot(xpts,ypts,sprintf('%c-*',colors(mod(i,length(colors))+1)));
   hold off;
end

return;
