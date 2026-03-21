
puts " === HIERARQUIA DO DESIGN ==="

package require Tk

# 1. Criar o widget
ttk::treeview .tree -show tree
pack .tree -fill both -expand true

# 2. Criar o nó PAI (o primeiro argumento {} significa que ele não tem pai, ou seja, é raiz)
# Guardamos o ID do pai na variável 'idPai'
set idSomador [.tree insert {} end -text "somador_4bits"]

# 3. Criar os FILHOS dentro do PAI (passamos '$idPai' como o primeiro argumento)
.tree insert $idSomador end -text "(apenas células primitivas"


set idContador [.tree insert {} end -text "contador_4bits"]

.tree insert $idContador end -text "flipflop_D (4 instancias)"
.tree insert $idContador end -text "(celulas primitivas)"

set idFlipflop_D [.tree insert {} end -text "flipflop_D"]
.tree insert $idFlipflop_D end -text "(celulas primitivas)"




# Dica: Abrir a árvore automaticamente para mostrar os filhos
.tree item $idSomador -open true
.tree item $idContador -open true
.tree item $idFlipflop_D -open true


set arquivo "contador_netlist.tcl" ; #inicia o arquivo
set f [open $arquivo r]

#inicializa contador
set and2 0
set xor2 0
set ff 0

while {[gets $f linha] != -1} {
	#remove espaço em branco
	set linha [string trim $linha]

	#busca por padrões, regex retorna 1 se encontrar e 0 se nao
	if {[regexp {^AND2\S+} $linha]} { incr and2}
	if {[regexp {^XOR2\s+} $linha]} { incr xor2 }
	if {[regexp {^flipflop_D\s+} $linha]} { incr ff }
}

close $f

# Calcula o total
set total [expr {$and2 + $xor2 + $ff}]

# Imprime o Relatório
puts " === RELATÓRIO DE CÉLULAS === "
puts "AND2: $and2 instâncias"
puts "XOR2: $xor2 instâncias"
puts "flipflop_D: $ff instâncias"
puts "TOTAL: $total instâncias"


