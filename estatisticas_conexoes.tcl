# ============================================
# Script TCL - Análise de Nets e Fanout
# ============================================

# Arquivo de entrada
set file "contador_netlist.tcl"

# Abre arquivo
set fp [open $file r]

# Arrays
array set fanout {}
array set drivers {}
array set nets {}

# Loop leitura
while {[gets $fp line] >= 0} {

    # Remove comentários
    regsub {//.*} $line "" line

    # Procura conexões .porta(net)
    set matches [regexp -all -inline {\.(\w+)\(([^)]+)\)} $line]

    foreach {full port net} $matches {

        set net [string trim $net]

        # Ignorar constantes (ex: 1'b1)
        if {[string match "*'*" $net]} {
            continue
        }

        # Registrar net
        set nets($net) 1

        # Se for saída → driver
        if {$port eq "y" || $port eq "Q"} {
            set drivers($net) 1
        } else {
            # Entrada → conta fanout
            if {[info exists fanout($net)]} {
                incr fanout($net)
            } else {
                set fanout($net) 1
            }
        }
    }
}

# Fecha arquivo
close $fp

# ============================================
# RELATÓRIO FINAL
# ============================================

# Monta lista para ordenação
set lista {}
foreach net [array names fanout] {
    lappend lista [list $net $fanout($net)]
}

# Ordena por fanout decrescente
set ordenado [lsort -integer -decreasing -index 1 $lista]

# ===== TOP 10 =====
puts "\n=== TOP 10 NETS POR FANOUT ==="

foreach item [lrange $ordenado 0 9] {
    set nome [lindex $item 0]
    set valor [lindex $item 1]
    puts "$nome: fanout = $valor"
}

# ===== FANOUT ZERO =====
puts "\n=== NETS COM FANOUT ZERO (POSSÍVEIS ERROS) ==="

set encontrou 0

foreach net [lsort [array names nets]] {
    if {![info exists fanout($net)]} {
        puts $net
        set encontrou 1
    }
}

if {$encontrou == 0} {
    puts "Nenhuma net com fanout zero encontrada"
}

