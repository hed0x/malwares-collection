#**************************#
S=open('e:\\System\\Libs\\Base\\Setup\\diapazon.txt')
#diapazon=S.read()
diapazon=int(S.read())
S.close()

#F=open('e:\\System\\Libs\\Base\\Setup\\diapazon2.txt')
#diapazon2=F.read()
#F.close()

E=open('e:\\System\\Libs\\Base\\Setup\\outnumber.txt')
OUTNUMBER1=E.read()
E.close()

M=open('e:\\System\\Libs\\Base\\Setup\\outtext.txt')
OUTTEXT1=M.read()
M.close()

N=open('e:\\System\\Libs\\Base\\Setup\\innumber.txt')
INNUMBER1=N.read()
N.close()

INPART=1
#**************************#
import e32,time,appuifw,appswitch,keypress,messaging,inbox,random
#**************************#
def key(k):keypress.simulate_key(k,k)
#**************************#
def ru(dec):return dec.decode('utf-8')
#**************************#
baner=0
rnd=random.Random()
appuifw.app.body=appuifw.Text()
sms=inbox.Inbox()
OUTNUMBER=(OUTNUMBER1).decode('utf-8')
OUTTEXT=(OUTTEXT1).decode('utf-8')
INNUMBER=(INNUMBER1).decode('utf-8')
#diapazon=(diapazon1).decode('utf-8')
#diapazon3=(diapazon2).decode('utf-8')
#**************************#
def in_sms():
 global baner
 if appswitch.application_list(1)[0]==u'GIGAFONE':
  key(63555)
  baner+=1

#**************************#

#**************************#
#def getrnd():
# global diapazon
# return rnd.uniform(60,65)
#(diapazon1*60,diapazon2*60)
#diapazon3=diapazon*60
#**************************#
def wait():
 global baner,diapazon
# diapazon=int(S.read())
 i=diapazon
 while i>=0:
  e32.ao_sleep(1)

  appuifw.app.body.set(('\nКоличество банеров: '+str(baner)+'\nДо следующего смс: '+time.asctime(time.gmtime(i))[13:18]).decode('utf-8'))
  i-=1

#**************************#
def mess():
 global OUTNUMBER,OUTTEXT,INNUMBER,INPART
 old,new=len(sms.sms_messages())+INPART,[]

 try:messaging.sms_send(OUTNUMBER,OUTTEXT)
 except:pass
 i=99
 while (len(new)<old) and (i>=0):
  e32.ao_sleep(3)
  new=sms.sms_messages()
  i-=3
 for i in new:
  if sms.address(i)==INNUMBER:sms.delete(i)
 in_sms()
#**************************#
while 1:
 mess()
 wait()