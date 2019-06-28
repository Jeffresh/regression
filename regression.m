
%% Ejercicio1 
% a) Parece que hay cierta tendencia a una relación lineal
x = [ 90 86 67 89 81 75]; % frecuencia cardiaca
y = [62 45 40 55 64 53]; % peso
figure,plot(x,y,'r.');
axis([ 0 200, 0 1000]); 

%% Ejercicio1  
% b) Interpretación: la solución no es adecuada, no es precisa, aunque al menos
% describe que la relación entre las variables es proporcional.

x = [ 90 86 67 89 81 75]; % frecuencia cardiaca
y = [62 45 40 55 64 53]; % peso



Sxx=sum(x.*x); Sx=sum(x);
Sxy=sum(x.*y); Sy=sum(y);
n=length(x);
A=[Sxx Sx; Sx n]; b=[Sxy Sy]';
sol=A\b
figure, plot (x,y,'o'); hold on;
axis([0 180 0 150]);
xr=[0 180];

yr=[sol(2) sol(1)*180+sol(2)];
plot (xr,yr); hold off;
E=sum((y-(sol(1)*x+sol(2))).^2);
%% Ejercicio1 
%c) a disminuye de forma poco significativa y b aumenta de forma
%considerable. El error total se vuelve menor.

x = [90 86 89 81 75]; % frecuencia cardiaca
y = [62 45 55 64 53]; % peso

Sxx=sum(x.*x); Sx=sum(x);
Sxy=sum(x.*y); Sy=sum(y);
n=length(x);
A=[Sxx Sx; Sx n]; b=[Sxy Sy]';
sol=A\b
figure, plot (x,y,'o'); hold on;
axis([0 180 0 150]);
xr=[0 180];
yr=[sol(2) sol(1)*180+sol(2)];
plot (xr,yr); hold off;
E=sum((y-(sol(1)*x+sol(2))).^2);

%% Ejercicio 1
%d) para un peso de 88 kg se estima que tengas 57 pulsaciones por minuto.

x = [ 90 86 67 89 81 75]; % frecuencia cardiaca
y = [62 45 40 55 64 53]; % peso

Sxx=sum(x.*x); Sx=sum(x);
Sxy=sum(x.*y); Sy=sum(y);
n=length(x);
A=[Sxx Sx; Sx n]; b=[Sxy Sy]';
sol=A\b
figure, plot (x,y,'o'); hold on;
axis([0 180 0 150]);
xr=[0 180];
yr=[sol(2) sol(1)*180+sol(2)];
plot (xr,yr); 
E=sum((y-(sol(1)*x+sol(2))).^2);

y_estimada = sol(1)*88+sol(2);

plot(88,y_estimada,'gx'); hold off

%% e) No debido a que cuanto mas lejano esté el valor de x respecto nuestros datos, mas grande será el error,
%ya que se irá sumando.


%% f) Se aproxima mejor a los datos que la lineal, el error disminuye.

x = [ 90 86 67 89 81 75]; % frecuencia cardiaca
y = [62 45 40 55 64 53]; % peso

x2=x.*x;
Sxxxx = sum(x2.*x2);Sxxx= sum(x2.*x); 
Sxxy = sum(x2.*y);
Sxx=sum(x.*x); Sx=sum(x);
Sxy=sum(x.*y); Sy=sum(y);
n=length(x);
A=[Sxxxx Sxxx Sxx;Sxxx Sxx Sx; Sxx Sx n]; b=[Sxxy Sxy Sy]';
sol=A\b;
figure, plot (x,y,'o'); hold on;
axis([0 180 0 150]);

yr= sol(1)*xr.^2 + sol(2)*xr+sol(3);

plot (xr,yr); hold off;

E=sum((y-(sol(1)*x.^2+sol(2)*x+sol(3))).^2);

%% g) Se ajusta la curva aún mas a nuestros datos, el error a disminuido de forma considerable.

x = [ 90 86 67 89 81 75]; % frecuencia cardiaca
y = [62 45 40 55 64 53]; % peso

x2=x.*x;
x3 = x2.*x;

Sxxxxxx = sum(x3.*x3);
Sxxxxx = sum( x2.*x3); Sxxxy = sum(x3.*y);
Sxxxx = sum(x2.*x2);Sxxx= sum(x2.*x); 
Sxxy = sum(x2.*y);
Sxx=sum(x.*x); Sx=sum(x);
Sxy=sum(x.*y); Sy=sum(y);
n=length(x);
A=[Sxxxxxx Sxxxxx Sxxxx Sxxx ;Sxxxxx Sxxxx Sxxx Sxx;Sxxxx Sxxx Sxx Sx; Sxxx Sxx Sx n]; b=[Sxxxy Sxxy Sxy Sy]';
sol=A\b;
figure, plot (x,y,'o'); hold on;
axis([0 180 0 150]);
xr= linspace(0 ,180);

