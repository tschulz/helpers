# RHQ helpers

This repository contains various helper projects that have been accumulated in the main RHQ repository in `modules/helpers`, but which are not part of the core project or core distribution.

The individual modules are

* bundleGen -- bundle generator script. Could perhaps be totally erased if we have something better to create bundle distribution files. A graphical client would be nice I guess
* pluginAnnotations -- annotations to decorate (application) code with to create plugin artifacts with
* pluginGen -- standalone plugin generator that asks questions and creates a plugin skeleton
* rest-docs-generator -- the annotation scanner used to create an xml file from the swagger annotations
 to create our REST-api docs via XSLT transformation into docbook
* jeeGen -- A tool to generate JEE test applications

and then there is 

* inventory-serializer, that looks like a tool to print the current inventory from the DB