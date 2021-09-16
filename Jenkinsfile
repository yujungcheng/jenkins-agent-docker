def jenkins_agent_label = "nuc10"

def git_repo_url = "https://github.com/yujungcheng/jenkins_agent_docker.git"
def git_repo_name = "jenkins_agent_docker"

def ssh_key_name = "jenkins_agent_key"  // default key name
def docker_image_name = "ubuntu-jenkins-agent:test"
def docker_hostport = "2222"


pipeline {

    agent { node { label "${jenkins_agent_label}" } }
        
    stages {
        stage("git clone jenkins agent repo") {
            steps {
                git url: "${git_repo_url}"
                dir("${git_repo_name}") {
                    sh "pwd"
                }
                sh '''
                    echo "--------------------------------------"
                    ls -l
                    echo "--------------------------------------"
                '''
            }
        }
        
        stage("generate ssh key") {
            steps {
                sh "./generate-jenkins-agent-ssh-key.sh ${ssh_key_name}"
            }
        }

        stage('build ubuntu jenkins agent image') {
            steps {
                sh "./build-ubuntu-jenkins-agent-image.sh ${docker_image_name}"
            }
        }
        
        stage('run ubuntu jenkins agent docker') {
            steps {
                sh "./run-jenkins-ssh-agent-docker.sh ${ssh_key_name} ${docker_hostport} ${docker_image_name}"
            }
        }

        stage('check ssh login') {
            steps {
                retry(3) {
                    sh "./ssh-to-jenkins-agent-docker.sh ${docker_hostport} hostname"
                }
                timeout(time: 1, unit: 'SECONDS') {
                    sh "./ssh-to-jenkins-agent-docker.sh ${docker_hostport} 'uname -r'"
                }
            }
        }
    }
    
    post {
        always('remove ubuntu jenkins agent docker') {
            sh """
                docker ps -f name=jenkins_agent_${docker_hostport} -q
                docker stop jenkins_agent_${docker_hostport}
                docker rm jenkins_agent_${docker_hostport}
                docker rmi ${docker_image_name}
            """
            sh "./clean-jenkins-agent-ssh-key.sh ${ssh_key_name}"
        }
    }
}
