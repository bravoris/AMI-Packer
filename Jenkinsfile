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
                    sh "packer init ."
                    sh "packer build -var-file=values_pkrvars.hcl aws.pkr.hcl"
                }
            }
        }
    }
}
