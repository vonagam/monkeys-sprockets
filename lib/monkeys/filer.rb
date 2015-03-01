require 'monkeys/liner'
require 'fileutils'


module Monkeys

  class Filer

    def initialize ( path, &block )

      @path = path
      @block = block
      @liners = []
      @created_in = created_in

    end

    def execute ( sprockets, folder )

      origin_path = sprockets.resolve @path

      result_path = folder.join( 'monkeys', @path )

      return if is_fresh?( result_path, [ origin_path, @created_in ] )

      @block.call self

      lines = IO.readlines origin_path

      @liners.each { | liner | liner.execute lines }

      lines.flatten!

      FileUtils.mkdir_p( result_path.dirname ) unless File.directory?( result_path.dirname )

      File.open( result_path, 'w' ) { | file | file.puts lines }

    end

    def line ( *args, &block )

      @liners << Liner.new( *args, &block )

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
