#!/bin/bash


## 
## migu のサイト
## http://mix-mplus-ipa.osdn.jp/
## 
## Ricty のサイト
## http://www.rs.tus.ac.jp/yyusa/ricty.html


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


cmd="install-font"

font_dir="${HOME}/.fonts"


extract_dir="/tmp/temp.${USER}.${cmd}.$(date +%FT%T%z).$$.archive"

inco_bold_url="https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Bold.ttf"
inco_regular_url="https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Regular.ttf"

migu_1m_version="migu-1m-20150712"
migu_1m_url="https://ja.osdn.net/projects/mix-mplus-ipa/downloads/63545/${migu_1m_version}.zip"

ricty_gen_url="http://www.rs.tus.ac.jp/yyusa/ricty/ricty_generator.sh"
ricty_reviser_url="http://www.rs.tus.ac.jp/yyusa/ricty/os2version_reviser.sh"


sudo apt-get -y install fontforge


mkdir -p "$extract_dir"


if builtin pushd "$extract_dir" > /dev/null; then
    # Ricty の
    # $ ./ricty_generator.sh auto
    # で Inconsolata-Regular.ttf と Inconsolata-Bold.ttf を求められるので apt ではなく直接ダウンロードする

    # これだと Inconsolata.otf がインストールされる
    # sudo apt-get -y install fonts-inconsolata

    wget "$inco_bold_url"
    wget "$inco_regular_url"

    wget "$migu_1m_url"
    unzip "${migu_1m_version}.zip"
    cp "./${migu_1m_version}/migu-1m-"*.ttf ./

    wget "$ricty_gen_url"
    wget "$ricty_reviser_url"

    sh ricty_generator.sh auto
    sh os2version_reviser.sh Ricty*.ttf

    mkdir -p "$font_dir"

    cp ./*.ttf "$font_dir"


    echo "### テンポラリは ###" >&2
    pwd >&2
    ls * >&2
    echo "### でした ###" >&2

    builtin popd > /dev/null
fi


sudo fc-cache -fv


echo -n "rm start - '${extract_dir}' ... " >&2
rm -rf "$extract_dir" && echo "finish" >&2
