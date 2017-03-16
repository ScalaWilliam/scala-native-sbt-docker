# scala-native-sbt-docker

Docker image to get quickly started with scala-native & SBT.

This image preloads:
* CLang 3.8
* SBT
* scala-native essential dependencies

And runs Debian. This image is used for <a href="https://github.com/ScalaWilliam/scala-native-libpcap">scala-native-libpcap</a>.

## Usage

Assuming your scala-native project is at `/source/project`,

```
$ docker run -v /source/project:/p -it scala-native-sbt
root@248baf99ddc2:/# cd /p
root@248baf99ddc2:/p# sbt '~run'
```

### Compiling and running separately
```
root@248baf99ddc2:/p# sbt '~nativeLink'
```

And in another terminal:

```
$ docker exec -it 248baf99ddc2 /p/target/scala-2.11/p-out
```
