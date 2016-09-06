#!/bin/bash
# Script para configuração do sistema ValkyrieOS por Marcelo Rocha 05/09/2016

dialog --msgbox "

           __________________________________\n
            / _______by__M_._R_o_c_h_a________ \ \n
           / /                                \ \ \n
          | |                                  | |\n
          | |   Configurador ValkyrieOS 2.0    | |\n
          | |                                  | |\n
          | |  O programa vai :                | |\n
          | |                                  | |\n
          | |  1 - Configurar o Teclado ABNT2  | |\n
          | |  2 - Configurar o Idioma pt_BR   | |\n
          | |  3 - Configurar o Java JDK/JRE   | |\n
          | |  4 - Ativar o Login Grafico OPC. | |\n
          | |  6 - Configurar o Slapt-get      | |\n
          | |  7 - Configurar o Slackpkg       | |\n
          | |  8 - Finalizar o programa        | |\n
          \ \__________________________________/ /\n
           \____________________________________/\n" 25 65
    dialog --msgbox "Este programa vai fazer alterações na sua maquina!" 10 50
    dialog --msgbox "Digite 1 para continuar ou 2 para sair e aperte ENTER " 10 50
    read eula
    echo ""
	if [ $eula = 1 ]; then
    echo ""
	elif [ $eula = 2 ]; then
    exit
	else
    dialog --msgbox "Opção Inválida" 10 50 && exit
	fi;
    cd arquivos
    cp lang.sh /etc/profile.d/lang.sh
    cp 90-keyboard-layout.conf /etc/X11/xorg.conf.d/
    ln -s /usr/lib64/java/bin/java /usr/bin/java
    dialog --msgbox "Agora você vai escolher se quer ativar o login grafico: digite 1 para SIM ou 2 para NÃO ok" 10 50
    read login
    echo ""
        if [ $login = 1 ]; then
    echo ""
    cp inittab /etc/inittab
        elif [ $login = 2 ]; then
    echo ""
        else
    dialog --msgbox "Opção Inválida" 10 50 && exit
        fi;
    cp slapt-getrc /etc/slapt-get/slapt-getrc
    cp mirrors /etc/slackpkg/mirrors
    dialog --msgbox "Obrigado por utilizar o Valkyrie Easier by M. Rocha" 10 50
	exit
