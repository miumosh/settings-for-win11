### check

```bash
# settings.json
cat /mnt/c/Users/miyakei/AppData/Roaming/Code/User/settings.json > ./settings.json

# keybindings.json
cat /mnt/c/Users/miyakei/AppData/Roaming/Code/User/keybindings.json > ./keybindings.json

# extension
ls /mnt/c/Users/miyakei/.vscode/extensions | egrep -v "extensions.json" > ./_extension.txt 
```
