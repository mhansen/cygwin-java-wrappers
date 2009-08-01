#!/bin/ruby
require 'paths.rb'

def java_path
    javaName="java.exe"
    javaPath= ENV["JAVA_HOME"]
    IO.popen("find \"#{javaPath}\" -name #{javaName}").readlines[0].chomp
end


def windows_java_args(unixARGV)
    unixARGV 
    #TODO: implement jar file path translation
    #TODO: replace -classpath PATH unix paths with windows paths
end

def windows_java_command(unixARGV)
    '"' << java_path << '" ' << windows_java_args(unixARGV).join(" ")
end

if __FILE__ == $0
    ENV["CLASSPATH"] = to_winPathList(ENV["CLASSPATH"])

    #run java
    system(windows_java_command(ARGV))
end
