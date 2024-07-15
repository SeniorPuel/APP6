clear
close all
clc

D = 0.1;
Db = 0.05;
Acont = 0.01;
As = 4*pi*(D/2)^2 - Acont;
Qfc = 1;
Ntot = 0.02;
PCp_b = 3*10^6;
epsilon_s = 0.01;
X = 0.025;
Kin = 0.005;
Xsw = 0.03;
Ksw = 59;
Asw = 0.0015;
epsilon_s_vec = 0.09;
Avec = 0.75*As;

g = 3.71;
Tb = 300;
Tsun = 5780;
rs = 0.696*10^9;

% Stef_blotz
sigma = 5.67*10^-8;

r2 = D/2;
r1 = r2-X;

Aint = 4*pi*(r1)^2 - Acont;

Qfc_heat = Qfc*(1-1*Ntot);

R_Qcond = ((1/r1)-(1/r2))/(4*pi*Kin);


% Partie 1
    % 1)
        U = 0;
        Trp = 50;
        r = 206.6*10^9;
        k = 0.0037;
        Cp = 670.5545;
        p = 0.0794;
        a = 6.979/10^-5;
        v = 9.7172*10^-5;
        Pr = 1.3923;
        sys(Ts)

        b = 1/Trp;
        Re = U*D/v;
        Ra = g*b*(Tb-Trp)*D^3*Pr/(v^2);

        Nu = 2+(0387*Ra^(1/6)/(1+(0.469/Pr)^(9/16))^(4/9));
        h = k*Nu/D;
        


        Qsun = sigma*epsilon_s*(As/2)*(rs/r)^2*Tsun^4;

        Qcond = -4*pi*Kin*r1*r2*(Tb-Ts)/(r2-r1);

        Qconv = h*As*(Tb - Trp);
        
        %Ts = Tb - Qcond/(Kin*4*pi)*(1/r2 - 1/r1)
        Ts = Trp + (Qcond/Kin)*(r1/r2)^2;

        Qconv = -h*As*(Ts-Trp);
        R_Qconv = 1/(h*As);

    % 2)
        U = 2;
        Trp = 50;
        r = 206.6*10^9;
        k = 0.0037;
        Cp = 670.5545;
        p = 0.0794;
        a = 6.979/10^-5;
        v = 9.7172*10^-5;
        Pr = 1.3923;
        Re_D = U*D/v;

        Qsun = sigma*epsilon_s*(As/2)*(rs/r)^2*Tsun^4;



        p_1atm = 1.977;
        v_1atm = 8.977 * 0.09290312990644656;
        Nu = 2 + (0.4*Re^(1/2)+0.06*Re^(2/3))*Pr^0.4*((p_1atm*v_1atm)/(p*v))^(1/4);

    % 3)
        U = 0;
        Trp = 250;
        r = 249.2*10^9;
        k = 0.0112;
        Cp = 837.6091;
        p = 0.0159;
        a = 8.4133*10^-4;
        v = 11*10^-4;
        Pr = 1.2913;
        Re_D = U*D/v;

        Qsun = sigma*epsilon_s*(As/2)*(rs/r)^2*Tsun^4;

    % 4)
        U = 2;
        Trp = 250;
        r = 249.2*10^9;
        k = 0.0112;
        Cp = 837.6091;
        p = 0.0159;
        a = 8.4133*10^-4;
        v = 11*10^-4;
        Pr = 1.2913;
        Re_D = U*D/v;

        Qsun = sigma*epsilon_s*(As/2)*(rs/r)^2*Tsun^4;








