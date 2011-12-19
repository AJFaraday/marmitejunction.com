class MainController < ApplicationController

  require 'rss'

  def index
    @rss = RSS::Parser.parse(open('http://marmitejunction.blogspot.com/feeds/posts/default').read, false).items[0..2]
  end

  def files
    @pagename = "The Marmite Files"
    unless @embeds = FilesEmbed.all
      @embeds = []
    end
  end

  def sam
    @pagename = "Sam Smith"
    @rss = RSS::Parser.parse(open('http://samjsmith.blogspot.com/feeds/posts/default').read, false).items[0..3]
  end

  def andrew
    @pagename = "Andrew Faraday"
  end

  def jam
    @pagename = "Marmite Jam"
  end


end
