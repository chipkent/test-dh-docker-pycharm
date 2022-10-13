FROM ubuntu:22.04

# Install requirements

RUN apt update && \
    apt install -y openjdk-11-jdk && \
    ln -s /usr/lib/jvm/java-11-openjdk-*/ /usr/lib/jvm/java-11-openjdk && \
    apt install --yes git python3-venv python3-pip curl unzip && \
    pip3 install --upgrade pip setuptools wheel build

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk

WORKDIR /app

# By copying over requirements first, we make sure that Docker will cache
# our installed requirements rather than reinstall them on every build
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Now copy in our code, and run it
COPY . /app
EXPOSE 10000
