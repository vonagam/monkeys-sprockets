require 'monkeys/filer'


module Monkeys

  class Changer

    @filers = []
    @folder = nil

    def self.folder= ( path )

      @folder = Pathname.new path

    end

    def self.file ( path, &block )

      @filers << Filer.new( path, &block )

    end

    def self.execute ( sprockets )

      @filers.each { | filer | filer.execute( sprockets, @folder ) }

    end

  end

end
