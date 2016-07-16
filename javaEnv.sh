setJavaHome(){
        prev=$JAVA_HOME
        currJavac=$(readlink -f $(which javac))
        [[ -f $currJavac ]] && { export JAVA_HOME=$(dirname $(dirname ${currJavac})); } 
        #JAVA_HOME=${JAVA_HOME%/}
        [[ -d $JAVA_HOME ]] && { export JAVA_HOME ; return 0; }
        export JAVA_HOME=$prev
        return 1
}
j6default(){
        export JAVA_HOME=$(readlink -f /usr/lib/jvm/java-1.6.0-openjdk-amd64)
        export PATH="$JAVA_HOME/bin:$PATH"
}
j7default(){
        export JAVA_HOME=$(readlink -f /usr/lib/jvm/java-1.7.0-openjdk-amd64)
        export PATH="$JAVA_HOME/bin:$PATH"
}
j8default(){
        export JAVA_HOME=$(readlink -f /usr/lib/jvm/jdk-8-oracle-x64)
        export PATH="$JAVA_HOME/bin:$PATH"
}
j8osdefault(){
        sudo update-java-alternatiives -s jdk-8-oracle-x64
        setJavaHome
}

# Set JAVA_HOME
setJavaHome

alias setjava6=j6default
alias setjava7=j7default
alias setjava8=j8default
alias setjavaos=j8osdefault

# Set Maven
export INTELLIJ_HOME='/downlprograms/intellij/idea-IC-162.1121.32'
export M2_HOME=$INTELLIJ_HOME/plugins/maven/lib/maven3
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
export MAVEN_OPTS='-Xms256m -Xmx512m -Dmaven.artifact.threads=6'
export M2_REPO="${HOME}/.m2/repository"

alias gomaven="cd ${M2_HOME}"

