#/bin/sh
#

mkdir -p plugins/hlissner
git clone https://github.com/hlissner/zsh-autopair.git plugins/hlissner/zsh-autopair
mkdir -p plugins/zdharma-continuum
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git plugins/zdharma-continuum/fast-syntax-highlighting
mkdir -p plugins/zsh-users
git clone https://github.com/zsh-users/zsh-autosuggestions.git plugins/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git plugins/zsh-users/zsh-completions

mkdir -p prompts/BrandonRoehl
git clone https://github.com/BrandonRoehl/zsh-clean.git prompts/BrandonRoehl/zsh-clean
mkdir -p prompts/sindresorhus
git clone https://github.com/sindresorhus/pure.git prompts/sindresorhus/pure
mkdir -p prompts/spaceship-prompt
git clone https://github.com/spaceship-prompt/spaceship-prompt.git prompts/spaceship-prompt/spaceship-prompt
