pipeline {
     agent any
	 options{
        buildDiscarder(logRotator(numToKeepStr: '7', daysToKeepStr: '7'))
        timestamps()
        }
     
        environment {
		
		           chart = 'loan-calculator'
		           KUBECONFIG= '/var/lib/jenkins/kubernetes/AKS-CLUSTER-1/config'
		
		
        dockerImage = ''
    }
    
    stages {

        stage ('1-GITHUB-Repo-checkout') {
            steps {
              git (url:'https://github.com/akashbrvs/helm-loan-calculator', branch: 'main', credentialsId: 'GITHUB')
            }
        }
       
        stage ('2-Helm chart install/uninstall') {
            steps {
                
                script {
                    sh 'sh install.sh ${ACTION} ${chart}'
                }
            }
        }
       
    }
  
 }
