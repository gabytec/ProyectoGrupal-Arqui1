fuente = open("3.txt","r")
mif = open("PixelMif.mif","w")

mif.write("DEPTH = 614408;\n")
mif.write("WIDTH = 32; \n")
mif.write("ADDRESS_RADIX = DEC; \n")
mif.write("DATA_RADIX = BIN;  \n")
mif.write("CONTENT\n")
mif.write("BEGIN\n")

contdir = 0
for pixel in fuente:
    for valor in pixel.split():
        resultado = str(contdir) + " : " + str(bin(int(valor))[2:].zfill(32))+";"
        mif.write(resultado)
        mif.write("\n")
        contdir+=1
mif.write("END\n")
mif.close()
    
