plugins {
    checkstyle
    application
    id("java")
    id("org.sonarqube") version "6.3.1.5724"
    id("com.github.johnrengelman.shadow") version "8.1.1"
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
    implementation("com.h2database:h2:2.3.232")
    implementation("com.zaxxer:HikariCP:7.0.2")
    implementation("io.javalin:javalin:6.7.0")
    implementation("io.javalin:javalin-bundle:6.7.0")
    implementation("io.javalin:javalin-rendering:6.7.0")
    implementation("gg.jte:jte:3.2.1")
    implementation("org.slf4j:slf4j-simple:2.0.17")
    implementation("org.postgresql:postgresql:42.7.2")
    compileOnly("org.projectlombok:lombok:1.18.42")
    annotationProcessor("org.projectlombok:lombok:1.18.42")
    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")
}

tasks.test {
    useJUnitPlatform()
}

sonar {
    properties {
        property("sonar.coverage.exclusions", listOf(
            "**/hexlet/code/App.java",
            "**/hexlet/code/model/Url.java",
            "**/hexlet/code/controller/RootController.java",
            "**/hexlet/code/controller/UrlController.java",
            "**/hexlet/code/controller/UrlController.java",
            "**/hexlet/code/dto/urls/UrlPage.java",
            "**/hexlet/code/dto/urls/UrlsPage.java",
            "**/hexlet/code/dto/BasePage.java",
            "**/hexlet/code/repository/UrlRepository.java",
            "**/hexlet/code/util/NamedRoutes.java",
        ))
        property("sonar.cpd.exclusions", listOf(
            "**/hexlet/code/App.java",
            "**/hexlet/code/model/Url.java",
            "**/hexlet/code/controller/RootController.java",
            "**/hexlet/code/controller/UrlController.java",
            "**/hexlet/code/controller/UrlController.java",
            "**/hexlet/code/dto/urls/UrlPage.java",
            "**/hexlet/code/dto/urls/UrlsPage.java",
            "**/hexlet/code/dto/BasePage.java",
            "**/hexlet/code/repository/UrlRepository.java",
            "**/hexlet/code/util/NamedRoutes.java",
        ))
        property("sonar.projectKey", "SpaceJumperdono_java-project-72")
        property("sonar.organization", "spacejumperdono")
    }
}