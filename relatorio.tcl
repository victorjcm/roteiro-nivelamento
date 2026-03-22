set contador [open "contador_netlist.tcl" r]

while {[gets $contador linha] != -1} {
	puts $linha
	
	}

close $contador
