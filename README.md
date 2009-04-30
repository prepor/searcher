Install
====

	gem install preprocessor-searcher
	
or

	./script/plugin install http://github.com/preprocessor/searcher

Usage
====

	Searcher.parse('http://www.google.com/search?client=safari&rls=en-us&q=god&ie=UTF-8&oe=UTF-8')

=>

	{:se => :google, :keywords => "god"}


