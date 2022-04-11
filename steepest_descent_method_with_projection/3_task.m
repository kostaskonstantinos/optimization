syms x y g
f1=@(x,y) (1/2*x^2+1/2*y^2);
dfdx=diff(f1,x);
dfdy=diff(f1,y);
efinish=0.02;
X=1:100;
Y=1:100;
X(1)=-5;
Y(1)=7;
k=1;
plot(X(k),Y(k),'o');
hold on
if X(1)>10
    X(1)=10;
end
if X(1)<-20
    X(1)=-20;
end
if Y(1)>15
    Y(1)=15;
end
if Y(1)<-12
    Y(1)=-12;
end
plot(X(1),Y(1),'o');
hold on
while sqrt((subs(dfdx,[x,y],[X(k),Y(k)]))^2+(subs(dfdy,[x,y],[X(k),Y(k)])^2))>= efinish
    A=-subs(dfdx,[x,y],[X(k),Y(k)]);
    B=-subs(dfdy,[x,y],[X(k),Y(k)]);
    dx=@(g) X(k)+g*A;
    dy=@(g) Y(k)+g*B; 
    gk=0.3;
    sk=20;
   R(k)=dx(sk);
    if R(k)>10
        R(k)=10;
    end
    if R(k)<-20
         R(k)=-20;
    end
  L(k)=dy(sk);
     if L(k)>15
        L(k)=15;
    end
    if L(k)<-12
         L(k)=-12;
    end
    X(k+1)=X(k)+gk*(R(k)-X(k));
     Y(k+1)=Y(k)+gk*(L(k)-Y(k));
    plot(X(k),Y(k),'o');
     k=k+1;
    hold on
end