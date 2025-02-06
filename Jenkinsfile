pipeline {
    agent any

    environment {
        FLUTTER_HOME = "/opt/flutter"
        ANDROID_HOME = "/opt/android-sdk"
        PATH = "${FLUTTER_HOME}/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/emulator:$PATH"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Kartik12331/test_code.git'
            }
        }

        stage('Setup Flutter') {
            steps {
                sh 'flutter doctor -v'
                sh 'flutter pub get'
                sh 'flutter pub outdated'
            }
        }

        stage('Build APK') {
            steps {
                sh 'whoami'  // Ensure the correct user is running the build
                sh 'df -h'  // Check available disk space
                sh 'flutter build apk --release --verbose'  // Run build with verbose logging
            }
        }

        stage('Archive APK') {
            steps {
                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', fingerprint: true
            }
        }
    }

    post {
        success {
            emailext subject: "✅ Jenkins Build SUCCESS: ${env.JOB_NAME}",
                     body: """
                     <h3>🎉 Good news! Your Jenkins build was successful.</h3>
                     <p><b>Job:</b> ${env.JOB_NAME} (Build #${env.BUILD_NUMBER})</p>
                     <p>✅ Build succeeded!</p>
                     <p>📥 <a href="${env.BUILD_URL}artifact/build/app/outputs/flutter-apk/app-release.apk">Download APK</a></p>
                     <p>🔗 <a href="${env.BUILD_URL}">View Build Details</a></p>
                     """,
                     recipientProviders: [[$class: 'DevelopersRecipientProvider']],
                     to: 'satyam@skycap.co.in',
                     mimeType: 'text/html'
        }

        failure {
            emailext subject: "❌ Jenkins Build FAILED: ${env.JOB_NAME}",
                     body: """
                     <h3>⚠️ Bad news! Your Jenkins build failed.</h3>
                     <p><b>Job:</b> ${env.JOB_NAME} (Build #${env.BUILD_NUMBER})</p>
                     <p>❌ Build failed. Check logs for details.</p>
                     <p>🔗 <a href="${env.BUILD_URL}/console">View Console Output</a></p>
                     """,
                     recipientProviders: [[$class: 'DevelopersRecipientProvider']],
                     to: 'satyam@skycap.co.in',
                     mimeType: 'text/html'
        }
    }
}
