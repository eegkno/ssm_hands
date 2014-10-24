% Shows the passed set of shapes in the passed figuref

function showShapes(schizo, fig, axisVec)

[ncords, npoints, nshapes] = size(schizo);

colors = 'bgrcmyk';
figure(fig); colormap(gray); set(gcf,'DoubleBuffer','On'); clf; axis(axisVec);
for patient=1:nshapes
   hold on;
   %get x,y points for one patient
   xpts = schizo(1,:,patient);
   ypts = schizo(2,:,patient);
   hold on;
   plot(xpts,ypts,sprintf('%c-*',colors(mod(patient,length(colors))+1)));
   hold off;
end

return;
