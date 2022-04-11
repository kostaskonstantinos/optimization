syms x y g
f1=@(x,y) (1/2*x^2+1/2*y^2);
dfdx=diff(f1,x);
dfdy=diff(f1,y);
efinish=0.01;
X=1:100;
Y=1:100;
X(1)=8;
Y(1)=3;
k=1;

plot(X(1),Y(1),'o');
hold on
while sqrt((subs(dfdx,[x,y],[X(k),Y(k)]))^2+(subs(dfdy,[x,y],[X(k),Y(k)])^2))>= efinish
    A=-subs(dfdx,[x,y],[X(k),Y(k)]);
    B=-subs(dfdy,[x,y],[X(k),Y(k)]);
    dx=@(g) X(k)+g*A;
    dy=@(g) Y(k)+g*B; 
    %f2=@(g) f1(dx(g),dy(g));
    %dmin=fminsearch(f2,0);
   dmin=0.1;
    k=k+1;
    X(k)=dx(dmin);
    Y(k)=dy(dmin);
    plot(X(k),Y(k),'o');
    hold on
end