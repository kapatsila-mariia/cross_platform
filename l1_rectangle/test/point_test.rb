require 'test_helper'

describe L1_rectangle::Point do
  describe '#initialize' do
    it 'should work with two positive values' do
      point = L1_rectangle::Point.new(10, 20)
      point.x.must_equal 10
      point.y.must_equal 20
    end

    it 'should work with negative values' do
      point = L1_rectangle::Point.new(-10, 20)
      point.x.must_equal(-10)
      point.y.must_equal 20

      point = L1_rectangle::Point.new(10, -20)
      point.x.must_equal 10
      point.y.must_equal(-20)

      point = L1_rectangle::Point.new(-10, -20)
      point.x.must_equal(-10)
      point.y.must_equal(-20)
    end

    it 'should work with the utility function' do
      point = L1_rectangle::Point(10, 20)
      point.x.must_equal 10
      point.y.must_equal 20
    end
  end

  describe '#offset' do
    it 'should work with another Point' do
      point  = L1_rectangle::Point.new(10, 20)
      opoint = point.offset(L1_rectangle::Point.new(30, 40))
      opoint.x.must_equal 40
      opoint.y.must_equal 60
    end

    it 'should work with a Size' do
      point  = L1_rectangle::Point.new(10, 20)
      opoint = point.offset(L1_rectangle::Size.new(50, 60))
      opoint.x.must_equal 60
      opoint.y.must_equal 80
    end

    it 'should work with two positive values' do
      point  = L1_rectangle::Point.new(10, 20)
      opoint = point.offset(40, 50)
      opoint.x.must_equal 50
      opoint.y.must_equal 70
    end

    it 'should work with two negative values' do
      point  = L1_rectangle::Point.new(60, 80)
      opoint = point.offset(-40, -50)
      opoint.x.must_equal 20
      opoint.y.must_equal 30
    end

    it 'should work with values that result in negative co-ordinates' do
      point  = L1_rectangle::Point.new(60, 80)
      opoint = point.offset(-80, -150)
      opoint.x.must_equal(-20)
      opoint.y.must_equal(-70)
    end
  end

  describe '#move_by!' do
    it 'should work with another Point' do
      point = L1_rectangle::Point.new(10, 20)
      point.move_by!(L1_rectangle::Point.new(30, 40))
      point.x.must_equal 40
      point.y.must_equal 60
    end

    it 'should work with a Size' do
      point = L1_rectangle::Point.new(10, 20)
      point.move_by!(L1_rectangle::Size.new(40, 50))
      point.x.must_equal 50
      point.y.must_equal 70
    end

    it 'should work with two positive values' do
      point = L1_rectangle::Point.new(10, 20)
      point.move_by!(40, 50)
      point.x.must_equal 50
      point.y.must_equal 70
    end

    it 'should work with two negative values' do
      point = L1_rectangle::Point.new(60, 80)
      point.move_by!(-40, -50)
      point.x.must_equal 20
      point.y.must_equal 30
    end

    it 'should work with values that result in negative co-ordinates' do
      point = L1_rectangle::Point.new(60, 80)
      point.move_by!(-80, -150)
      point.x.must_equal(-20)
      point.y.must_equal(-70)
    end
  end

  describe '#move_to!' do
    it 'should work with another Point' do
      point = L1_rectangle::Point.new(10, 20)
      point.move_to!(L1_rectangle::Point.new(30, 40))
      point.x.must_equal 30
      point.y.must_equal 40
    end

    it 'should work with two positive values' do
      point = L1_rectangle::Point.new(10, 20)
      point.move_to!(40, 50)
      point.x.must_equal 40
      point.y.must_equal 50
    end

    it 'should work with two negative values' do
      point = L1_rectangle::Point.new(60, 80)
      point.move_to!(-40, -50)
      point.x.must_equal(-40)
      point.y.must_equal(-50)
    end
  end

  # This might seem laboured, but I have run foul of dup before

  describe '#dup' do
    it 'should make a copy of the Point' do
      point  = L1_rectangle::Point.new(10, 20)
      npoint = point.dup

      point.x.must_equal 10
      point.y.must_equal 20

      npoint.x.must_equal 10
      npoint.y.must_equal 20

      npoint.move_to!(40, 50)
      npoint.x.must_equal 40
      npoint.y.must_equal 50

      point.x.must_equal 10
      point.y.must_equal 20
    end
  end

  describe '#to_s' do
    it 'should render usefully.' do
      point = L1_rectangle::Point.new(10, 20)
      point.to_s.must_equal '#<struct GosuEnhanced::Point x=10, y=20>'
    end
  end
end
