FROM ubuntu:16.10

# Install wger & JRE
RUN apt-get clean && \
	apt-get update && \
	apt-get -qy install \
			wget \
			default-jre-headless \
			telnet \
			iputils-ping \
			unzip

# Install jmeter
RUN   mkdir /jmeter \
	&& cd /jmeter/ \
	&& wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.2.tgz \
	&& tar -xzf apache-jmeter-3.2.tgz \
	&& rm apache-jmeter-3.2.tgz \
	&& mkdir /jmeter-plugins \
	&& cd /jmeter-plugins/ \
	&& wget https://jmeter-plugins.org/downloads/file/JMeterPlugins-ExtrasLibs-1.4.0.zip \
	&& unzip -o JMeterPlugins-ExtrasLibs-1.4.0.zip -d /jmeter/apache-jmeter-3.2/

# Set Jmeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-3.2/

# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH
