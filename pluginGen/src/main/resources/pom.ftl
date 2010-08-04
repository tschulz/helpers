<#ftl >
<#--
/*
 * RHQ Management Platform
 * Copyright (C) 2005-2008 Red Hat, Inc.
 * All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */
-->
<#-- @ftlvariable name="props" type="org.rhq.helpers.pluginGen.Props" -->
<project
        xmlns="http://maven.apache.org/POM/4.0.0"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd"
        >

    <modelVersion>4.0.0</modelVersion>

    <parent>
        <groupId>org.rhq</groupId>
        <artifactId>rhq-plugins-parent</artifactId>
        <version><#if props.rhqVersion??>${props.rhqVersion}<#else >1.3.0-SNAPSHOT</#if></version><!-- TODO adjust RHQ version -->
    </parent>

    <groupId>org.rhq</groupId>
    <artifactId>${props.name}-plugin</artifactId>
    <packaging>jar</packaging>

    <name>RHQ ${props.name} Plugin</name>
    <#if props.description??>
    <description>${props.description}</description>
    </#if>

    <properties>
        <scm.module.path>TODO</scm.module.path>
        <rhq.version><#if props.rhqVersion??>${props.rhqVersion}<#else >1.3.0-SNAPSHOT</#if></rhq.version> <!-- TODO adjust, see above too -->
    </properties>

    <build>
        <plugins>
            <plugin>
                <artifactId>maven-compiler-plugin</artifactId>
                <configuration>
                    <source>1.5</source>
                    <target>1.5</target>
                </configuration>
            </plugin>

<#if props.usesExternalJarsInPlugin>
            <plugin>
                <artifactId>maven-dependency-plugin</artifactId>
                <version>2.0</version>
                <executions>
                    <execution>
                        <id>copy-${props.name}-jar</id>
                        <phase>process-resources</phase>
                        <goals>
                            <goal>copy</goal>
                        </goals>
                        <configuration>
                            <artifactItems>

                                <!-- TODO include needed external jars
                                     that should go into your jar file

                                The next one is an example:
                                -->
                                <artifactItem>
                                    <groupId>org.snmp4j</groupId>
                                    <artifactId>snmp4j</artifactId>
                                    <version>1.9.1f</version>
                                </artifactItem>

                            </artifactItems>
                            <outputDirectory>${r"${project.build.outputDirectory}"}/lib</outputDirectory>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
</#if>

        </plugins>
    </build>

    <profiles>
        <profile>
            <id>dev</id>

            <properties>
                <rhq.rootDir>../../..</rhq.rootDir>
                <rhq.containerDir>${r"${rhq.rootDir}/${rhq.defaultDevContainerPath}"}</rhq.containerDir>
                <rhq.deploymentDir>${r"${rhq.containerDir}/jbossas/server/default/deploy/${rhq.earName}/rhq-downloads/rhq-plugins"}</rhq.deploymentDir>
            </properties>

            <build>
                <plugins>

                    <plugin>
                        <artifactId>maven-antrun-plugin</artifactId>
                        <version>1.1</version>
                        <executions>

                            <execution>
                                <id>deploy</id>
                                <phase>compile</phase>
                                <configuration>
                                    <tasks>
                                        <mkdir dir="${r"${rhq.deploymentDir}"}"/>
                                        <property name="deployment.file"
                                                  location="${r"${rhq.deploymentDir}/${project.build.finalName}"}.jar"/>
                                        <echo>*** Updating ${r"${deployment.file}"}...</echo>
                                        <jar destfile="${r"${deployment.file}"}" basedir="${r"${project.build.outputDirectory}"}"/>
                                    </tasks>
                                </configuration>
                                <goals>
                                    <goal>run</goal>
                                </goals>
                            </execution>

                            <execution>
                                <id>deploy-jar-meta-inf</id>
                                <phase>package</phase>
                                <configuration>
                                    <tasks>
                                        <property name="deployment.file"
                                                  location="${r"${rhq.deploymentDir}/${project.build.finalName}.jar"}"/>
                                        <echo>*** Updating META-INF dir in ${r"${deployment.file}"}...</echo>
                                        <unjar src="${r"${project.build.directory}/${project.build.finalName}.jar"}"
                                               dest="${r"${project.build.outputDirectory}"}">
                                            <patternset>
                                                <include name="META-INF/**"/>
                                            </patternset>
                                        </unjar>
                                        <jar destfile="${r"${deployment.file}"}"
                                             manifest="${r"${project.build.outputDirectory}/META-INF/MANIFEST.MF"}"
                                             update="true">
                                        </jar>
                                    </tasks>
                                </configuration>
                                <goals>
                                    <goal>run</goal>
                                </goals>
                            </execution>

                            <execution>
                                <id>undeploy</id>
                                <phase>clean</phase>
                                <configuration>
                                    <tasks>
                                        <property name="deployment.file"
                                                  location="${r"${rhq.deploymentDir}/${project.build.finalName}"}.jar"/>
                                        <echo>*** Deleting ${r"${deployment.file}"}...</echo>
                                        <delete file="${r"${deployment.file}"}"/>
                                    </tasks>
                                </configuration>
                                <goals>
                                    <goal>run</goal>
                                </goals>
                            </execution>

                        </executions>
                    </plugin>

                </plugins>
            </build>

        </profile>
    </profiles>


        <repositories>
            <repository>
                <snapshots>
                    <enabled>false</enabled>
                </snapshots>
                <id>jboss</id>
                <name>JBoss Repository</name>
                <url>http://repository.jboss.org/maven2/</url>
            </repository>
            <!-- TODO add your own maven repositories here (if needed) -->
        </repositories>

        <pluginRepositories>
            <pluginRepository>
                <snapshots>
                    <enabled>false</enabled>
                </snapshots>
                <id>jboss</id>
                <name>JBoss Plugin Repository</name>
                <url>http://repository.jboss.org/maven2/</url>
            </pluginRepository>
        </pluginRepositories>


        <dependencies>
            <dependency>
                <groupId>commons-logging</groupId>
                <artifactId>commons-logging</artifactId>
                <version>${r"${commons-logging.version}"}</version>
            </dependency>
            <dependency>
                <groupId>org.rhq</groupId>
                <artifactId>rhq-core-domain</artifactId>
                <version>${r"${rhq.version}"}</version>
                <scope>provided</scope>
            </dependency>
            <dependency>
                <groupId>org.rhq</groupId>
                <artifactId>rhq-core-plugin-api</artifactId>
                <version>${r"${rhq.version}"}</version>
                <scope>provided</scope>
            </dependency>
            <dependency>
                <groupId>org.rhq</groupId>
                <artifactId>rhq-core-native-system</artifactId>
                <version>${r"${rhq.version}"}</version>
                <scope>provided</scope>
            </dependency>
<#if props.dependsOnJmxPlugin>
            <dependency>
                <groupId>org.rhq</groupId>
                <artifactId>rhq-jmx-plugin</artifactId>
                <version>${r"${rhq.version}"}</version>
                <scope>provided</scope>
            </dependency>
</#if>

            <!-- TODO add your dependencies here -->

        </dependencies>
</project>