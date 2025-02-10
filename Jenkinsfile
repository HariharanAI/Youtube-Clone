pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    cleanWs() // Clean workspace before checkout
                    git branch: 'main', url: 'https://github.com/HariharanAI/Youtube-Clone.git'
                }
            }
        }

        stage('Deploy to Web Server') {
            steps {
                script {
                    sh '''
                    sudo rm -rf /var/www/html/youtube-clone
                    sudo mkdir -p /var/www/html/youtube-clone
                    sudo cp -r * /var/www/html/youtube-clone
                    '''
                }
            }
        }

        stage('Install Nginx & Configure') {
            steps {
                script {
                    sh '''
                    # Install Nginx if not installed
                    if ! command -v nginx > /dev/null; then
                        echo "Nginx not found. Installing..."
                        sudo apt update && sudo apt install -y nginx
                    fi

                    # Ensure necessary directories exist
                    sudo mkdir -p /etc/nginx/sites-available
                    sudo mkdir -p /etc/nginx/sites-enabled

                    # Create Nginx config
                    echo "server {
                        listen 8081;
                        server_name _;
                        root /var/www/html/youtube-clone;
                        index yt.html;
                        location / {
                            try_files $uri $uri/ =404;
                        }
                    }" | sudo tee /etc/nginx/sites-available/youtube-clone

                    # Enable the site
                    sudo ln -sf /etc/nginx/sites-available/youtube-clone /etc/nginx/sites-enabled/

                    # Test Nginx Configuration
                    sudo nginx -t

                    # Reload Nginx if configuration is valid
                    sudo systemctl reload nginx
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment Successful! YouTube Clone is running on port 8081."
        }
        failure {
            echo "❌ Deployment Failed! Check logs."
        }
    }
}
