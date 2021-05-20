local beautiful = require('beautiful')
local terminal = 'kitty'
local lock = 'lock2'
local screenshot = 'flameshot'

return {
  -- Default apps
  default = {
    terminal = terminal,
    lock = lock,
    sleep_with_lock = lock .. ' & systemctl suspend',
    screenshot = screenshot .. ' screen -p ~/Pictures/Screenshots',
    region_screenshot = screenshot .. ' gui -p ~/Pictures/Screenshots',
    browser1 = 'firefox-developer-edition',
    browser2 = 'firefox',
    editor = 'nvim',
    files = terminal .. ' -e lf',
    rss = terminal .. ' -e newsboat',
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'compton -f -i 1.0 -m 1.0 -e 1.0 -b',
    'nm-applet',
    'blueberry-tray',
    'optimus-manager-qt',
    'stretchly',
  }
}
