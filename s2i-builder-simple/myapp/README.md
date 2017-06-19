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

To build your very simple application, use the following commands:

Create a new build configuration which knows it should use the s2i builder image.

```
oc new-build --binary=true -i s2i-builder-simple --name myapp 
```

Start the s2i build by uploading the current directory into the s2i builder container. 

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

