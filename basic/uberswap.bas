10 gosub 35000:gosub 50000:gosub 60000
20 dim mv%(144),av%(144):hp=0
30 dim kv%(144),mp%,kp%,sl
40 gosub 10300:gosub 19930:gosub 19730:gosub 19970
100 gosub 10000
110 gosub 12000:gosub 11000:if gz=0 then 110
120 gosub 35000:goto 40
9999 end	

10000 c=0:cc=0:for x=14 to 36 step 2
10010 p=1024+x
10020 for y=0 to 22 step 2
10030 po=p+40*y:co=54272+po
10040 poke po,c%(c,0):poke po+1,c%(c,1)
10050 poke po+40,c%(c,2):poke po+41,c%(c,3)
10060 cb=c+1:if cb=1 then cb=15
10065 poke co,cb:poke co+1,cb
10070 poke co+40,cb:poke co+41,cb
10080 cn=cn+1:if cn=8 then cn=0:c=c+1:c=c and 7
10100 next y,x
10110 for i=0 to 300
10115 ii=peek(53266):x1=ii and 15:if x1>11 then x1=x1-4
10120 ii=peek(53266):y1=ii and 15:if y1>11 then y1=y1-4
10130 ii=peek(53266) and 3:if ii=3 then ii=0
10135 y2=y1+1-ii
10140 ii=peek(53266) and 3:if ii=3 then ii=0
10145 x2=x1+1-ii
10146 if x2>=0 then if x2<=11 then if y2>=0 then if y2<=11 then gosub 15800
10160 next
10170 return

10300 xc=0:yc=0::i=rnd(1):ti$="000000":tt=ti:fb=0:js=6:gz=0
10310 wd=0:gp=0:bo=0:return

10500 xa=xc:ya=yc:gosub 19500:ca=cb:if cb=0 and xc>0 then xc=xc-1:goto 10500
10510 xa=0:ya=11:gosub 19500:if cb=0 then 10560
10520 if ca>0 then return
10530 ya=11:for i=0 to 11:xa=i:gosub 19500:if cb<>0 then xc=i:gosub 10600:return
10540 next:return

10560 gz=1:wd=1:gp=gp+10000:gosub 19730:return

10600 ya=11
10605 if ya<0 then return
10610 xa=xc:gosub 19500:if cb<>0 then yc=ya:ya=ya-1::goto 10605
10620 return

11000 if gz=0 then return
11002 if gp>hp then hp=gp:gosub 19930
11005 gosub 39500:poke 704,1:poke 705,15:poke 706,12:poke 707,11
11010 gosub 15300:poke 646,1:c=704:cd=1
11015 gosub 42000:print chr$(19);"{10*down}{20*right}            "
11016 if wd=1 then 11040
11020 print "{20*right}  game      "
11030 print "{20*right}      over  "
11035 goto 11110
11040 print "{20*right}  well      "
11050 print "{20*right}      done  "
11110 print "{20*right}            "
11120 gosub 17000
11130 poke 646,peek(c)
11140 c=c+cd:if c=708 then c=707:cd=-1
11150 if c=703 then c=704:cd=1
11200 if td<>2 then 11015
11930 return

12000 gosub 19730:if sl=1 then 14500
12004 gosub 13000:gosub 31000
12005 gosub 17000:if gz=1 then return
12010 if td=0 then 12005
12015 gosub 31000
12020 if xd=1 then xc=xc+1
12030 if xd=-1 then xc=xc-1
12035 if xc<0 then xc=0:xd=1
12040 if xc>11 then xc=11:xd=-1
12045 xa=xc:ya=11:gosub 19500:if cb=0 then 12020
12050 if yd=-1 then yc=yc-1
12060 if yd=1 then yc=yc+1
12080 if yc<0 then yc=0
12090 if yc>11 then yc=11
12100 if td=2 then gosub 14000
12110 goto 12000

13000 rem
13010 xa=xc:ya=yc:gosub 19500
13020 if cb<>0 then return
13030 ya=12
13040 ya=ya-1:if ya=-1 then return
13050 gosub 19500:if cb<>0 then 13040
13060 if ya<11 then yc=ya+1
13070 return

14000 if sl=0 then sl=1:x1=xc:y1=yc
14010 return

