words = IO.read("words.txt").split
words.map!(&:strip).map!(&:downcase).reject!{ |w| w[/[^a-zA-Z]/] }
File.open("..\\words_official.txt","wb"){ |io| io.write(words.join "\n") }
