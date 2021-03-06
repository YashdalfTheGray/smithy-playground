/*
 * This file was generated by the Gradle 'init' task.
 *
 * This generated file contains a sample Kotlin library project to get you started.
 */

plugins {
    // Apply the Kotlin JVM plugin to add support for Kotlin on the JVM
    id("org.jetbrains.kotlin.jvm").version("1.3.10")

    // Add all the Smithy libraries
    id("software.amazon.smithy").version("0.4.2")
}

configure<software.amazon.smithy.gradle.SmithyExtension> {
    projection = "source"
}

repositories {
    // Use jcenter for resolving your dependencies.
    // You can declare any Maven/Ivy/file repository here.
    jcenter()
}

buildscript {
    dependencies {
        // This dependency is required in order to apply the "openapi"
        // plugin in smithy-build.json
        classpath("software.amazon.smithy:smithy-openapi:0.9.7")
    }
}

dependencies {
    // Use the Kotlin JDK 8 standard library
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")

    // Pull in all the Smithy stuff
    implementation("software.amazon.smithy:smithy-model:0.9.7")
    implementation("software.amazon.smithy:smithy-openapi:0.9.7")
    implementation("software.amazon.smithy:smithy-aws-traits:0.9.7")
    implementation("software.amazon.smithy:smithy-cli:0.9.7")

    // Use the Kotlin test library
    testImplementation("org.jetbrains.kotlin:kotlin-test")

    // Use the Kotlin JUnit integration
    testImplementation("org.jetbrains.kotlin:kotlin-test-junit")
}
