require 'monkeys/filer'


module Monkeys

  class Changer

    @filers = []
    @folder = nil
    @sprockets = nil
    @ready = false

    class << self

      attr_reader :folder
      attr_reader :sprockets
      attr_reader :ready

      def folder= ( path )

        @folder = Pathname.new path

        add_folder_to_sprockets

        execute

      end

      def sprockets= ( sprockets )

        @sprockets = sprockets

        add_folder_to_sprockets

        execute

      end

      def file ( path, &block )

        filer = Filer.new( self, path, &block )

        @filers << filer

        execute

      end

      def ready= ( value )

        @ready = value

        execute

      end

      private

      def add_folder_to_sprockets

        @sprockets.append_path @folder if @sprockets && @folder

      end

      def execute

        return unless @ready && @sprockets && @folder

        @filers.each &:execute

        @filers.clear

      end

    end

  end

end
