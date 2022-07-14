# blackbox-theme: A BlackBox theme manager
Use this repo as theme-chooser e make your BlackBox Terminal more awesome!

## Prerequisites
Only two things:

- `wget` should be installed
- `blackbox` should be installed

## Installing
You can install using this command:
```console

sh -c "$(wget -nv -q -O- https://raw.githubusercontent.com/lucasvsr/blackbox-themes/main/src/install.sh)"

```

## Using
Choose a theme in `themes` folder and use the command:
```console

blackbox-theme <theme>

```

![command](src/utils/gifs/command.gif)

The theme should be downloaded at `$BLACKBOX_THEMES_DIR` and, for now, you need to close and reopen to see your theme at Theme seccion in settings.

## Add your theme in this repo
You can add your theme in this repo just:

- Creating a new branch and add you `theme.json` in `src/palettes`
- Add a screenshot in  `themes/images` and edit the `themes/README.md` with the image you just add.
- Make a pull-request at `main branch`
