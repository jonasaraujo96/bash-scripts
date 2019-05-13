#!/bin/bash
INICIO=`date +%d/%m/%Y-%H:%M:%S`
LOG=/var/log/servidor/log.txt

echo " " >> $LOG
echo "|------------------Projeto WEB----------------------" >> $LOG
echo " Sincronizacao iniciada em $INICIO" >> $LOG

# --- Buildando  ---
cd /home/jonas/Desktop/T\&T\ Sistemas/Dashboards/web/
ng build --prod

# --- Copiando para o servidor --- 
scp /home/jonas/Desktop/T\&T\ Sistemas/Dashboards/web/dist/FrontDashTecparAngular/* root@999.9.99.9:/home/tetsistemas/web/public_html/ >> $LOG

# --- Commitando ---
git add *
git checkout desenvolvimento
git commit -m "$1"
git push

FINAL=`date +%d/%m/%Y-%H:%M:%S`
echo " Sincronizacao Finalizada em $FINAL" >> $LOG
echo "|--------------------------------------------" >> $LOG
echo " " >> $LOG

