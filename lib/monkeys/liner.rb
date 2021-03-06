module Monkeys

  class Liner

    def initialize ( number, check = nil, replace = nil, &block )

      @number = number - 1
      @check = check
      @replace = replace || block

    end

    def error ( got )

      raise StandardError, "on line #{ @number } \n expected: #{ @check } \n got: #{ got }"

    end

    def execute ( lines )

      line = lines[ @number ]

      error( line ) if @check && ! line.slice( @check )

      case @replace

        when Proc then lines[ @number ] = @replace.call line
        when String, Array then lines[ @number ] = @replace

      end

    end

  end

end
