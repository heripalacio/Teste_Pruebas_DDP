pipeline {
    agent any
    
    triggers {
        pollSCM('* * * * *')
    }
    
    stages {
        stage('Compile') {
            steps {
                sh 'mvn compile'
            }
        }
        
        stage('Run Tests') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit '**/target/surefire-reports/*.xml'
                }
                success {
                    echo 'All tests passed!'
                }
                failure {
                    error 'Some tests failed!'
                }
            }
        }
        
        stage('Load Jacoco') {
            steps {
                sh 'mvn jacoco:report'
                jacoco(execPattern: '**/target/jacoco.exec')
            }
        }
        
        stage('Deploy to SonarQube') {
            steps {
                withSonarQubeEnv('SonarQubePruebas') {
                    sh 'mvn sonar:sonar'
                }
            }
        }
    }
}
