# Pi Forecast #

I needed a kick to start using my Raspberry Pi - hence PiForecast.

The program displays London's weather forecast on my Pi's e-paper display. It fetches data from [OpenWeatherMap's](https://openweathermap.org/) API ([docs](https://openweathermap.org/current)),
builds up an image of the weather and temperature and then writes to display. I've just got cron running the thing a few times a day right now.

## How do I start? ##

```
git clone https://github.com/jkingharman/pi_forecast.git
```

Besides the Pi hardware, os and environment for ruby, you'll need the display driver installed (gratis/edp-fuse). This worked for me:

```
ssh yourpi
sudo apt-get install libfuse-dev -y

git clone https://github.com/repaper/gratis.git
cd gratis
make rpi EPD_IO=epd_io.h PANEL_VERSION='V231_G2'
make rpi-install EPD_IO=epd_io.h PANEL_VERSION='V231_G2'

systemctl enable epd-fuse.service
systemctl start epd-fuse
```

Then checkout this repo, ```bundle install```, get a public key from [OpenWeatherMap](https://openweathermap.org/) and you should be good to go. You can run the tests with: ``` rspec ``` and the program with: ``` rake cron:write_forecast ``` You'll need to setup your crontab if you want to run it on a schedule: ``` whenever --update-crontab ```

## Dependencies ##

* HTTParty for the data fetch.
* RMagick for image processing
* Papirus for talking to my PaPiRus display.
* Whenever for scheduling.
* Rspec for tests.
