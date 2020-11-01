/*cant able to find the nonce when i try to find the 5 leading zeros or more.
but from the results we can prove the time decreases when leading zeros decreases and vice versa

1. for 1 leading Zeros  ----->     {'Block Number': 1, 'Trxns': 'Record1 Record2 Record3 Record4 Record5', 'nonce': 23, 'precioushash': ' ', 'hash': '0a3b29b53fecdb5b199f6e93b0c07a7a102e6934f6d87379f0f5361d9c46db86'}
Runtime of the program is 0.06358885765075684
2.for 2 leading zeros ------> {'Block Number': 1, 'Trxns': 'Record1 Record2 Record3 Record4 Record5', 'nonce': 116, 'precioushash': ' ', 'hash': '0084b0795baed46a5237421ec42c2d59df49eeff277b63712d41c84f196f44d8'}
Runtime of the program is 0.14246225357055664
3.for 3 leading zeros ------> {'Block Number': 1, 'Trxns': 'Record1 Record2 Record3 Record4 Record5', 'nonce': 6041, 'precioushash': ' ', 'hash': '0006ff04df1d0fc36a52eca5963ae801f9f0c839b51d220170117368489a4d4d'}
Runtime of the program is 44.9003791809082 
4.for 4 leading zeros{'Block Number': 1, 'Trxns': 'Record1 Record2 Record3 Record4 Record5', 'nonce': 148651, 'precioushash': ' ', 'hash': '000043dd9ee66675f68597b36e481190aebdf8b8d7a976fa9b569dcb1f1a464d'}
Runtime of the program is 1312.6043605804443*/



!pip install dict_hash

from IPython.display import clear_output
from dict_hash import sha256
import time

def mineBlock(ditBlock):
  flag = True
  nonce = 0
  start = time.time()
  while flag:
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

dit = {}
dit["Block Number"] = 1
dit["Trxns"] = "Record1 Record2 Record3 Record4 Record5"
dit["nonce"]=0
dit["precioushash"] = " "
dit["hash"] = sha256(dit)


mineBlock(dit)