14500 gosub 13000:gosub 31000
14505 gosub 17000
14510 if td=0 then 14505
14515 gosub 31000
14520 if xd=1 and xc<=x1 then xc=xc+1:yc=y1
14530 if xd=-1 and xc>=x1 then xc=xc-1:yc=y1
14540 if yd=-1 and yc>=y1 then yc=yc-1:xc=x1
14550 if yd=1 and yc<=y1 then yc=yc+1:xc=x1
14560 if xc<0 then xc=0
14570 if xc>11 then xc=11
14580 if yc<0 then yc=0
14590 if yc>11 then yc=11
14600 if td<>2 then 14500
14610 sl=0:gosub 31000
14620 x2=xc:y2=yc
14630 xc=x1:yc=y1
14635 if x1=x2 and y2=y1 then sl=0:gosub 31000:return
14640 gosub 16000:return

15000 gosub 32000:sf%=1
15005 xa=xc:ya=yc:gosub 19500:cc=cb
15008 if cc=0 then sf%=0:return
15009 gosub 19000:sp%=0
15010 gosub 42000:lp%=mp%:xa=mv%(sp%):ya=int(xa/12):xa=xa-ya*12
15020 xa=xa-1:if xa>=0 then gosub 19000
15030 xa=xa+2:if xa<12 then gosub 19000
15040 xa=xa-1:ya=ya-1:if ya>=0 then gosub 19000
15050 ya=ya+2:if ya<12 then gosub 19000
15060 if lp%<mp% then sp%=mp%-1:goto 15010
15070 if mp%>0 then mp%=mp%-1:sp%=mp%:goto 15010
15080 gosub 19600
15090 if kp%<3 then sf%=0:return
15100 lf%=0:for ik=0 to kp%-1
15110 v%=kv%(ik):y=int(v%/12):x=v%-y*12
15120 if y=11 then lf%=1
15122 if x<>x2 then 15130
15127 if y>y2 then y2=y2+1
15128 if y2>11 then y2=11
15130 gosub 20000:next
15160 return

15200 poke 53269,1:return
15300 poke 53269,0:return

15800 c1=55296+x1*2+14+y1*80
15810 c2=55296+x2*2+14+y2*80
15820 poke 833,int(c1/256):poke 832,c1-256*peek(833)
15830 poke 835,int(c2/256):poke 834,c2-256*peek(835)
15840 sys 49158:return

15900 rem
15910 t=x1:x1=x2:x2=t:t=y1:y1=y2:y2=t:return

16000 gosub 15300:if y1>y2 then gosub 15900
16010 if y1<>y2 then 16025
16020 if x1>x2 then gosub 15900
16025 gosub 39800:gosub 15800
16030 xa=x1:ya=y1:gosub 19500:ct=cb 
16040 xa=x2:ya=y2:gosub 19500:cz=cb
16050 xc=x1:yc=y1:gosub 15000:s1%=sf%:ll%=lf%
16060 if ct=cz then 16075
16070 xc=x2:yc=y2:gosub 15000
16075 lf%=ll% or lf%:gosub 33000
16080 if s1%=0 and sf%=0 then gosub 39850:gosub 15800:goto 16090
16090 gosub 10500:gosub 15200:return

17000 gosub 42000
17010 xd=0:yd=0:td=0:get a$:if a$="" then 17080
17020 if a$="w" then td=1:yd=-1:return
17030 if a$="s" then td=1:yd=1:return
17040 if a$="a" then td=1:xd=-1:return
17050 if a$="d" then td=1:xd=1:return
17060 if a$=" " then td=2
17065 if a$="x" then gz=1:return
17066 if a$="b" then gosub 34000:return
17067 if a$="h" then gosub 36000
17070 return
17080 if ti-tt<js then return
17085 tt=ti:p=peek(56320)
17090 if (p and 1)=0 then td=1:yd=-1
17100 if (p and 2)=0 then td=1:yd=1
17110 if (p and 4)=0 then td=1:xd=-1
17120 if (p and 8)=0 then td=1:xd=1
17130 if (p and 16)=0 then gosub 17200:return
17135 if td=0 then tt=tt-js
17140 fb=0:return

17200 if fb=1 then return
17210 fb=1:tt=tt-js
17220 td=2:xd=0:yd=0:return

19000 v%=ya*12+xa:if av%(v%)=1 then return
19005 gosub 19500:if cb=0 or cb<>cc then return
19010 mv%(mp%)=v%:kv%(kp%)=v%
19020 av%(v%)=1:mp%=mp%+1:kp%=kp%+1
19030 return

19500 cb=peek(55296+xa*2+14+ya*80) and 15:return

19600 if kp%=1 then return
19605 sw=0
19610 for i=0 to kp%-2
19620 v1%=kv%(i):v2%=kv%(i+1)
19630 if v1%>v2% then kv%(i+1)=v1%:kv%(i)=v2%:sw=1
19640 next:if sw=1 then 19605
19642 if kp%>2 then gosub 19800
19650 return