yr = sol(1)*xr.^3 + sol(2)*xr.^2 + sol(3)*xr +sol(4);

plot (xr,yr); hold off;

E=sum((y-(sol(1)*x.^3 + sol(2)*x.^2 + sol(3)*x +sol(4))).^2);

%% h) 

x = [90 86 67 89 81 75]'; % frecuencia cardiaca
y = [62 45 40 55 64 53]'; % peso

y = 1./(y.*y);

% cambio de variable en los datos
yp=log(y);
% solucion del problema lineal
A = [x ones(size(x))];
sol = inv(A'*A)*(A'*yp);
B=sol(1); C=sol(2);
% calculamos los parámetros de la exponencial
A=exp(C);
plot (x,y,'o');
axis([0 180 0.0001 0.001 ]); hold on;
xp = linspace(0,180);
plot (xp,A*exp(B*xp),'r'); hold off;

E = sum(( y-(A*exp(B*x))).^2);



%% i)

x = [67 75 81 86 89 90]';
y = [40 53 64 45 55 62]';

x2 = x/100;
y2 = 3*x2.*exp(2*x2);


% cambio de variable en los datos
yp=log(y2./x2);

% solucion del problema lineal
A = [x2 ones(size(x2))];
sol = inv(A'*A)*(A'*yp);
B=sol(1); C=sol(2);
% calculamos los parámetros de la exponencial
A = exp(C);
xp = linspace(0 ,1);
plot (x2,y2,'o');
axis([0 1 7 17 ]); hold on;
plot(xp,A*xp.*exp(B*xp),'r'); hold off;

E = sum((y-(A*x.*exp(B*x))).^2);


%% Ejercicio 2 a)

%b)

x = [90 86 67 89 81 75]; % frecuencia cardiaca
y = [62 45 40 55 64 53]; % peso

coeff = polyfit(x,y,1);
plot (x,y,'o'), hold on;
axis([0 180 0 150]);
xp= linspace(0 ,180);
plot(xp,polyval(coeff,xp));
hold off;

%% f)

x = [90 86 67 89 81 75]; % frecuencia cardiaca
y = [62 45 40 55 64 53]; % peso

coeff = polyfit(x,y,2);
plot (x,y,'o'), hold on;
axis([0 180 0 150]);
xp= linspace(0 ,180);
plot(xp,polyval(coeff,xp));
hold off;

%% g)

x = [90 86 67 89 81 75]; % frecuencia cardiaca
y = [62 45 40 55 64 53]; % peso

coeff = polyfit(x,y,3);
plot (x,y,'o'), hold on;
axis([0 180 0 150]);
xp= linspace(0 ,180);
plot(xp,polyval(coeff,xp));
hold off;

%% h)

x = [67 75 81 86 89 90]';
y = [40 53 64 45 55 62]';



y = 1./(y.*y);

yp=log(y);


coeff = polyfit(x,yp,1);
B = coeff(1); C = coeff(2);
A = exp(C);


plot (x,y,'o');
xp = linspace( 0, 180 );
axis([0 180 0.0001 0.001 ]); hold on;
plot (xp,A*exp(B*xp),'r'); hold off;
% plot(xp,polyval(coefs,xp));

%% i)

x = [67 75 81 86 89 90]';
y = [40 53 64 45 55 62]';

x2 = x/100;
y2 = 3*x2.*exp(2*x2);


% cambio de variable en los datos

yp=log(y2./x2);

coeff = polyfit(x2,yp,1);

B = coeff(1); C = coeff(2);

A = exp(C);

plot (x2,y2,'o');
axis([0 1 7 17 ]); hold on;
plot (x2,A*x2.*exp(B*x2),'r'); hold off;

%% Ejercicio2 b)

%% f)

x = [90 86 67 89 81 75]; % frecuencia cardiaca
y = [62 45 40 55 64 53]; % peso

coeff = polyfit(x,y,2);
raices = roots(coeff)

%% g)


x = [90 86 67 89 81 75]; % frecuencia cardiaca
y = [62 45 40 55 64 53]; % peso

coeff = polyfit(x,y,3);
raices = roots(coeff)









