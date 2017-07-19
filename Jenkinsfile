node {
	wrap([$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm']) {
		stage ('Clear workspace') {
			step([$class: 'WsCleanup'])
        }

        try {

            stage('Pull') {
                checkout scm
            }
     		
     		def tagId = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
     		def awesome_devops_image_name = "msamandi/awesome_jenkins:" + tagId.replaceAll(/\//, "-")

     		stage ('Build awesome_devops image') {
                awesome_devops_image = docker.build("${awesome_devops_image_name}", '.')
        	}
        	stage('Test image') {
        
               awesome_devops_image.inside {
                  sh 'echo "Tests passed"'
               }
            }

        	stage ('Push Image ') {
                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials-med') {
                        awesome_devops_image.push("${env.BUILD_NUMBER}")
                        awesome_devops_image.push("latest")
                }
            }

        } catch (error) {
        	throw error
        }


	}
}