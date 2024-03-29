SERVICE='ProPresenter'

if pgrep -xq -- "${SERVICE}"; then
  osascript -e 'display alert "Error: ProPresenter is open!" message "Close ProPresenter before fetching lyrics."'
else
  eGFC_PATH=$HOME/ProPresenter/Libraries/eGFC
  rGFC_PATH=$HOME/ProPresenter/Libraries/rGFC

  if [ ! -d $eGFC_PATH ]; then
    mkdir $eGFC_PATH
  fi

  if [ ! -d $rGFC_PATH ]; then
    mkdir $rGFC_PATH
  fi

  git clone https://github.com/maxned/GFChurch-Lyrics.git

  rm -rf $eGFC_PATH/*
  rm -rf $rGFC_PATH/*

  mv GFChurch-Lyrics/eGFC/* $eGFC_PATH/
  mv GFChurch-Lyrics/rGFC/* $rGFC_PATH/

  rm -rf GFChurch-Lyrics
fi
