syms x y g
f1=@(x,y)(x^3)*exp(-(x^2)-(y^4));
dfdx=diff(f1,x);
fxx=diff(dfdx,x);
fxy=diff(dfdx,y);
dfdy=diff(f1,y);
fyx=diff(dfdy,x);
fyy=diff(dfdy,y);
jac=[fxx fxy;fyx fyy];
help=[dfdx;dfdy];
efinish=0.01;
X=1:100;
Y=1:100;
X(1)=-1;
Y(1)=-1;
k=1;
plot(X(1),Y(1),'o');
hold on
M=0.5;
contains_negative=false;
while sqrt((subs(dfdx,[x,y],[X(k),Y(k)]))^2+(subs(dfdy,[x,y],[X(k),Y(k)])^2))>= efinish
   eigjac=eig(subs(jac,[x,y],[X(k),Y(k)]));
   contains_negative = any(eigjac<0);
   if contains_negative==true
   M=min(eigjac);
  end
   mk=-M+0.5;
   help1=(subs(jac,[x,y],[X(k),Y(k)])+mk*eye(2));
   help2=(subs(help,[x,y],[X(k),Y(k)]));
   dk=inv(help1)*(-help);
    A=-subs(dfdx,[x,y],[X(k),Y(k)]);
    B=-subs(dfdy,[x,y],[X(k),Y(k)]);
    f2=@(g) f1(dx(g),dy(g));
   dmin=3;
   dx=@(g) X(k)+g*A;
   dy=@(g) Y(k)+g*B; 
    %f2=@(g) f1(dx(g),dy(g));
    %dmin=fminsearch(f2,0);
    X(k+1)=dx(dmin);
    Y(k+1)=dy(dmin);
    k=k+1;    
    plot(X(k),Y(k),'o');
    hold on
end