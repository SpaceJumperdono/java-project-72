plugins {
    checkstyle
    application
    id("java")
    id("org.sonarqube") version "6.3.1.5724"
    id("com.github.johnrengelman.shadow") version "8.1.1"
    id("io.freefair.lombok") version "8.13.1"
}

group = "hexlet.code"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

application {
    mainClass.set("hexlet.code.App")
}

dependencies {
    implementation("io.javalin:javalin:6.6.0")
    implementation("io.javalin:javalin-bundle:6.6.0")
    implementation("io.javalin:javalin-rendering:6.6.0")
    implementation("org.slf4j:slf4j-simple:2.0.17")
    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")
}

tasks.test {
    useJUnitPlatform()
}

sonar {
    properties {
        property("sonar.coverage.exclusions", listOf(
            "**/java/code/hexlet/"
        ))
        property("sonar.cpd.exclusions", listOf(
            "**/java/code/hexlet/"
        ))
        property("sonar.projectKey", "SpaceJumperdono_java-project-72")
        property("sonar.organization", "spacejumperdono")
    }
}