19700 if kp%>4 then gp=gp+300*(kp%-4):goto 19730
19710 if kp%>3 then gp=gp+150:goto 19730
19720 gp=gp+50
19730 gg=gp:gosub 19880
19750 print chr$(19);"{7*down}";b$
19760 return

19800 gosub 39700:for i=0 to kp%-1:v%=kv%(i):y=int(v%/12):x=v%-y*12
19810 po=1024+x*2+14+80*y:poke po,46:poke po+1,46
19820 poke po+40,46:poke po+41,46
19830 next:gosub 19700:return

19880 b$="             ":a$=str$(gg)
19890 b$=left$(b$,len(b$)-len(a$))+a$:return

19930 poke 646,13:gg=hp:gosub 19880
19950 print chr$(19);"{3*down}";b$
19960 poke 646,15:return

19970 poke 646,10:gg=bo:gosub 19880
19980 print chr$(19);"{11*down}";b$
19990 poke 646,15:return

20000 rem 
20025 y=y*2
20030 co=55296+x*2+14
20040 cc=co+y*40:poke cc,0:poke cc+1,0
20050 poke cc+40,0:poke cc+41,0
20060 if y=0 then 20200
20080 y=y-2:ca=co+40
20090 cx=co:gosub 30000:cx=ca:gosub 30000
20200 gosub 42000:return

30000 rem
30002 cf=y*40+cx
30005 for cc=cf to cx step -80: if cc<55296 or cc>56278 then 30030
30010 poke 833,int(cc/256):poke 832,cc-256*peek(833)
30020 sys 49152:gosub 42000
30030 next:return

31000 x=xc*16+136:y=yc*16+50
31010 if sl=1 then 31200
31015 poke 53287,1
31020 poke 53271,0:poke 53277,0
31030 if x>255 then x=x-256: poke 53264,1:poke 53248,x:goto 31050
31040 poke 53264,0:poke 53248,x
31050 poke 53249,y:poke 53269,1:return

31200 poke 53287,13
31205 if (abs(x1-xc)>=1) and (abs(y1-yc)>=1) then yc=y1:xc=x1:goto 31000
31210 if y1>yc then poke 53271,1:poke 53277,0:goto 31030
31220 if y1<yc then poke 53271,1:poke 53277,0:y=y-16:goto 31030
31230 if x1>xc then poke 53271,0:poke 53277,1:goto 31030
31240 if x1<xc then poke 53271,0:poke 53277,1:x=x-16:goto 31030
31250 goto 31020

32000 mp%=0:kp%=0
32010 for i=0 to 144:av%(i)=0:next
32020 return

33000 rem
33010 if lf%=0 then return
33020 for i=0 to 11
33030 xa=i:ya=11:gosub 19500
33040 if cb<>0 then 33500
33050 lr=i:for ii=i to 11:xa=ii:ya=11:gosub 19500
33055 if cb<>0 then lr=ii
33060 next
33070 if lr=i then 33500
33075 gp=gp+1000:gosub 19730:if bo<2 then bo=bo+1::gosub 19970
33080 for ii=i to lr-1:po=55296+14+ii*2
33090 poke 833,int(po/256):poke 832,po-256*peek(833)
33100 gosub 39600:sys 49155
33110 next
33120 po=55296+14+lr*2
33125 for p=po to po+23*40 step 40:poke p,0:poke p+1,0:next
33130 i=i-1
33500 next:return

34000 rem bomb
34005 if bo=0 or gz=1 then gosub 39850:return
34008 bo=bo-1:gosub 19970
34010 xb=xc:yb=yc:if sl=1 then gosub 39850:return
34020 xs=xb:xe=xb+1
34030 xx=xs:gosub 34600:xs=xs-1
34040 xx=xe:gosub 34600:xe=xe+1
34050 if xs<0 and xe>11 then 34100
34060 gosub 42000:goto 34030
34100 lf%=1:gosub 33000:gosub 10500:gosub 15200
34110 gosub 31000:return

34600 if xx<0 or xx>11 then return
34610 gosub 39400:po=1024+xx*2+14+yb*80:tt=ti
34620 poke po,86:poke po+1,86:poke po+40,86:poke po+41,86
34622 po=po+54272
34624 poke po,1:poke po+1,1:poke po+40,1:poke po+41,1
34625 if ti-tt<4 then 34625
34630 x=xx:y=yb:gosub 20000
34640 return

