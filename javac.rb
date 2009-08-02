#!/bin/ruby
require 'paths.rb'


def windows_javac_args(unixARGV)
    unixARGV.map do | arg |
        if arg[0] != '-'[0] 
          to_winPath(arg)
        else 
          #options like '-d' aren't paths, so don't convert them
          arg
        end
    end
end

def ends_with_slash?(path)
    path =~ /\/$/
end

def javac_path
    javaPath = ENV["JAVA_HOME"]
    javaBinPath = javaPath + (ends_with_slash?(javaPath) ? "bin/" : "/bin/")
    javac = javaBinPath + "javac.exe"
    if File.exists?(javac)
        javac
    else
        puts "Could not find javac.exe."
        puts "The environment variable JAVA_HOME"
        puts "does not point at a java installation"
        Process.exit(-1)
    end
end

def windows_javac_command(unixARGV)
    '"' << javac_path << '" ' << windows_javac_args(unixARGV).join(" ")
end

if __FILE__ == $0
    if ARGV.any? { | arg | arg == "-DEBUG" }
        puts windows_javac_command(ARGV) #echo the command back for debugging
    else
        ENV["CLASSPATH"] = to_winPath(ENV["CLASSPATH"])
        system(windows_javac_command(ARGV))
    end
end
