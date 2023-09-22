# neovim-config

## Neovim
Neovim last version

[Neovim site](https://neovim.io/)

## Nerd Fonts

Recomended font version < 3version

[Nerd fonts site](https://www.nerdfonts.com/)

Move archive to `~/.local/share/fonts/`, unzip archive, remove zip file and run

```bash
fc-cache -fv
sudo fc-cache -fv
```

## Nodejs

[Nodejs site](https://nodejs.org/en)

Or use npm

```bash
npm cache clean -f
sudo npm install -g n
sudo n stable
```

## Vim-plug

[Vim-plug github](https://github.com/junegunn/vim-plug)

## Coc-settings

Run `:CocConfig`

```json
{
  "inlayHint.enable": false,
  "suggest.enableFloat": false,
}
```