35000 poke 53280,0:poke 53281,0:poke 650,192:poke 652,0:poke 646,13
35005 print chr$(147);chr$(142);:for i=1024 to 1036:poke i,67:next
35010 for i=1038+24*40 to i+23:poke i,67:next
35020 for i=1037+40 to i+22*40 step 40:poke i,66:next
35030 for i=1038+40+24 to i+22*40+24 step 40:poke i,66:next
35040 poke 1037,73:poke 1997,74:poke 1997+25,75
35050 poke 1062,85:poke 1063,67
35120 for i=55296 to 56295:poke i,7:next
35130 for i=1024+160 to i+12:poke i,67:next:poke i,115
35140 print "{1*down}{4*right}highscore":poke 646,15
35150 for i=1024+320 to i+12:poke i,67:next:poke i,115
35160 print "{3*down}{8*right}score":poke 646,10
35170 for i=1024+480 to i+12:poke i,67:next:poke i,115
35180 print "{3*down}{8*right}bombs":poke 646,7
35190 print "{3*down}[x] give up"
35200 print "[b] bomb":print "[h] help":poke 646,12
35210 print "{down*7}> uberswap <":poke 646,11:print"by egonolsen";
35220 poke 646,15:return

36000 gosub 15300:sys 49161
36010 for i=1068 to 1100:poke i,67:next
36015 for i=1068+54272 to 1100+54272:poke i,1:next
36020 for i=1068+22*40 to 1100+22*40:poke i,67:next
36025 for i=1068+22*40+54272 to 1100+22*40+54272:poke i,1:next
36030 for i=1067 to 1067+22*40 step 40:poke i,66:next
36035 for i=1067+54272 to 1067+22*40+54272 step 40:poke i,1:next
36040 for i=1101 to 1101+22*40 step 40:poke i,66:next
36045 for i=1101+54272 to 1101+22*40+54272 step 40:poke i,1:next
36050 poke 1067,85:poke1101,73:poke 1067+22*40,74
36060 poke 1101+22*40,75
36070 print chr$(19);"{2*down}";:poke 646,1
36080 for i=0 to 20:print "{4*right}{33*space}":next
36090 print chr$(19);"{2*down}";
36100 a$="use joystick or wasd/space to":gosub 37500
36110 a$="move the cursor. select a":gosub 37500
36120 a$="piece (fire), then move up/":gosub 37500
36130 a$="down/left/right to select an":gosub 37500
36140 a$="adjacent one. the pieces will":gosub 37500
36150 a$="swap positions. if this results":gosub 37500
36160 a$="in a figure with 3 or more":gosub 37500
36170 a$="pieces of the same color, it":gosub 37500
36180 a$="will be removed. if you clear":gosub 37500
36190 a$="any column but the rightmost":gosub 37500
36200 a$="one, you will get one of two":gosub 37500
36210 a$="bombs. press 'b' to use a bomb":gosub 37500
36220 a$="to clear the current row. the":gosub 37500
36230 a$="game ends when there are no":gosub 37500
36240 a$="pieces left or you when you":gosub 37500
36250 a$="press 'x' to give up.":gosub 37500
36260 a$="the larger figures you clear,":gosub 37500
36270 a$="the more points you'll get.":gosub 37500
36280 a$="":gosub 37500
36290 a$="(press any key or move stick)":gosub 37500
36890 get a$:if a$="" and peek(56320)=127 then 36890
36900 if peek(56320)<>127 then 36900
37000 sys 49164:gosub 15200:poke 646,15:return

37500 rem
37520 i=20-int(len(a$)/2)
37530 print spc(i);a$:return

39400 rem bomb
39410 at=2:dc=2:el=4:rl=1:lq=180:hq=2
39420 wf=128:pt=6:im=0:gosub 40000:return

39500 rem game over
39510 at=7:dc=7:el=0:rl=0:lq=180:hq=6
39520 wf=16:pt=20:im=0:gosub 40000
39530 at=8:dc=3:el=0:rl=0:lq=180:hq=8
39540 wf=16:pt=25:im=0:gosub 40000
39550 at=9:dc=3:el=0:rl=0:lq=180:hq=7
39560 wf=16:pt=34:im=0:gosub 40000:return

39600 rem whoop
39610 at=9:dc=8:el=0:rl=0:lq=180:hq=5
39620 wf=16:pt=30:im=0:gosub 40000:return

39700 rem crumble
39710 at=2:dc=2:el=3:rl=6:lq=100:hq=6
39720 wf=128:pt=15:im=0:gosub 40000:return

39800 rem beep
39810 at=2:dc=3:el=8:rl=2:lq=180:hq=22
39820 wf=16:pt=4:im=1:gosub 40000:return

