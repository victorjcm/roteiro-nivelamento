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

