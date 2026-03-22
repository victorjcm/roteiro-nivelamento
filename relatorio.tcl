# TAREFA 1
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
	if {[regexp {^AND2\s+} $linha]} { incr and2}
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

puts "\n"
puts "\n"
puts "\n"



# TAREFA 2
set f [open "contador_netlist.tcl" r]

set current_module ""
array set hierarchy {}

while {[gets $f line] >= 0} {

    # detectar módulos
    if {[regexp {module\s+(\w+)} $line -> mod]} {
        set current_module $mod
        set hierarchy($current_module) {}
        continue
    }

    # detectar instâncias
    if {[regexp {^\s*(\w+)\s+\w+\s*\(} $line -> sub]} {
        if {$current_module ne ""} {
            lappend hierarchy($current_module) $sub
        }
    }
}

close $f

puts "=== HIERARQUIA DO DESIGN ===\n"

foreach module [array names hierarchy] {

    puts $module

    set subs $hierarchy($module)

    if {[llength $subs] == 0} {
        puts " └── (módulo primitivo - sem submódulos)\n"
        continue
    }

    # contar instâncias
    array set count {}

    foreach s $subs {
        if {[info exists count($s)]} {
            incr count($s)
        } else {
            set count($s) 1
        }
    }

    # verificar se só tem células primitivas
    set printed 0
    foreach sub [array names count] {
        if {$sub eq "flipflop_D"} {
            puts " ├── $sub ($count($sub) instâncias)"
            puts " │    └── (células primitivas)"
            set printed 1
        }
    }

    if {!$printed} {
        puts " └── (apenas células primitivas)"
    }

    puts ""
}
