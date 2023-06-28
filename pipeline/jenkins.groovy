pipeline {
    agent any
    
    parameters {

        choice(name: 'OS', choices: ['linux', 'darwin', 'windows', 'darwin', 'all'], description: 'Pick OS')
        choice(name: 'ARCH', choices: ['amd64', 'arm64', '386', 'arm'], description: 'Pick ARCH')

    }
  

        stage("build") {
            steps {
                    echo 'MAKE BUILD:'
                    sh "make build TARGETOS=${params.OS} TARGETARCH=${params.ARCH}"
                  }
        }

        
        
    }
}
