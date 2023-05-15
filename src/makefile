# Nome do arquivo de saída (executável)
OUTFILE = main

# Caminho dos arquivos de origem
SRCDIR = modules

# Arquivos de origem
SRC = $(wildcard $(SRCDIR)/*.v) main.v

# Comando de compilação
IVERILOG =  iverilog -g2005-sv

all: $(OUTFILE)

$(OUTFILE): $(SRC)
	$(IVERILOG) -o $(OUTFILE) $(SRC)

clean:
	rm -f $(OUTFILE)
