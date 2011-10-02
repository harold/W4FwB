# encoding: utf-8
require 'sinatra/base'
require 'set'

$g_words = nil
$g_letters = %w{E T A O N R I S H D L F C M U G Y P W B V K X J Q Z}

module Sinatra
	module WordHelpers
		def load_words
			IO.read("words_official.txt").split.map(&:strip).to_set
		end

		def is_word?( word )
			$g_words = $g_words || load_words
			$g_words.include? word
		end

		def get_letter( top )
			$g_letters[ rand top ]
		end
	end
	helpers WordHelpers
end
