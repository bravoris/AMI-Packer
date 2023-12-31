pipeline {
    agent any
    stages{
        stage("AMI Build"){
            steps{
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-jenkins',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    sh "packer init -var-file=variables.pkr.hcl aws.pkr.hcl"
                    sh "packer build -var-file=variables.pkr.hcl aws.pkr.hcl"
                }
            }
        }
    }
}
