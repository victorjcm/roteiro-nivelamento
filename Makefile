# Variáveis 
TCL_SCRIPT = scripts/relatorio.tcl
SH_SCRIPT  = projeto/script.sh
RELATORIO  = relatorio.txt

# Target principal
all: $(RELATORIO)

# Como gerar o relatório 
$(RELATORIO): $(TCL_SCRIPT) $(SH_SCRIPT)
	@echo ">> Executando shell script..."
	bash $(SH_SCRIPT)

	@echo ">> Executando script TCL..."
	tclsh $(TCL_SCRIPT)
	
	@echo ">> Relatório gerado!"
	tclsh $(TCL_SCRIPT) > relatorio.txt

# Limpeza 
clean:
	@echo ">> Removendo relatório..."
	rm -f $(RELATORIO)
