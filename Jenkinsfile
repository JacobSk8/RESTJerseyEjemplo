pipeline {
    agent any
    
    tools {
        maven 'maven-local'
    }
    
    stages {
        stage('Construir') {
           steps {
               echo 'Contruyendo prueba jenkins pipeline'
            //   sh 'mvn -f RESTJerseyEjemplo/pom.xml clean package'
           }
        }
        
        stage('Controlar calidad') {
           environment {
                   scannerHome = tool 'pruebas-sonar-scanner'
           }
           
           steps {
               echo 'Control de Calidad prueba jenkins pipeline'
              withSonarQubeEnv('sonar-scanner') {
//                 sh "${scannerHome}/bin/sonar-scanner -Dproject.settings=RESTJerseyEjemplo/sonar-project.properties"
                   sh "${scannerHome}/bin/sonar-scanner -Dproject.settings=sonar-project.properties"
              }
              
           }
        }
    }
    
 post {
        success {  
             mail bcc: '', body: "<b>lizJac CI</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "lizJac CI - EXITO: Project name -> ${env.JOB_NAME}", to: "jacob.cumbal@saviasoft.com";  
        }  
        failure {  
             mail bcc: '', body: "<b>lizJac CI</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "lizJac CI - ERROR: Project name -> ${env.JOB_NAME}", to: "jacob.cumbal@saviasoft.com";  
        }  
        unstable {  
            mail bcc: '', body: "<b>lizJac CI</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "lizJac CI - INESTABLE: Project name -> ${env.JOB_NAME}", to: "jacob.cumbal@saviasoft.com";  
        }  
    }
}
