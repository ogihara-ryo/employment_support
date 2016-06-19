class Morpheme
  class << self
    def load
      CSV.read('csv/morpheme.csv')
    end
  end
end
