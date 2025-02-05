pipeline {
    agent any

    environment {
        FLUTTER_HOME = "/root/flutter"
        ANDROID_HOME = "/root/Android/Sdk"  // Update to the correct Android SDK path
//         PATH = "${FLUTTER_HOME}/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:$PATH"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Kartik12331/test_code.git'
            }
        }

        stage('Setup Flutter') {
            steps {
                sh 'flutter doctor'
                sh 'flutter pub get'
            }
        }

        stage('Build APK') {
            steps {
                sh 'flutter build apk --release'
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
                     to: 'Kartik@skycap.co.in',
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
                     to: 'Kartik@skycap.co.in',
                     mimeType: 'text/html'
        }
    }
}
