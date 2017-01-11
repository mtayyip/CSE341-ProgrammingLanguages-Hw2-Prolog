/*-------------------------------------PART1 VE PART2---------------------------------*/
flight(istanbul,izmir). 
flight(izmir,istanbul).
flight(istanbul,antalya).
flight(antalya,istanbul).
flight(istanbul,konya).
flight(konya,istanbul).
flight(istanbul,gaziantep).
flight(gaziantep,istanbul).
flight(istanbul,ankara).
flight(ankara,istanbul).
flight(istanbul,kars). 
flight(kars,istanbul).
flight(istanbul,trabzon). 
flight(trabzon,istanbul).
flight(edirne,edremit).
flight(edremit,edirne).
flight(edremit,erzincan).
flight(erzincan,edremit).
flight(ankara,izmir). 
flight(izmir,ankara).
flight(ankara,konya).
flight(konya,ankara).
flight(ankara,kars). 
flight(kars,ankara).
flight(ankara,trabzon).
flight(trabzon,ankara).



distance(istanbul,izmir,328). 
distance(izmir,istanbul,328).
distance(istanbul,antalya,482).
distance(antalya,istanbul,482).
distance(istanbul,konya,461).
distance(konya,istanbul,461).
distance(istanbul,gaziantep,848).
distance(gaziantep,istanbul,848).
distance(istanbul,ankara,350).
distance(ankara,istanbul,350).
distance(istanbul,kars,1179).
distance(kars,istanbul,1179).
distance(istanbul,trabzon,892). 
distance(trabzon,istanbul,892). 
distance(edirne,edremit,225).
distance(edremit,edirne,225).
distance(edremit,erzincan,1044).
distance(erzincan,edremit,1044).
distance(ankara,izmir,521).
distance(izmir,ankara,521).
distance(ankara,konya,231).
distance(konya,ankara,231).
distance(ankara,kars,872).
distance(kars,ankara,872).
distance(ankara,trabzon,593).
distance(trabzon,ankara,593).
	

/*Part1*/
route(X,Y):-flight(X,Y),X\=Y.
route(X,Y):-flight(X,Z),flight(Z,Y),X\=Y.

/*Part2*/
sroute(S1,S2,X):-flight(S1,S2),distance(S1,S2,X).
sroute(S1,S2,X):-flight(S1,S3),flight(S3,S2),
    			distance(S1,S3,X1),distance(S3,S2,X2),
    			X is X1+X2.


 
/*------------------------------------------PART3-------------------------------------*/
/*enrollment eklemek icin gerekli satir.*/
:-dynamic(enrollment/2).

/*dersler,zamani,yeri.*/
classes(102,10,z23).
classes(108,12,z11).
classes(341,14,z06).
classes(455,16,207).
classes(452,17,207).

/*kisiler ve aldiklari dersler.*/
enrollment(a,102).
enrollment(a,108).
enrollment(b,102).
enrollment(c,108).
enrollment(d,341).
enrollment(e,455).


/*verilen dersin zamanini donderiyor.*/
when(X,Y):-classes(X,Y,_).

/*verilen dersin yerini donderiyor.*/
where(X,Y):-classes(X,_,Y).

/*verilen kisiyi verilen derse ekliyor.*/
enroll(X,Y):-assert(enrollment(X,Y)).

/*verilen sinfta hangi saatte ders oldugunu donderiyor. */
usageBaseCase(X,Y):-classes(_,Y,X).



/*(3.1.)*/
/*kisi alip aldigi dersin yer ve zamanini donderiyor.*/
schedule(S,P,T):-enrollment(S,K),where(K,P),when(K,T),nl.

/*(3.2.)*/
/*verilen siniftaki derslerin saatlerini donderiyor.*/
usage(P,T):-usageBaseCase(P,T). 

/*(3.3.)*/
/*verilen iki dersin zamanlari veya yerleri ayni mi diye bakiyor.*/
conflict(X,Y):-when(X,T1),when(Y,T2),T1==T2;
			   where(X,P1),where(Y,P2),P1==P2.

/*(3.4.)*/
/*verilen iki kisinin ayni zamanda ayni sinifta olup olmadigina bakiyor.*/
meet(X,Y):-enrollment(X,Class1),enrollment(Y,Class2),
		   when(Class1,T1),when(Class2,T2),T1==T2,
		   where(Class1,P1),where(Class2,P2),P1==P2.


		   
/*------------------------------------------PART4-------------------------------------*/
/*(4.1.)*/
add([], 0).
add([H|T],S):-add(T,R),S is H + R.


/*(4.2.)*/
unique([],[]).
unique([H|X],[H|Y]):-delete(X,H,T),unique(T, Y).