39850 rem moop
39860 at=4:dc=4:el=12:rl=3:lq=180:hq=12
39870 wf=16:pt=8:im=0:gosub 40000:return


39900 dim vt%(2),vl(2),vw%(2):vc=0:ac=0
39910 si=54272: for i=si to si+24:poke i,0:next
39920 poke si+24,15:return

40000 ic=0:gosub 42000
40010 if vw%(vc)=0 then 40100
40020 vc=vc+1:ic=ic+1
40030 if vc=3 then vc=0
40040 if ic=3 then return
40050 goto 40010
40100 tt=ti:sb=si+vc*7
40110 poke sb+5,at*16+dc
40120 poke sb+6,el*16+rl
40130 poke sb,lq:poke sb+1,hq
40140 vw%(vc)=wf:vl(vc)=tt:poke sb+4,wf+1
40150 vt%(vc)=pt:ac=ac+1
40160 if im=0 then return
40170 tt=ti:if tt-vl(vc)<pt then 40170
40180 poke sb+4,wf:vw%(vc)=0:ac=ac-1
40190 vc=vc+1:if vc=3 then vc=0
40200 return


42000 if ac=0 then return
42005 tt=ti
42010 for hh=0 to 2:if vw%(hh)=0 or tt-vl(hh)<vt%(hh) then 42040
42020 poke si+hh*7+4,vw%(hh):vw%(hh)=0:ac=ac-1
42040 next:return


50000 dim c%(7,4)
50010 for i=0 to 7:for p=0 to 3
50020 read a:c%(i,p)=a
50030 next p,i
50040 gosub 51000:gosub 39900:return
50100 data 108,123,124,126
50110 data 233,223,95,105
50120 data 112,110,109,125
50130 data 127,123,124,127
50150 data 78,77,77,78
50160 data 78,80,76,78
50170 data 85,73,74,75
50180 data 233,123,124,105

51000 rem
51020 poke 53269,0
51030 for i=896 to 959:read v:poke i,v: next
51040 poke 53287,1:poke 2040,14
51060 poke 53248,136:poke 53249,50
51080 poke 53276,0
51090 poke 53277,0:poke 53271,0:return
51100 data 127,254,0,192,3,0,128,1,0,128,1,0,128,1,0,128
51120 data 1,0,128,1,0,128,1,0,128,1,0,128,1,0,128,1
51130 data 0,128,1,0,128,1,0,128,1,0,192,3,0,127,254,0
51140 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1


60000 for qq=49152 to 49520:read dq:pokeqq,dq:next
60001 return
60002 data 76,15,192,76,92,192,76,153,192,76,38,193,76,251,192,32,72,192
60003 data 160,0,177,251,133,2,152,145,251,200,145,251,160,80,165,2,145
60004 data 251,200,145,251,160,40,177,253,160,80,145,253,160,41,177,253
60005 data 160,81,145,253,160,0,177,253,160,40,145,253,160,1,177,253,160
60006 data 41,145,253,96,173,64,3,133,251,56,233,0,133,253,173,65,3,133
60007 data 252,233,212,133,254,96,32,72,192,162,0,160,0,160,2,177,251,72
60008 data 177,253,160,0,145,253,104,145,251,160,3,177,251,72,177,253,160
60009 data 1,145,253,104,145,251,24,173,64,3,105,40,141,64,3,173,65,3,105
60010 data 0,141,65,3,32,72,192,232,224,24,208,203,96,173,64,3,133,251,173
60011 data 65,3,133,252,173,66,3,133,253,173,67,3,133,254,160,0,32,240,192
60012 data 160,1,32,240,192,160,40,32,240,192,160,41,32,240,192,56,165,251
60013 data 233,0,133,251,165,252,233,212,133,252,56,165,253,233,0,133,253
60014 data 165,254,233,212,133,254,160,0,32,240,192,160,1,32,240,192,160
60015 data 40,32,240,192,160,41,32,240,192,96,177,251,72,177,253,145,251
60016 data 104,145,253,96,169,0,141,86,193,169,4,141,87,193,169,0,141,83
60017 data 193,169,200,141,84,193,169,0,141,92,193,169,216,141,93,193,169
60018 data 0,141,89,193,169,204,141,90,193,76,78,193,169,0,141,83,193,169
60019 data 4,141,84,193,169,0,141,86,193,169,200,141,87,193,169,0,141,89
60020 data 193,169,216,141,90,193,169,0,141,92,193,169,204,141,93,193,160
60021 data 4,162,0,189,255,255,157,255,255,189,255,255,157,255,255,232,208
60022 data 241,238,84,193,238,90,193,238,87,193,238,93,193,136,208,226,96
