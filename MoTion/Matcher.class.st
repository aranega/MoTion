Class {
	#name : #Matcher,
	#superclass : #Object,
	#category : #'MoTion-matcher'
}

{ #category : #matching }
Matcher >> as: aSymbol [

	^ MatcherSave of: self withAlias: aSymbol
]

{ #category : #converting }
Matcher >> asMatcher [

	^ self
]

{ #category : #initialization }
Matcher >> initialize [ 
	super initialize.
	
]

{ #category : #matching }
Matcher >> match: aNewValue [

	| aNewContext matcherResult |
	aNewContext := MatchingContext new.
	matcherResult := MatcherResult new.

	^ matcherResult addAllIfMatch:
		  (self match: aNewValue withContext: aNewContext)
]

{ #category : #matching }
Matcher >> match: aNewValue withContext: aMatchingContext [
	
	self shouldBeImplemented 
	
]
