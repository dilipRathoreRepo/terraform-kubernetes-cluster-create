node {
	try {
            notify('Started')
            
            stage('Checkout') {
                checkout scm
            //    git 'https://github.com/dilipRathoreRepo/terraform-kubernetes-cluster-create.git'
            }
            
            stage('Setup Terraform') {
                sh label: '', script: '/usr/local/bin/google-cloud-sdk/bin/gcloud config list'
                sh label: '', script: 'export PATH=$PATH:/usr/local/bin'
                sh label: '', script: '/usr/local/bin/terraform -version' 
            }

            stage('Terraform Plan') {
                sh label: '', script: '/usr/local/bin/terraform init'
                sh label: '', script: "/usr/local/bin/terraform plan > output_${env.BUILD_NUMBER}"
                sh label: '', script: "cat output_${env.BUILD_NUMBER}"
            }
            notify('Deploy to production ?')
            input 'Deploy to production?'

            stage('Build Terraform') {
                sh label: '', script: '/usr/local/bin/terraform init'
                sh label: '', script: '/usr/local/bin/terraform apply -auto-approve'
            }
                
            notify('Done')
            
    } catch (err) {
        notify("Error ${err}")
        currentBuild.result = 'FAILURE'
    }
}

def notify(status){
    emailext (
      to: "dilip.rathore.infosys@gmail.com",
      subject: "${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
      body: """<p>${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
        <p>Check console output at <a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a></p>""",
    )
}
