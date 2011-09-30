# encoding: utf-8
require 'sinatra/base'
require 'set'

$g_words = nil

module Sinatra
	module WordHelpers
		def load_words
			IO.read("words_official.txt").split.map(&:strip).to_set
		end

		def is_word?( word )
			$g_words = $g_words || load_words
			$g_words.include? word
		end
	end
	helpers WordHelpers
end
