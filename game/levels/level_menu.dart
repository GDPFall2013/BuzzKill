part of gdp;

void setupMainMenu() {
  startMusic() {
    SoundManager.instance.setMusic(SoundManager.musicMainMenu);
    SoundManager.instance.startMusic();
  }
  
  SoundManager.instance.loadMusic(SoundManager.musicMainMenu,  startMusic);
  
  

}

