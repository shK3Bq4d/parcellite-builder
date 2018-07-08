# Readme
Builds parcellite source code in a docker container.

```
./parcellite-build.sh
```

should do the trick, although I have hard-coded changes in the source code
within this repository. Which is evidently a source of shame but you can strip
out by taking out the `COPY` statement within the Dockerfile.

You might want to link against the libraries of your own OS.

# See also
* [changes I made](https://github.com/shK3Bq4d/parcellite/tree/trimclever) to 
  the [original version](https://github.com/rickyrockrat/parcellite)
