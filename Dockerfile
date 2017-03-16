FROM hseeberger/scala-sbt:latest
RUN \
  apt-get -y update && \
  apt-get -y install clang-3.8 libgc-dev libunwind-dev && \
  ln -s /usr/bin/clang-3.8 /usr/bin/clang

# Prefetch a few things into cache so the build is faster
RUN \
  mkdir sample-project && \
  cd sample-project && \
  mkdir project && \
  echo 'addSbtPlugin("org.scala-native" % "sbt-scala-native" % "0.1.0")' > project/native.sbt && \
  echo 'enablePlugins(ScalaNativePlugin)' > build.sbt && \
  echo 'scalaVersion := "2.11.8"' >> build.sbt && \
  sbt compile && cd .. && rm -r sample-project
