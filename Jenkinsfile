pipeline {
    agent any
    
    tools {
        maven 'Maven 3.6.2'
    }
    
//     parameters {
//     string(name: 'container_name', defaultValue: 'pagina_web', description: 'Nombre del contenedor de docker.')
//     string(name: 'image_name', defaultValue: 'pagina_img', description: 'Nombre de la imagene docker.')
//     string(name: 'tag_image', defaultValue: 'lts', description: 'Tag de la imagen de la página.')
//     string(name: 'container_port', defaultValue: '81', description: 'Puerto que usa el contenedor')
//   }
    

    
    stages {
        
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                ''' 
            }
        }
        ///////////////
        
        stage('Construir') {
           steps {
               echo 'Contruyendo prueba jenkins pipeline'
//                sh 'mvn -f RESTJerseyEjemplo/pom.xml clean package'
               sh 'mvn  clean package'
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
        
//         stage('build') {
//                environment {
//                     dockerHome = tool 'myDocker'
//            }
            
//       		steps {
//         		dir('RESTJerseyEjemplo') {
//        		   script {
//         		    try {
//           			    sh 'sudo ${dockerHome} stop ${container_name}'
//               			sh 'sudo ${dockerHome} rm ${container_name}'
//               			sh 'sudo ${dockerHome} rmi ${image_name}:${tag_image}'
//             		} catch (Exception e) {
//               			echo 'Exception occurred: ' + e.toString()
//             		}
//           		}
         
//           		sh 'sudo ${dockerHome} build -t ${image_name}:${tag_image} .'
//         		}
//       		}
//     	}
    	
//     	 stage('deploy') {
//       		steps {
//         		sh 'sudo ${dockerHome} run -d -p ${container_port}:80 --name ${container_name} ${image_name}:${tag_image}'
//       			}
//     		}
        
        
        
        
        stage('Push Docker Image') {
            environment {
                dockerHome = tool 'myDocker'
                DOCKER_HUB_LOGIN = credentials('docker-hub')
            }
            steps {
//                 sh '${dockerHome} ps'
                sh '${dockerHome} build -t localhost:8181/RESTJerseyEjemplo/ .'
//                 sh '${dockerHome} login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
            }
        }     
        
        
    }
    
}
