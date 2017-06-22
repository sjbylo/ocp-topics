# Simple example of creating an s2i builder image

The goal of this topic is to show, step by step, how to create a simple s2i builder image and then use the builder image to create a simple application. 

This topic is divided into two parts with two separate sub directories.

The *[builder](./builder/)* directory holds what's needed to create a new builder image.

- The "simple runtime" is just the command cat, which will output the "source code" provided, e.g. cat tmp/*

The *[myapp](./myapp/)* directory holds the "source code" for the simple application. 

- The "source code" is simply files under a src/ directory. 

