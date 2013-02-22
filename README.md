gifvine
=======

I heard it through the GIF'd Vine

### INSTALLING

It's a short script, but you'll need some other complex software installed to get it running. We're assuming you have a few common developer tools and this won't be an issue. But, if you don't have those tools installed, here's what you'll need to do to get them:

**Install [Command Line Tools for Xcode](https://developer.apple.com/downloads) or [Xcode](http://itunes.apple.com/us/app/xcode/id497799835)** (yes, you'll need to have an Apple ID for this, sorry)

**Install [Homebrew](http://mxcl.github.com/homebrew/)**

Instructions are at the bottom of this page: http://mxcl.github.com/homebrew/

**Install [FFMpeg](http://www.ffmpeg.org/) (for video conversion) and [ImageMagick](http://www.imagemagick.org/) (for image manipulation)**

You can use Homebrew for this, e.g.:

    $ brew install ffmpeg
    $ brew install imagemagick

**Install nokogiri** (for parsing HTML)

    $ gem install nokogiri

**Drink a beer.** You've earned it!

### RUNNING

    $ ruby gifvine.rb https://vine.co/v/b6Zr6awtvHd

