
j6default(){
         export JAVA_HOME="/cygdrive/c/???/JDK64/1.6.0.31.1"
         export PATH="$JAVA_HOME/bin:$ANT_HOME/bin:$BASEPATH:$WINDOWS_PATHS"
}
j7default(){
         export JAVA_HOME="/cygdrive/c/???/JDK64/1.7.0.79"
         export PATH="$JAVA_HOME/bin:$ANT_HOME/bin:$BASEPATH:$WINDOWS_PATHS"
}
j8default(){
         export JAVA_HOME="/cygdrive/c/???/JDK64/1.8.0.74"
         export PATH="$JAVA_HOME/bin:$ANT_HOME/bin:$BASEPATH:$WINDOWS_PATHS"
}



export BASEPATH="/usr/bin:/usr/lib/lapack:/usr/local/bin"

export JAVA_HOME="/cygdrive/c/???/JDK64/1.7.0.79"
export CLASSPATH=""

export M2_HOME="/cygdrive/c/???/maven/3.2.5"
export MAVEN_OPTS="-Xms256m -Xmx1G -Dmaven.artifact.threads=6"
export M2_REPO="/cygdrive/c/Users/??????/.m2/repository"
export M2="$M2_HOME/bin"

export PATH="$JAVA_HOME/bin:$ANT_HOME/bin:$M2:$GRADLE_HOME/bin:$PROTOBUFFS:$BASEPATH:$WINDOWS_PATHS"

alias setjava6=j6default
alias setjava7=j7default
alias setjava8=j8default

alias gomaven="/cygdrive/c/Users/??????/.m2"

