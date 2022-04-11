syms x y g
f1=@(x,y)(x^3)*exp(-(x^2)-(y^4));
dfdx=diff(f1,x);
fxx=diff(dfdx,x);
fxy=diff(dfdx,y);
dfdy=diff(f1,y);
fyx=diff(dfdy,x);
fyy=diff(dfdy,y);
jac=[fxx fxy;fyx fyy];
invjac=inv(jac);
help=[dfdx;dfdy];
dk=-invjac*help;
efinish=0.0001;
X=1:100;
Y=1:100;
X(1)=-1;
Y(1)=-1;
k=1;

plot(X(1),Y(1),'o');
hold on
while sqrt((subs(dfdx,[x,y],[X(k),Y(k)]))^2+(subs(dfdy,[x,y],[X(k),Y(k)])^2))>= efinish
    A=subs(dk(1),[x,y],[X(k),Y(k)]);
    B=subs(dk(2),[x,y],[X(k),Y(k)]);
    dx=@(g) X(k)+g*A;
    dy=@(g) Y(k)+g*B; 
    f2=@(g) f1(dx(g),dy(g));
    dmin=fminsearch(f2,0);
   % dmin=1.1;
    k=k+1;
    X(k)=dx(dmin);
    Y(k)=dy(dmin);
    plot(X(k),Y(k),'o');
    hold on
end