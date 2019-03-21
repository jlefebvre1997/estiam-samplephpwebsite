job('My Job 1') {
    scm {
        git('https://github.com/jlefebvre1997/estiam-samplephpwebsite.git') {  node -> 
            node / gitConfigName('jlefebvre1997')
            node / gitConfigEmail('jeremy.lefebvre@estiam.com')
        }
    }
    triggers {
        scm('H/5 * * * *')
    }
    steps {
        shell("docker-compose up -d")
    }
}