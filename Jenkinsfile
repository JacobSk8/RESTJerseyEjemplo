pipeline {
    agent any
    
    tools {
        maven 'maven-local'
    }
    
    stages {
        stage('Construir') {
           steps {
               sh 'mvn -f RESTJerseyEjemplo/pom.xml clean package'
           }
        }
        
        stage('Controlar calidad') {
           environment {
                   scannerHome = tool 'saviasoft-sonar-scanner'
           }
           
           steps {
              withSonarQubeEnv('saviasoft-sonar') {
                sh "${scannerHome}/bin/sonar-scanner -Dproject.settings=RESTJerseyEjemplo/sonar-project.properties"
              }
              
              timeout(time: 5, unit: 'MINUTES') {
                waitForQualityGate abortPipeline: true
              }
           }
        }
    }
    
 post {
        success {  
             mail bcc: '', body: "<b>lizJac CI</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "lizJac CI - EXITO: Project name -> ${env.JOB_NAME}", to: "jacob.cumbal@saviasoft.com,lcp.caiza@yavirac.edu.ec";  
        }  
        failure {  
             mail bcc: '', body: "<b>lizJac CI</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "lizJac CI - ERROR: Project name -> ${env.JOB_NAME}", to: "jacob.cumbal@saviasoft.com,lcp.caiza@yavirac.edu.ec";  
        }  
        unstable {  
            mail bcc: '', body: "<b>lizJac CI</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "lizJac CI - INESTABLE: Project name -> ${env.JOB_NAME}", to: "jacob.cumbal@saviasoft.com,lcp.caiza@yavirac.edu.ec";  
        }  
    }
}