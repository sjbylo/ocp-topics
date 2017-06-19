# This is the "source code" for a very simple runtime using the "cat" command. 

The simple runtime will output the contents of any files inside your "src/" directory. 

To try this out, create a directory "src" and place text files inside:

```
cd /tmp
mkdir -p myapp/src
cd myapp
echo To succeed in life, you need three things: > src/file1
echo a wishbone, a backbone and a funny bone. > src/file2
```

To build your very simple application, use one of the following commands:

## Build using a build configuration and then launch the resulting image 

Create a new build configuration which knows it should use the s2i builder image.

```
oc new-build --binary=true -i s2i-simple-builder --name myapp 
```

Start the s2i build process which will run the s2i builder image, upload the current directory into it and execute the assemble script. 

```
oc start-build myapp --from-dir=.       
oc logs bc/myapp -f
```

Create an application from the newly created myapp image.

```
oc new-app myapp
oc get pod
```

Show the "simple application" is working by displaying its output. 

```
oc logs <pod>
```

## Build and launch a new application with one command, using "oc new-app".

```
oc new-app s2i-simple-builder~https://github.com/sjbylo/ocp-topics --context-dir s2i-simple-builder/myapp --name myapp2
```


