#!/bin/bash
######################################################################
# Tomatito: pomodoro timer
######################################################################

ayuda () {
    echo "Tomatito

    Script para cronometrar pomodoros: 
    
    * un pomodoro son 25 minutos; 
    * por cada pomodoro completado hay un receso de 5 minutos; 
    * al cuarto pomodoro hay un recreo de 20.... 
    * Ahí el programa termina (después del recreo). 
    
    Reiniciar para recomenzar el ciclo.
    
                                MarxBro. WTFPL. 2016
        "
}

[ "$1" ] && ayuda && exit 0

POMODORO=1500                   # 25 minutos
POMODORO_RECREO=600             # 5 minutos
POMODORO_CONTADOR=0             # Al cuarto, recreo largo...
POMODORO_RECREO_LARGO=1200      # Largo de veinte minutos.

# Funciones
notificar (){
    notify-send "$1"
}

notificar_comienzo (){
    notificar 'Comenzando a trabajar: pomodoro!'
}

notificar_final (){
    notificar 'Pomodoro finalizado. Ahora es tu recreo de 5 minutos.'
    sleep $POMODORO_RECREO && pomodoro_start
}

notificar_FIN (){
    notificar 'Pomodoro finalizado. Este es el cuarto, así que ahora es tu recreo de 20 minutos.'
    sleep $POMODORO_RECREO_LARGO && notificar_pomodoro_reinicio
}

notificar_pomodoro_reinicio (){
    notificar 'Cuatro pomodoros, tres breves recreos y uno largo. Para recomenzar, reiniciar el programa!'
    exit 0
}

pomodoro_start(){
    let POMODORO_CONTADOR++
    notificar_comienzo
    sleep $POMODORO
    if ((POMODORO_CONTADOR == 4)); 
        then
            notificar_FIN
        else
            notificar_final
    fi
}

# Main
pomodoro_start
