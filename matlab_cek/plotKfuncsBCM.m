S=[0.0:0.001:1.0];
global lambda
dlambda = 1.0;
clear klambdas
for i=1:4
  lambda = 0.1 + i*dlambda - 1.0;
  klambdas(i,:) = sprintf('k_{rw}--\\lambda =%1.2f',lambda);
  klambdas(i+4,:) = sprintf('k_{rn}--\\lambda =%1.2f',lambda);
  s(i,:) = S;
  s(i+4,:) = S;
  kr(i,:) = krwBCM(S);
  kr(i+4,:) = krnBCM(S);
end
figure(1)
plot(s',kr')
title('Brooks - Corey - Mualem Permeability');xlabel('S');ylabel('k_r')
legend(klambdas(1,:),klambdas(2,:),klambdas(3,:),klambdas(4,:),klambdas(5,:),klambdas(6,:),klambdas(7,:),klambdas(8,:))
figure(2)
clear flambdas
for i=1:4
   lambda = 0.1 + i*dlambda - 1.0;
   sf(i,:) = S;
   flambdas(i,:) = sprintf('\\lambda =%1.2f',lambda);
   fng(i,:) = krwBCM(S) ./ (krwBCM(S) + krnBCM(S));
end
plot(sf',fng')
title('Brooks - Corey - Mualem Flux, v=1, g=0 ');xlabel('S');ylabel('f')
legend(flambdas(1,:),flambdas(2,:),flambdas(3,:),flambdas(4,:))
figure(3)
clear flambdas
for i=1:4
   lambda = 0.1 + i*dlambda - 1.0;
   sf(i,:) = S;
   flambdas(i,:) = sprintf('\\lambda =%1.2f',lambda);
   fg(i,:) = (krwBCM(S).*krnBCM(S)) ./ (krwBCM(S) + krnBCM(S));
end
plot(sf',fg')
title('Brooks - Corey - Mualem Flux, v=0, g=1 ');xlabel('S');ylabel('f')
legend(flambdas(1,:),flambdas(2,:),flambdas(3,:),flambdas(4,:))
