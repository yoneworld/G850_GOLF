1000 ' TITLE
1010 CLS : GCURSOR (8,28):GPRINT "DC3B3BDD": RANDOMIZE :Y= RND 370+129: Z= INT ( ABS L* ( RND 11-6)): D= RND Y/2:E= RND Y/2:F= RND Y/2:GOSUB 1830
1020 LOCATE 2,0:PRINT "** GolfGame G850 **":LOCATE 5,1: PRINT "By yoneworld":LOCATE 6,5:PRINT "Hit Any Key"
1030 FOR I=0 TO 9999:IF INKEY$ LET I=9999
1040 NEXT :GOTO 1060
1050 ' START
1060 CLS :L=1: ' L= GameLevel 1(EASY)-3(HARD)
1070 S=0: H=0
1080 ' Course
1090 RANDOMIZE :Y= RND 370+129: Z= INT ( ABS L* ( RND 11-6)): D= RND Y/2:E= RND Y/2:F= RND Y/2: T=0:W=5+(Y<440)+(Y <200)
1100 H=H+1:X=1:R= RND Y/2+20: B= RND Y/2+20
1110 CLS : WAIT 0: PRINT "Hole"; STR$ H;" Par"; STR$ W ; " Score"; STR$ S: GOSUB 1770: LOCATE 6,1: PRINT USING "####";Y;"m Wind="; STR$ -Z
1120 GOSUB 1830: I=10:GOSUB 1790: GOSUB 2030:CLS : LOCATE 0,0:PRINT "Club Selection"
1130 GOSUB 1770: LOCATE 6,1: PRINT USING "####";Y;"m Wind="; STR$ -Z
1140 ' Club Selection
1150 WAIT 0:IF T=3 THEN RESTORE 2090 ELSE RESTORE 2080
1160 C=-(T=3)*3
1170 LOCATE 2,3:PRINT "Hit Anykey or '0'"
1180 READ K,Q$
1190 IF C>5 THEN C=0 :GOTO 1150
1200 WAIT 16:LOCATE 5,2:PRINT "  ";Q$;" "; STR$ K;"m";:C=C+1:I=0:WAIT 16:LOCATE 5,2:PRINT "> ":WAIT 0
1210 I=I+1
1220 IF INKEY$ <>"" AND INKEY$ <>"0" THEN 1180
1230 IF INKEY$ ="0" THEN LOCATE 2,3:PRINT "                 ": GOTO 1250
1240 GOTO 1210
1250 GOSUB 1760:IF INKEY$ <>"" THEN 1250
1260 GOSUB 1730: V=Y-P/10*K + RND 10+4* SGN Z* RND ABS Z:V=V+(-(Y<V))*(Y-V)
1270 ' Ball
1280  X=X+1: CLS : GOSUB 1830: GOSUB 1800: I=10:J=27: C=Y-V:K=21.7*C/Y:K=5.4*P/(K+K*K+1):Q=-20*K*C/Y
1290 WAIT 8:PSET (I,J): WAIT 0:A=I,U=J:J=J+Q:I=I+3:Q=Q+K
1300 C= POINT (I,J): IF C=-1 THEN 1370
1310 IF C AND J<27 AND I<132 LET V=Y-(I-10)*Y/130: GOTO 1370
1320 IF C OR I>130*(Y-V)/Y+10 LET I=130*(Y-V)/Y+10: PRESET (A,U):GOSUB 1790: GOTO 1340
1330 PRESET (A,U): GOTO 1290
1340 IF C PRESET (I, J): A=-1: WAIT 13: V=V-O*P/2: U=46*P*O/Y: I=I+U:J=27-P/3: IF POINT (I,J) THEN 1370
1350 IF C PSET (I,J) :PRESET (I, J): V=V-O*P/2:I=I+U: GOSUB 1790
1360 ' Judgement
1370 PRESET (A, U): V= INT V: IF V<-10 THEN 1570
1380 IF V<10 LET T=5:A= RND 11-6: X=X-1:GOTO 1540
1390 ' Judgement-Bunker
1400 WAIT 90: IF V<E+13 AND V>E OR ( V<F+13 AND V>F) THEN 1590
1410 ' Judgement-Water
1420 IF V<D+22 AND V>D GCURSOR (I-3,33):GPRINT "F2F1F0F1F2":CLS : WAIT 128:PRINT "Water...": WAIT 0:GOTO 2050
1430 ' Judgement-Tree
1440 IF (V>D+23 OR V<D+1) THEN IF V<R+6 AND V>R-6 OR (V<B+6 AND V>B-6) THEN 1610
1450 T=0:Y=V: GOTO 1110
1460 ' On The Green
1470 Y= ABS Y:CLS :WAIT 32:PRINT "ON THE GREEN":WAIT 0:X=X+1:GOSUB 1770: LOCATE 6,1:PRINT USING "####";Y;"m Slope="; STR$ A;"%"
1480 GOSUB 1720: V=Y-P*(2+A/5): K=Y*12:C=0
1490 FOR I=Y TO V STEP -.5: CLS : WAIT 0: J=31-(Y-I)*2-C: GOSUB 1780: IF J<7 LET I=V
1500 WAIT 12: GCURSOR (K-I*12,J): GPRINT "60F0D060": NEXT I:WAIT 25: IF V^2<.2 CLS :GOTO 1630
1510 WAIT 20: GPRINT "": CLS : IF V<-10 LET V= ABS V: WAIT 64:PRINT "GREEN OVER...":WAIT 0: GOTO 1370
1520 Y= INT (V*10)/10:PRINT "A Little ";: IF Y>0 WAIT 64:PRINT "Short...": WAIT 0:GOTO 1470
1530 WAIT 64:PRINT "Long...":WAIT 0:A= RND 11-6: GOTO 1470
1540 J=O*P+5: K=12*V+60+J*1.5: FOR I=0 TO 9:CLS : GOSUB 1780:GCURSOR (6*I,31-I):WAIT 0: GPRINT "80C0C040": GCURSOR (6*I,21)
1550 ' Accident
1560 WAIT 9: GPRINT "60F0D060": NEXT I:C=10:Y=V+J/8: GOTO 1490
1570 CLS : WAIT 128:PRINT " OB... +2": X=X+1:WAIT 0
1580 V=Y: IF T<1 GOTO 1110 ELSE GOTO 1370
1590 CLS : WAIT 128:PRINT "Bunker...": WAIT 0: P=0:GOSUB 1770: LOCATE 6,1:PRINT STR$ V;"m Wind="; STR$ -Z:GOSUB 1720
1600 T=1: Y=V: V=Y-2*( RND 3* RND P + SGN Z* RND ABS Z): GOTO 1280
1610 CLS : WAIT 128: PRINT "Tree...": WAIT 0 :GOSUB 1770:LOCATE 6,1: PRINT STR$ V;"m Wind="; STR$ -Z:T=3: Y=V: GOTO 1150
1620 ' Cup In
1630 GCURSOR (K,31-K/6):GPRINT "40B0F8E870":CLS : WAIT 0: GOSUB 1780:IF L FOR I=0 TO 4: NEXT I
1640 IF X=1 PRINT :WAIT 192:LOCATE 6,2:QQ$="HOLE IN ONE":PRINT QQ$;"!":WAIT 0:GOTO 1670
1650 IF X-W>3 THEN QQ$="": GOTO 1670
1660 RESTORE 2110: FOR I=1 TO X-W+4: READ QQ$:NEXT I
1670 WAIT 128:CLS : S=S-W+X:PRINT "Hole"; STR$ H ; " Par"; STR$ W
1680 PRINT " Shots"; STR$ X;:IF QQ$<>"" THEN PRINT "(";QQ$;"!)"
1690 WAIT 256:PRINT " Score"; STR$ (X-W): IF H<18 THEN 1090
1700 PRINT "Total ";S:END
1710 ' Shot Power
1720 GOSUB 1760
1730 I=I+O: IF I>76 OR I<48 LET O=-O: GOTO 1730
1740 PSET (I, 29),X:IF INKEY$ ="" THEN 1730
1750 P= INT (I*10-470)/30: RETURN
1760 LOCATE 1,3: PRINT "POWER 0-----10":I=47:O=1: RETURN
1770 LOCATE 0,1: PRINT USING "###";X:GCURSOR (20,14) :GPRINT "24A4FE240282FE0200FEAAAAAAFE":RETURN
1780 GCURSOR (K,31-K/6):GPRINT "40A0A0A040":RETURN
1790 C= POINT (I,28)+ POINT (I,27): J=28-C:PSET (I,J): RETURN
1800 GCURSOR (8,28):GPRINT "DC3B3BDD":RESTORE 2100: FOR K=1 TO 5: READ I,J,U
1810 WAIT U: LINE (10,25)- (I,J),X: WAIT 0:LINE (10,25)-(I,J),X:NEXT K: RETURN
1820 ' Course Graphics
1830 LINE (0,28)- (144,33),BF: K=D: I=2860:J=1:GOSUB 1970: K=E: I=1690:J=0: GOSUB 1970: K=F:I=1690: GOSUB 1970
1840 J=2: K=-10:I=2600:GOSUB 1970: J=30/Y:FOR I=26-9*J TO 26-5*J: LINE (140.5-4*J* SGN Z,26-J*7)-(140,I)
1850 LINE -(140,30):NEXT I:A=1300/Y:GOSUB 1940
1860 ' BUNKER/WATER Graphics
1870 SS=130/Y
1880 LINE (140-(E)*SS,28)-(140-(E+13)*SS,28),R:LINE (140-(E)*SS-1,29)-(140-(E+13)*SS+1,29),R
1890 LINE (140-(F)*SS,28)-(140-(F+13)*SS,28),R:LINE (140-(F)*SS-1,29)-(140-(F+13)*SS+1,29),R
1900 DS=140-(D)*SS: DE=140-(D+22)*SS
1910 IF DE>0 AND DE<10 THEN DE=12
1920 IF DS>0 AND DS<10 THEN DS=12
1930 LINE (DS,28)-(DE,29),R,BF
1940 K=140-130*R/Y: C=-(K>-A*.4): IF POINT (K,28)=0 LET R= RND Y/2+10: GOTO 1940
1950 IF C FOR I=(K-A*.4)*(-(K>0)) TO K+A*.4: J=27-A*.2+.5: LINE (K,27-A)-(I,J): NEXT I:LINE (K,J)-(K,28)
1960 I=B:B=R:R=I: RETURN
1970 K=139-K*130/Y:I=K-I/Y+1.6: IF -K RETURN
1980 IF -I LET I=0
1990 IF J=2 LINE (I-2,29)-(K+2,29): LINE (I-1,28)-(K+1,28): LINE (I,27)-(K,27):RETURN
2000 LINE (I,28)-(K,28),R: IF J=1 LINE (I+1,29)-(K-1,29),R:RETURN
2010 LINE (I,29)-(K,29):RETURN
2020 ' ETC
2030 IF INKEY$ ="" THEN 2030
2040 RETURN
2050 V=D+23: IF T=5 LET Y=10: GOTO 1470
2060 GOTO 1370
2070 ' Data
2080 DATA 230, "W-1", 200, "W-3",170,"I-4"
2090 DATA 140, "I-6", 110, "I-8", 70," SW "
2100 DATA 10,28,9,5,27,9,6,20,9,10,28,0,13,20,0
2110 DATA "", "Eagle", "Birdie", "Par-", "Bogey","D.Bogey","T.Bogey"
