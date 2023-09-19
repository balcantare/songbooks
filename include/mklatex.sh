# !/bin/sh
# Process a latex file, check for recompilation if table of contents
# has changed and create a dependency file (.dep)
# Argument is the latex filename without suffix (.tex)
xelatex -interaction=batchmode $1.tex
# We might need additional runs if a (.toc) was generated.
# If one exists we check if the md5 sum of the (.toc)
# has changed

while [ -f $1.toc ] && ( ! [ -f $1.toc.md5 ] || ! md5sum --status -c $1.toc.md5 ) 
do
    # generate new checksum
    md5sum -t $1.toc > $1.toc.md5
    xelatex -interaction=batchmode $1.tex
done

# Extract the dependencies from the xelatex log file
# and write these to (.dep) dependencies file.
# because the filenames are casualy divided by newlines
# we replace all newlines by '?' do the grep , delete the '?'
# andjoin the results to one line

echo -n "$1.pdf : " > $1.dep
cat $1.log | tr '\n' '?' | grep -Eo '\.+/[.//a-zA-Z?]*\.tex' | tr -d '?' | tr '\n' ' ' >> $1.dep
# grep -Eo '\.+/[^>) ]*\.tex' $1.log | tr '\n' ' ' >> $1.dep
