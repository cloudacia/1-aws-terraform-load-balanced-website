pipeline {
    agent any    

     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }


    stages {
        stage('checkout') {
            steps {
              git "https://github.com/cloudacia/1-aws-terraform-load-balanced-website.git"
              }
            }

        stage('init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('validate') {
          steps{
            sh 'terraform validate'
          }
        }

        stage('plan') {
          steps{
            sh 'terraform plan -input=false -out tfplan'
          }
        }

        stage('apply') {
          steps{
            sh 'terraform apply "tfplan" -auto-approve'
          }
        }
      }

      post {
        // Clean after build
        always {
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
                               [pattern: '.propsfile', type: 'EXCLUDE']])
        }
      }
    }
