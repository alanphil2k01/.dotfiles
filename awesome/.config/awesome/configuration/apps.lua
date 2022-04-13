return {
  -- Default apps
  default = {
    terminal = 'kitty',
    -- lock = 'lock2',
    sleep_with_lock = 'systemctl suspend',
    screenshot = 'flameshot screen -p /home/alan/Pictures/Screenshots',
    region_screenshot = 'flameshot gui -p /home/alan/Pictures/Screenshots',
    browser1 = 'brave',
    browser2 = 'firefox',
    editor = 'nvim',
    files = 'nemo',
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'picom -f -i 1.0 -m 1.0 -e 1.0 -b',
    'nm-applet',
    'blueberry-tray',
  }
}
