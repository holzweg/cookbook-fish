function gp --description 'Pull from correct branch - check it out'
	git pull origin (git branch ^ /dev/null  | sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/")
end
