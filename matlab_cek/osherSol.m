function [xi,u] = osherSol(ul,ur,xileft,xiright)
dxi = (xiright - xileft) / 1000.0
xi = [xileft:dxi:xiright];
if ul < ur
lb=ul
ub=ur
else
lb = ur
ub = ul
end
for i=1:length(xi)
  [u(i),G(i)]=fminbnd(@osherFuncvg,lb,ub,optimset('TolX',0.00001,'TolFun',0.00001),xi(i),ul,ur);
end