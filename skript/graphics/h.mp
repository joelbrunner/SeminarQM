%
% h.mp -- bilder zum Wasserstoff-Atom
%
% (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
%
verbatimtex
\documentclass{book}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\usepackage{german}
\begin{document}
etex;

%
% Potential
%
beginfig(1)


numeric u;
u := 80;

path p;
path q;

numeric a;
a = 0.25;

p = (4 * u, -0.25 * u);
q = (4 * u, -0.25 * u + a * u / 16);
for x = 3.99 step -0.01 until 0.1:
	p := p..(x * u, -u/x);
	q := q..(x * u, -u/x + a * u/(x * x));
endfor

pickup pencircle scaled 1.5pt;

draw p;
draw q;

clip currentpicture to (0, -2 * u)--(4 * u, -2 * u)--(4 * u, 1 * u)
	--( 0, 1 * u)--cycle;

pickup pencircle scaled 1pt;

drawarrow (-10,           0)--(4 * u + 10,      0);
drawarrow (  0, -2 * u - 10)--(         0, u + 10);

label.lrt(btex $V(r)\sim \displaystyle-\frac1r$ etex, (u, -u));
label.top(btex $r$ etex, (4 * u + 5, 5));
label.ulft(btex $V(r)\sim \displaystyle-\frac1r+\frac{a}{r^2}$ etex, (2 * u, (-0.5 + a / 4) * u));

label.lft(btex $V$ etex, (-5,u + 5));

pickup pencircle scaled 4pt;

draw(2 * a * u, (-1/(2 * a)  + a/(4 * a * a)) * u);

endfig;

%
% Energieniveaux
%
beginfig(2)

z0 = (0,0);
z1 = (205,0);
z2 = (0,-480);

pickup pencircle scaled 1pt;
drawarrow z0--z1;
drawarrow ((-0.05)[z2,z0])--(1.05[z2,z0]);
label.top(btex $l$ etex, z1);
label.ulft(btex $E$ etex, 1.05[z2,z0]);

numeric Z;
Z = -480;

def hoehe(expr n) =
	(Z/(n*n))
enddef;

def uebergang(expr x,n,m) =
	drawarrow (x, hoehe(n))--(x, hoehe(m)) withcolor (1,0,0);
enddef;

pickup pencircle scaled 0.5pt;

uebergang(210, 2, 1);
uebergang(214, 3, 1);
uebergang(218, 4, 1);
uebergang(222, 5, 1);
uebergang(226, 6, 1);
uebergang(230, 7, 1);

label.top(btex Lyman-Serie etex, (0,0)) rotated 90
	shifted (210, 5*Z/8) withcolor(1,0,0);

uebergang(250, 3, 2);
uebergang(254, 4, 2);
uebergang(258, 5, 2);
uebergang(262, 6, 2);
uebergang(266, 7, 2);
uebergang(270, 8, 2);

label.lft(btex Balmer-Serie etex, (0,0)) rotated 90
	shifted (260, hoehe(2)) withcolor(1,0,0);

uebergang(290, 4, 3);
uebergang(294, 5, 3);
uebergang(298, 6, 3);
uebergang(302, 7, 3);
uebergang(306, 8, 3);
uebergang(310, 9, 3);

label.lft(btex Paschen-Serie etex, (0,0)) rotated 90
	shifted (300, hoehe(3)) withcolor(1,0,0);

uebergang(330,  5, 4);
uebergang(334,  6, 4);
uebergang(338,  7, 4);
uebergang(342,  8, 4);
uebergang(346,  9, 4);
uebergang(350, 10, 4);

label.lft(btex Bracket-Serie etex, (0,0)) rotated 90
	shifted (340, hoehe(4)) withcolor(1,0,0);

label.top(btex Zustands"uberg"ange etex, (280, 0));

pickup pencircle scaled 0.2pt;

draw ( 40, hoehe(1))--(240, hoehe(1));
draw ( 80, hoehe(2))--(280, hoehe(2));
draw (120, hoehe(3))--(320, hoehe(3));
draw (160, hoehe(4))--(355, hoehe(4));

for i = 5 step 1 until 10:
	draw (210, hoehe(i))--(355, hoehe(i));
endfor;

%uebergang(170,  6, 5);
%uebergang(174,  7, 5);
%uebergang(178,  8, 5);
%uebergang(182,  9, 5);
%uebergang(186, 10, 5);
%uebergang(190, 11, 5);

%uebergang(210,  7, 6);
%uebergang(214,  8, 6);
%uebergang(218,  9, 6);
%uebergang(222, 10, 6);
%uebergang(226, 11, 6);
%uebergang(230, 12, 6);

label.top(btex $l=0$ etex, (20,0));
label.top(btex $l=1$ etex, (60,0));
label.top(btex $l=2$ etex, (100,0));
label.top(btex $l=3$ etex, (140,0));
label.top(btex $l=4$ etex, (180,0));
%label.top(btex $l=5$ etex, (220,0));
%label.top(btex $l=6$ etex, (260,0));
%label.top(btex $l=7$ etex, (300,0));

%label.bot(btex $m=0$ etex, (20,Z));
%label.bot(btex $|m|\le 1$ etex, (60, Z/4));
%label.bot(btex $|m|\le 2$ etex, (100, Z/9));
%label.bot(btex $|m|\le 3$ etex, (140, Z/16));
%label.bot(btex $|m|\le 4$ etex, (180, Z/25));

label.lft(btex $n=1$ etex, (0,Z));
label.lft(btex $n=2$ etex, (0,Z/4));
label.lft(btex $n=3$ etex, (0,Z/9));
label.lft(btex $n=4$ etex, (0,Z/16));
label.lft(btex $n=5$ etex, (0,Z/25));
label.lft(btex $\dots$ etex, (0, Z/50));

label.bot(btex $\text{$-13.6$eV}$ etex, (100,Z));
label.bot(btex $\text{$-3.40$eV}$ etex, (100,Z/4));
label.bot(btex $\text{$-1.52$eV}$ etex, (100,Z/9));
label.bot(btex $\text{$-0.85$eV}$ etex, (100,Z/16));
label.bot(btex $\text{$-0.54$eV}$ etex, (100,Z/25));
%label.bot(btex $\text{$-0.38$eV}$ etex, (220,Z/36));

pickup pencircle scaled 0.5pt;

for n = 1 step 1 until 20:
	numeric h;
	h := Z / (n * n);
	numeric m;
	m := n - 1;
	if n > 4:
		m := 4;
	fi;
	for l = 0 step 1 until m:
		draw (20 + l* 40 - 15,h)--(20+l*40+15,h);
	endfor
endfor

endfig;

%
% Spektrum
%
beginfig(3)

color c;

def	position(expr l) =
	0.30 * mlog(l)
enddef;

def	lambda(expr n, m) =
	position(9.1127/(1./(n*n)-1./(m*m)))
enddef;

fill (position(38),40)--(position(38),-10)--(position(75),-10)--(position(75),40)--cycle withcolor(0.9,0.9,0.9);

%draw (position(1),-2)--(position(1),2);
%label.bot(btex 10nm etex, (position(1),-2));
draw (position(10),-2)--(position(10),2);
label.bot(btex 100nm etex, (position(10),-2));
draw (position(100),-2)--(position(100),2);
label.bot(btex 1000nm etex, (position(100),-2));
draw (position(1000),-2)--(position(1000),2);
label.bot(btex 1$\mu$m etex, (position(1000),-2));
 
def linie(expr n, m, c) =
	numeric a;
	a := lambda(n, m);
	draw (a, 5)--(a, 35) withcolor c;
enddef;

c := (0.8,0,0.8);
for k = 7 step 1 until 40:
	linie(6, k, c);
endfor;
label.rt(btex Humphreys etex, (0,0)) rotated 45
	shifted (position(340), 40) withcolor c;

c := (0,0.8,0.8);
for k = 6 step 1 until 40:
	linie(5, k, c);
endfor;
label.rt(btex Pfund etex, (0,0)) rotated 45
	shifted (position(230), 40) withcolor c;

c := (0.8,0.8,0);
for k = 5 step 1 until 40:
	linie(4, k, c);
endfor;
label.rt(btex Bracket etex, (0,0)) rotated 45
	shifted (position(140), 40) withcolor c;

c := (0,1,0);
for k = 4 step 1 until 40:
	linie(3, k, c);
endfor;
label.rt(btex Paschen etex, (0,0)) rotated 45
	shifted (position(80), 40) withcolor c;

c := (1,0,0);
for k = 3 step 1 until 30:
	linie(2, k, c);
endfor;
label.rt(btex Balmer etex, (0,0)) rotated 45
	shifted (position(35), 40) withcolor c;

c := (0,0,1);
for k = 2 step 1 until 30:
	linie(1, k, c);
endfor;
label.rt(btex Lyman etex, (0,0)) rotated 45
	shifted (position(10), 40) withcolor c;

draw ((position(38),-2)--(position(38),-5)--(position(75),-5)--(position(75),-2))
	shifted (0,-5);
label.bot(btex \strut sichtbar etex, ((position(38)+position(75))/2, -10));

drawarrow (position(8),0)--(position(1500),0);
label.bot(btex $\log\lambda$ etex, (position(1500),0));

endfig;

end
