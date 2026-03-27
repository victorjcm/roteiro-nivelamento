#!/bin/bash

# Verifica se existem arquivos .v (metodo para nao imprimir o comando, apenas executar)
if ls *_tb.v >/dev/null 2>&1; then

    # Criar diretório apenas se necessário 
    if [ ! -d "tb" ]; then
        mkdir tb
        echo "Pasta 'tb/' criada."
    fi

    # Loop para mover arquivo por arquivo
    for arquivo in *_tb.v; do
        #  Verifica se o arquivo já existe no destino
        if [ -e "tb/$arquivo" ]; then
            echo "Aviso: '$arquivo' já existe em 'tb/'. Pulando para não sobrescrever."
        else
            #  Mostra o que está sendo movido 
            echo "Movendo: $arquivo -> tb/"
            mv "$arquivo" tb/
        fi
    done
else
    #  Funciona se o tipo não estiver presente 
   echo "Nenhum arquivo encontrado no diretório atual."
fi
if ls *.v >/dev/null 2>&1; then

    #  Criar diretório apenas se necessário
    if [ ! -d "src" ]; then
        mkdir src
        echo "Pasta 'src/' criada."
    fi

    # Loop para mover arquivo por arquivo
    for arquivo in *.v; do
        #  Verifica se o arquivo já existe no destino 
        if [ -e "src/$arquivo" ]; then
            echo "Aviso: '$arquivo' já existe em 'src/'. Pulando para não sobrescrever."
        else
            #  Mostra o que está sendo movido 
            echo "Movendo: $arquivo -> src/"
            mv "$arquivo" src/
        fi
    done
else
    #  Funciona se o tipo não estiver presente 
   echo "Nenhum arquivo encontrado no diretório atual."
fi
if ls *.vh >/dev/null 2>&1; then

    #  Criar diretório apenas se necessário 
    if [ ! -d "include" ]; then
        mkdir include
        echo "Pasta 'include/' criada."
    fi

    # Loop para mover arquivo por arquivo
    for arquivo in *.vh; do
        #  Verifica se o arquivo já existe no destino 
        if [ -e "include/$arquivo" ]; then
            echo "Aviso: '$arquivo' já existe em 'include/'. Pulando para não sobrescrever."
        else
            #  Mostra o que está sendo movido
            echo "Movendo: $arquivo -> include/"
            mv "$arquivo" include/
        fi
    done
else
    #Funciona se o tipo não estiver presente 
   echo "Nenhum arquivo encontrado no diretório atual."
fi
if ls *.tcl *do >/dev/null 2>&1; then

    #  Criar diretório apenas se necessário 
    if [ ! -d "scripts" ]; then
        mkdir scripts
        echo "Pasta 'scripts/' criada."
    fi

    # Loop para mover arquivo por arquivo
    for arquivo in *.tcl *.do; do
        #  Verifica se o arquivo já existe no destino 
        if [ -e "scripts/$arquivo" ]; then
            echo "Aviso: '$arquivo' já existe em 'scripts/'. Pulando para não sobrescrever."
        else
            #  Mostra o que está sendo movido
            echo "Movendo: $arquivo -> scripts/"
            mv "$arquivo" scripts/
        fi
    done
else
    #Funciona se o tipo não estiver presente 
   echo "Nenhum arquivo encontrado no diretório atual."
fi
if ls *.md >/dev/null 2>&1; then

    #  Criar diretório apenas se necessário 
    if [ ! -d "docs" ]; then
        mkdir docs
        echo "Pasta 'docs/' criada."
    fi

    # Loop para mover arquivo por arquivo
    for arquivo in *.md; do
        #  Verifica se o arquivo já existe no destino 
        if [ -e "docs/$arquivo" ]; then
            echo "Aviso: '$arquivo' já existe em 'docs/'. Pulando para não sobrescrever."
        else
            #  Mostra o que está sendo movido
            echo "Movendo: $arquivo -> docs/"
            mv "$arquivo" docs/
        fi
    done
else
    #Funciona se o tipo não estiver presente 
   echo "Nenhum arquivo encontrado no diretório atual."
fi


