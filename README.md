# vimrc
## How to use with Docker

docker build -t nvim .

docker run -ti --rm -v ${HOME}:/data nvim

keymappings:

leader: spacebar

º - Open Nerdtree

<leader><leader> - Bookmark line

<leader>i - Insert comment to line

<leader>ff - Open Telescope

<C-n> - Open nvim-tree

1 - Switch to left vsplit

2 - Switch to right vsplit

++ - Comment current line

Others: Read the config files :)


