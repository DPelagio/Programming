import socket
from Crypto.Cipher import DES
from Crypto.Cipher import AES
import timeit
import itertools

def cifrarBloque(bloque, llave):
    cifrado="";
    for i in range(0,4):
        cifrado+=chr(ord(bloque[i])^llave[i]); # ^ es un XOR
    return cifrado;

def ECB(mensaje, llaveTexto): #Encriptado Electronic code block, con bloques de 4 espacios
    if len(mensaje)%4!=0:
        for i in range(1,4-int(len(mensaje)%4)):
            mensaje+="!";
        print(mensaje)
        llave=[];
        for c in llaveTexto:
            llave.append(ord(c)); #ord convierte la letra en su valor ascii
        cifrado="";
        for i in range(0, int(len(mensaje)/4)):
            cifrado+=cifrarBloque(mensaje[(i*4):(i*4)+4], llave);
        return cifrado;

key = b'holaesto'
cipherDes = DES.new(key, DES.MODE_ECB)

s=socket.socket();
s.bind(("localhost", 8000));
s.listen();
c, addr=s.accept();
with c:
    data=c.recv(1024);
    data=cipherDes.decrypt(data);
    print(data.decode('utf-8'));
s.close();