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

     		stage ('Build Inspect image') {
                awesome_devops_image = docker.build("${awesome_devops_image_name}", '.')
        	}

        } catch (error) {
        	throw error
        }

	}
}