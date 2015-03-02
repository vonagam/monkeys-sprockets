require 'monkeys/liner'
require 'fileutils'


module Monkeys

  class Filer

    def initialize ( changer, path, &block )

      @changer = changer
      @path = path
      @block = block
      @created_in = created_in

    end

    def execute

      origin_path = @changer.sprockets.resolve @path

      result_path = @changer.folder.join( 'monkeys', @path )

      return if is_fresh?( result_path, [ origin_path, @created_in ] )

      @lines = IO.readlines origin_path

      @block.call self

      @lines.flatten!

      FileUtils.mkdir_p( result_path.dirname ) unless File.directory?( result_path.dirname )

      File.open( result_path, 'w' ) { | file | file.puts @lines }

    end

    def line ( *args, &block )

      liner = Liner.new( *args, &block )

      liner.execute @lines

    end

    protected

    def created_in

      created_in_path = caller.find { | path | ! path['/lib/monkeys/'] }

      created_in_path.slice! /:\d+:in.+$/ if created_in_path

      created_in_path

    end

    def is_fresh?( result_path, origins_paths = [] )

      return false unless File.exists?( result_path )

      return origins_paths.all? { | origin_path | File.mtime( result_path ) > File.mtime( origin_path ) }

    end

  end

end
