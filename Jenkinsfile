@Library('CostaisaPipelineLibraryNew@feature/develop') _

def mails="jbravo@costaisa.com"
def pipeParams = [:]

pipeParams['ARTIFACTID']="spring-petclinic"

properties([
  costaisaDiscardOldBuildsProperty(),
  disableConcurrentBuilds()
])


node(){
	
	try {
		stage('Checkout') {
			deleteDir()
			checkout scm
		}
		
		stage('Deploy') {
			ccaDeploySlotsRancherCostaisa(
			    name: "${pipeParams['ARTIFACTID']}",
			    envName: "costaisa-int"
			)
		}

	    
	}catch (Exception e) {
       currentBuild.result = "FAILURE"
       throw e
	}
	
	sendMail(
       subjectPrefix: "[${pipeParams['ARTIFACTID']} - CI]",
       onSuccess: true,
       to: "${mails}"
   )
	
}
