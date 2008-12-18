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
package org.rhq.helpers.pluginGen;

import java.util.Locale;
import java.util.Set;
import java.util.HashSet;

/**
 * The properties needed to generate a new plugin skeleton
 *
 * @author Heiko W. Rupp
 */
public class Props {

    /** What category is this ? */
    private ResourceCategory category;
    /** The name of this item */
    private String name;
    /** A description of the plugin */
    private String description;
    /** Package name prefix */
    private String packagePrefix;
    /** The name of the DiscoveryClass */
    private String discoveryClass;
    /** The name of the Component class */
    private String componentClass;
    /** The type of the parent we run in */
    private String parentType;
    /** Filesytem root */
    private String fileSystemRoot;
    /** Should this service do monitoring ? */
    private boolean monitoring;
    /** Should this service do operations ? */
    private boolean operations;
    /** Is this service a singleton (e.g. a XYZ subsystem) */
    private boolean singleton;
    /** Does the service support configuration ? */
    private boolean resourceConfiguration;
    /** Does the service suport events */
    private boolean events;
    /** Can the service create children ? */
    private boolean createChildren;
    /** Use externals chars in the plugin jar ? */
    private boolean usesExternalJarsInPlugin;

    /** Embedded children */
    private Set<Props> children = new HashSet<Props>();

    public ResourceCategory getCategory() {
        return category;
    }

    public void setCategory(ResourceCategory category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDiscoveryClass() {
        return discoveryClass;
    }

    public void setDiscoveryClass(String discoveryClass) {
        this.discoveryClass = discoveryClass;
    }

    public String getComponentClass() {
        return componentClass;
    }

    public void setComponentClass(String componentClass) {
        this.componentClass = componentClass;
    }

    public String getParentType() {
        return parentType;
    }

    public void setParentType(String parentType) {
        this.parentType = parentType;
    }

    public boolean isMonitoring() {
        return monitoring;
    }

    public void setMonitoring(boolean monitoring) {
        this.monitoring = monitoring;
    }

    public boolean isOperations() {
        return operations;
    }

    public void setOperations(boolean operations) {
        this.operations = operations;
    }

    public boolean isSingleton() {
        return singleton;
    }

    public void setSingleton(boolean singleton) {
        this.singleton = singleton;
    }

    public boolean isResourceConfiguration() {
        return resourceConfiguration;
    }

    public void setResourceConfiguration(boolean resourceConfiguration) {
        this.resourceConfiguration = resourceConfiguration;
    }

    public boolean isEvents() {
        return events;
    }

    public void setEvents(boolean events) {
        this.events = events;
    }

    public boolean isCreateChildren() {
        return createChildren;
    }

    public void setCreateChildren(boolean createChildren) {
        this.createChildren = createChildren;
    }

    public Set<Props> getChildren() {
        return children;
    }

    public void setChildren(Set<Props> children) {
        this.children = children;
    }

    public String getPackagePrefix() {
        return packagePrefix;
    }

    public void setPackagePrefix(String packagePrefix) {
        this.packagePrefix = packagePrefix;
    }

    public String getFileSystemRoot() {
        return fileSystemRoot;
    }

    public void setFileSystemRoot(String fileSystemRoot) {
        this.fileSystemRoot = fileSystemRoot;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isUsesExternalJarsInPlugin() {
        return usesExternalJarsInPlugin;
    }

    public void setUsesExternalJarsInPlugin(boolean usesExternalJarsInPlugin) {
        this.usesExternalJarsInPlugin = usesExternalJarsInPlugin;
    }

    /** Possible categories */
    public static enum ResourceCategory {
        PLATFORM, SERVER, SERVICE;

        public String getLowerName() {
            return toString().toLowerCase(Locale.getDefault());
        }
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder();
        sb.append("Props");
        sb.append("{category=").append(category);
        sb.append(", name='").append(name).append('\'');
        sb.append(", description='").append(description).append('\'');
        sb.append(", packagePrefix='").append(packagePrefix).append('\'');
        sb.append(", discoveryClass='").append(discoveryClass).append('\'');
        sb.append(", componentClass='").append(componentClass).append('\'');
        sb.append(", parentType='").append(parentType).append('\'');
        sb.append(", fileSystemRoot='").append(fileSystemRoot).append('\'');
        sb.append(", monitoring=").append(monitoring);
        sb.append(", operations=").append(operations);
        sb.append(", singleton=").append(singleton);
        sb.append(", resourceConfiguration=").append(resourceConfiguration);
        sb.append(", events=").append(events);
        sb.append(", createChildren=").append(createChildren);
        sb.append(", usesExternalJarsInPlugin=").append(usesExternalJarsInPlugin);
        sb.append(", children=").append(children);
        sb.append('}');
        return sb.toString();
    }
}
