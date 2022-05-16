module L1_rectangle
  # Hold a 2-dimensional size and allow for inflation / deflation
  class Size
    # Width in pixels
    attr_reader :width
    # Height in pixels
    attr_reader :height

    # Neither dimension can be negative, since that doesn't make sense.
    # The values are checked on inflation / deflation.

    # Initialise a size
    # * +wid+   Width
    # * +ht+    Height

    def initialize(wid, ht)
      @width  = wid
      @height = ht
      validate(0, 0)
    end

    # Create a new size with the dimensions INcreased in the width direction
    # by +by_w+ and in the height direction by +by_h+.
    #
    # by_w and by_h can be a Fixnum, or another Size.

    def inflate(by_w, by_h = nil)
      dup.inflate!(by_w, by_h)
    end

    # Create a new size with the dimensions DEcreased in the width direction
    # by +by_w+ and in the height direction by +by_h+.
    #
    # by_w and by_h can be a Fixnum, or another Size.

    def deflate(by_w, by_h = nil)
      dup.deflate!(by_w, by_h)
    end

    # INcrease the dimensions of the current Size in the width direction
    # by +by_w+ and in the height direction by +by_h+.
    #
    # by_w and by_h can be a Fixnum, or another Size.

    def inflate!(by_w, by_h = nil)
      return inflate_by_size(by_w) if by_w.respond_to? :width

      validate(by_w, by_h)

      @width  += by_w
      @height += by_h

      self
    end

    # DEcrease the dimensions of the current Size in the width direction
    # by +by_w+ and in the height direction by +by_h+.
    #
    # by_w and by_h can be a Fixnum, or another Size.

    def deflate!(by_w, by_h = nil)
      if by_w.respond_to? :width
        inflate!(-by_w.width, -by_w.height)
      else
        inflate!(-by_w, -by_h)
      end
    end

    # Return whether the +other+ size is identical in both dimensions

    def ==(other)
      width == other.width && height == other.height
    end

    # Return a string representation of the width and height of the current
    # Size

    def to_s
      "<GosuEnhanced::Size #{width}x#{height}>"
    end

    private

    # Check that the passed dimension deltas do not make either dimension of
    # Size negative.

    def validate(by_w, by_h)
      raise 'Cannot make size negative' if width + by_w < 0 || height + by_h < 0
    end

    # Change the dimensions using the dimensions of another Size.
    def inflate_by_size(sz)
      width  = sz.width
      height = sz.height
      validate(width, height)

      @width  += width
      @height += height

      self
    end
  end

  # Utility function to construct a size
  #
  # * +x+   Width
  # * +y+   Height

  def Size(x, y)
    Size.new(x, y)
  end

  module_function :Size
end
