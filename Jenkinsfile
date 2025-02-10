pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/HariharanAI/Youtube-Clone.git'
            }
        }
        stage('Deploy to Web Server') {
            steps {
                script {
                    def deployPath = "/var/www/html/youtube-clone"
                    
                    // Remove old files
                    sh "sudo rm -rf ${deployPath}"
                    
                    // Copy new files
                    sh "sudo mkdir -p ${deployPath}"
                    sh "sudo cp -r * ${deployPath}"
                    
                    // Restart Nginx (if you're using it)
                    sh "sudo systemctl restart nginx || echo 'Nginx not installed, skipping restart'"
                }
            }
        }
    }
}
