pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: some-label-value
spec:
  containers:
  - name: rubyci
    image: ruby:2.5
    command:
    - cat
    tty: true
"""
    }
  }
  stages {
    stage('Run tests') {
      steps {
        container('rubyci') {
          sh 'bundle install && rake test'
        }
      }
    }
  }
}
