class MainController < ApplicationController

  def index
    require 'rss'
    @rss = RSS::Parser.parse(open('http://marmitejunction.blogspot.com/feeds/posts/default').read, false).items[0..2]
  end

  def files
    @pagename = "The Marmite Files"
    unless @embeds = FilesEmbed.all[-2..-1]
      @embeds = []
    end
  end

  def sam
    @pagename = "Sam Smith"
    require 'rss'
    @rss = RSS::Parser.parse(open('http://samjsmith.blogspot.com/feeds/posts/default').read, false).items[0..1]
  end

end
