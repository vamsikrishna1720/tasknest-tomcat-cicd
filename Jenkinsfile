pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build WAR') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Archive WAR') {
            steps {
                archiveArtifacts artifacts: 'target/tasknest.war', fingerprint: true
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                bat '''
                if exist "C:\\Tomcat\\apache-tomcat-10.1.60\\webapps\\tasknest.war" del /F /Q "C:\\Tomcat\\apache-tomcat-10.1.60\\webapps\\tasknest.war"
                if exist "C:\\Tomcat\\apache-tomcat-10.1.60\\webapps\\tasknest" rmdir /S /Q "C:\\Tomcat\\apache-tomcat-10.1.60\\webapps\\tasknest"
                copy /Y "target\\tasknest.war" "C:\\Tomcat\\apache-tomcat-10.1.60\\webapps\\tasknest.war"
                '''
            }
        }
    }

    post {
        success {
            echo 'TaskNest CI/CD completed successfully.'
        }

        failure {
            echo 'TaskNest CI/CD failed. Check the Jenkins console output.'
        }
    }
}