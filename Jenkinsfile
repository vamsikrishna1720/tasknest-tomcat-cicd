pipeline {
    agent any

    tools {
        maven 'Maven'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'target/tasknest.war', fingerprint: true
            }
        }

        // After Jenkins and Tomcat are configured on EC2,
        // the deployment stage can copy target/tasknest.war
        // to Tomcat's webapps directory.
    }

    post {
        success {
            echo 'TaskNest WAR build completed successfully.'
        }
    }
}
