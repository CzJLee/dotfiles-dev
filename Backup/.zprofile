alias pip=pip3

alias python=python3

alias jn="jupyter notebook"

dmgdng(){
	hdiutil create -srcfolder "$1" -format UDRO -encryption AES-128 -fs HFS+ -volname "$2" "$2.dmg"
	mv "$2.dmg" "~/Desktop/$2.dmg"
	mv "~/Desktop/$2.dmg" "~/Desktop/$2.dmg.DNG"
}

# This allows zsh to interpret URLs without the quotes
setopt nonomatch 
dl(){
	if [ -d ~/Desktop/YouTube ] 
	then
		cd ~/Desktop/YouTube
	else
		mkdir ~/Desktop/YouTube
		cd ~/Desktop/YouTube
	fi
	youtube-dl "$1"
}

dlpl() {
	if [ -d ~/Desktop/YouTube ] 
	then
		cd ~/Desktop/YouTube
	else
		mkdir ~/Desktop/YouTube
		cd ~/Desktop/YouTube
	fi
	youtube-dl -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' "$1"
}