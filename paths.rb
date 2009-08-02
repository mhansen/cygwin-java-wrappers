#converts cygwin paths (or path lists separated by :) to windows paths with forward slashes
#e.g. /cygdrive/c/temp -> c:/temp
def to_winPath(unixPath, escapeSlashes=true)
  cygpath = "cygpath -m"
  isPathList = unixPath.include? ":"
  if (isPathList) 
      cygpath = "cygpath -m -p"
  end

  #escape semicolons
  cp = IO.popen(cygpath + " " + unixPath).readline.chomp.gsub(/;/,"\\;")
end
