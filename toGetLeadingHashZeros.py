!pip install dict_hash

from IPython.display import clear_output
from dict_hash import sha256
import time

def mineBlock(ditBlock):
  flag = True
  nonce = 0
  start = time.time()
  lastValue = nonce + 1000000 ;
  while flag and nonce <= lastValue:
    dit["nonce"] = nonce 
    hsh = sha256(ditBlock)
    pos1 = hsh[0]
    pos2 = hsh[1]
    pos3 = hsh[2]
    pos4 = hsh[3]
    pos5 = hsh[4]
    pos6 = hsh[5]
    pos7 = hsh[6]
    pos8 = hsh[7]
    pos9 = hsh[8]
    pos10 = hsh[9]


    if pos1 ==  pos2 == pos3 == pos4 == pos5 == pos6 == pos7 == pos8 == pos9 == pos10 == '0':
      flag = False
      dit["hash"] = hsh
      print(ditBlock)
      end = time.time()
      print(f"Runtime of the program is {end - start}")
    else :
      print (nonce)
      clear_output(wait=True)
      nonce = nonce + 1
  else:
    print(f"Nonce value exceeded {lastValue}")

dit = {}
dit["Block Number"] = 1
dit["Trxns"] = "Record1 Record2 Record3 Record4 Record5"
dit["nonce"]=0
dit["precioushash"] = " "
dit["hash"] = sha256(dit)


mineBlock(dit)
