%{
	cond(A,p) per calcolare il numero di condizionamento

	p = 2 la funzione `cond` calcola la decomposizione SVD di A ed estrae
	il più grande e il più piccolo valore singolare (coincidono con gli autovalori?)

	p != 2 viene calcolata la norma di A e di inv(A) (COSTOSO)
	si faccia riferimento alle funzioni built-in
		libinterp/corefcn/data.cc
		libinterp/corefcn/inv.cc
%}


A = @(n) full(gallery("tridiag", n, -1, 2, -1));
n = 1:1000;
p = 2;
K = zeros(size(n));


for i = n
	K(i) = cond(A(i),p);
end


plot(n, K);
title(sprintf('Conditioning number of A_n in the norm p = %f', p));
xlabel('n');
ylabel('K(A_n)');


% dal grafico sembra che K(A_n) sia una funzione quadratica di n, come posso indagarlo?

%{
	TODO:
		- plot(n, sqrt(K)) mostra una retta => K ~= C*n^2
		- trovare una formula per calcolare esattamente K(A_n)
%}
