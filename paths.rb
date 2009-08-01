#converts cygwin paths (or path lists separated by :) to windows paths
def to_winPath(unixPath, escapeSlashes=true)
  cygpath = "cygpath -w"
  isPathList = unixPath.include? ":"
  if (isPathList) 
      cygpath = "cygpath -w -p"
  end

  cp = IO.popen(cygpath + " " + unixPath).readline.chomp.gsub(/;/,"\\;")
end
