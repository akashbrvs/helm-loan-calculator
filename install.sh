#!/bin/bash
ACTION=$1
CHART=$2
STATUS=$(helm status $CHART 2> /dev/null | grep 'STATUS' | cut -f2 -d":" |xargs)
if [ "$ACTION" = "install" ]; then
    echo -e "\nchecking Helm chart $CHART \n"
       if [ "$STATUS" = "deployed" ]; then
          echo -e "\nHelm chart $CHART is already installed \n"
          echo -e "\nUpgrading Helm chart $CHART\n"
          helm upgrade $CHART ./helm-chart
       else
          echo -e "\nHelm chart $CHART is not installed\n "
          echo -e "\nInstalling Helm chart $CHART\n"
          helm install $CHART ./helm-chart
       fi
elif [ "$ACTION" = "uninstall" ]; then
     if [ "$STATUS" = "deployed" ]; then
          echo -e "\nHelm chart $CHART is installed\n "
          echo -e "\nUninstalling $CHART\n"
       else
          echo -e "\nHelm chart $CHART is not installed \n"
       fi
else
      echo -e "\nWrong action please select install or uninstall\n"    
fi

