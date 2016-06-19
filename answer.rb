require 'csv'
require File.dirname(__FILE__) + "/morpheme"

class Answer
  class << self
    def load
      CSV.read('csv/answer.csv')
    end

    def analysis(input)
      return '何か言ってよ！' if input.empty?

      morphemes = Morpheme.load
      answers = load

      # 出現した形態素の ID を取得
      morpheme_ids = []
      morphemes.each do |morpheme|
        morpheme_ids << morpheme[0] if input.include?(morpheme[1])
      end
      return 'ちょっと何言ってるか分からない。' if morpheme_ids.empty?

      # 点数付け
      answers = load
      points = []
      answers.each do |answer|
        point = 0
        morpheme_ids.each { |morpheme_id| point += answer[2 + morpheme_id.to_i].to_i }
        points << point
      end

      # 一番点数の高いものの解答を返す
      answers[points.index(points.max)][2]
    end
  end
end
