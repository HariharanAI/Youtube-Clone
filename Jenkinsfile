pipeline {
    agent any

    environment {
        IMAGE_NAME = 'youtube-clone'  // Name for your Docker image
        IMAGE_TAG = 'latest'           // Docker image tag
        CONTAINER_NAME = 'youtube-clone-container'  // Name of the Docker container
        CONTAINER_PORT = '5050'        // Internal container port
        HOST_PORT = '5060'             // External host port (mapped to 5050 inside the container)
        HOST_IP = '4.186.32.201'       // External VM IP address
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the Git repository using the provided URL and credentials
                git credentialsId: 'your-credentials-id', branch: 'main', url: 'https://github.com/HariharanAI/Youtube-Clone.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using the Dockerfile in the project
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Stop Existing Container') {
            steps {
                script {
                    // Stop and remove any existing container with the same name
                    sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    """
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container, mapping host IP and port 5060 to container port 5050
                    sh "docker run -d --name ${CONTAINER_NAME} -p ${HOST_IP}:${HOST_PORT}:${CONTAINER_PORT} ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }

    post {
        always {
            // Clean workspace after the build
            cleanWs()
        }
    }
}
