SERVICE='ProPresenter'

if pgrep -xq -- "${SERVICE}"; then
  osascript -e 'display alert "Error: ProPresenter is open!" message "Close ProPresenter before fetching lyrics."'
else
  eGFC_PATH=$HOME/ProPresenter/Libraries/eGFC
  rGFC_PATH=$HOME/ProPresenter/Libraries/rGFC
  choir_PATH=$HOME/ProPresenter/Libraries/choir

  if [ ! -d $eGFC_PATH ]; then
    mkdir $eGFC_PATH
  fi

  if [ ! -d $rGFC_PATH ]; then
    mkdir $rGFC_PATH
  fi
  
  if [ ! -d $choir_PATH ]; then
    mkdir $choir_PATH
  fi

  git clone https://github.com/maxned/GFChurch-Lyrics.git

  rm -rf $eGFC_PATH/*
  rm -rf $rGFC_PATH/*
  rm -rf $choir_PATH/*

  mv GFChurch-Lyrics/eGFC/* $eGFC_PATH/
  mv GFChurch-Lyrics/rGFC/* $rGFC_PATH/
  mv GFChurch-Lyrics/choir/* $choir_PATH/

  rm -rf GFChurch-Lyrics
fi
