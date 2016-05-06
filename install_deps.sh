
dep_file="dependencies.txt"

uname=`uname`

if [ $uname = "Darwin" ]; then
	installer="brew"
	which -s $installer
	rc=$?
	if [ $rc != 0 ]; then
		echo "homebrew needs to be installed"
		exit 1
	fi
elif [ $uname = "Linux" ]; then
	for ins in "apt-get" "yum"; do
		which $ins > /dev/null
		rc=$?
		if [ $rc = 0 ]; then
			installer=$ins
		else
			echo "$ins not found"
		fi
	done
fi

while read -r dep; do
	$installer install $dep
done < "$dep_file"
