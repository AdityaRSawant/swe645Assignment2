pipeline {
	agent any
	environment {
		DOCKERHUB_PASS = credentials('Most@8518')
	}
	stages {
		stage("Building student survey image") {
			steps{
				script {
					checkout scm
					sh 'rm -rf *.war'
					sh 'jar -cvf swe_645_assignment_1 -C WebContent/ .'
					sh 'echo ${BUILD_TIMESTAMP}'
					sh "docker login -u kpatil1912 -p ${Most@8518}"
					def customImage = docker.build("kpatil1912/swe645assignment2:${BUILD_TIMESTAMP}")
				}
			}
		}

		stage("Pushing image to dockerhub") {
			steps{
				script{
					sh 'docker push kpatil1912/swe645assignment2:${BUILD_TIMESTAMP}'
				}
			}
		}

		stage("Deployment to Rancher as single pod") {
			steps{
				sh 'kubectl set image deployment/stusurvey-pipeline stusurvey-pipeline=kpatil1912/swe645assignment2:${BUILD_TIMESTAMP} -n jenkins-pipeline'
			}
		}

		stage("Deploying to rancher as with load balancer){
			steps{
				sh 'kubectl set image deployment/stusurvey-lb stusurvey-lb=kpatil1912/swe645assignment2:${BUILD_TIMESTAMP} -n jenkins-pipeline'
			}
		}
	}
}
