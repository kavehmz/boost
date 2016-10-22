ln -fs ~/dev/home/projects/src/github.com/kavehmz/boost/vscode/keybindings.json '/Users/kaveh/Library/Application Support/Code/User/keybindings.json'
ln -fs  ~/dev/home/projects/src/github.com/kavehmz/boost/vscode/settings.json '/Users/kaveh/Library/Application Support/Code/User/settings.json'

[ ! -f './workbench.main.css' ] && cp '/Applications/Visual Studio Code.app/Contents/Resources/app/out/vs/workbench/workbench.main.css' ./
cat workbench.main.css custom.css > '/Applications/Visual Studio Code.app/Contents/Resources/app/out/vs/workbench/workbench.main.css'
