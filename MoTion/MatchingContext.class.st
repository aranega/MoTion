"
""matchingContext handles the contexts of each match; the matched contexts are all filled as Dictionaries in bindings""
"
Class {
	#name : #MatchingContext,
	#superclass : #Object,
	#instVars : [
		'bindings',
		'isMatch',
		'inverse'
	],
	#category : #'MoTion-results'
}

{ #category : #accessing }
MatchingContext >> atBindingKey: aKey put: aValue [

	self bindings at: aKey asSymbol put: aValue

	"Since the MatchingContext can be used in different places (same function can have input and output the Matching Context), we leave the isMatch to be filled in the Matcher code, more specifically in the match and match:withCOntext methods."
]

{ #category : #accessing }
MatchingContext >> bindings [

	^ bindings
]

{ #category : #accessing }
MatchingContext >> copy [

	| instance |
	instance := self class new.
	instance bindings addAll: bindings.
	instance isMatch: isMatch.
	instance inverse: inverse.
	^ instance
]

{ #category : #accessing }
MatchingContext >> disableInverse [

	inverse := false
]

{ #category : #accessing }
MatchingContext >> enableInverse [

	inverse := true
]

{ #category : #accessing }
MatchingContext >> flipIsMatch [

	inverse := inverse not
]

{ #category : #initialization }
MatchingContext >> initialize [ 
	super initialize.
	bindings := Dictionary new.
	isMatch := false.
	inverse := false.
]

{ #category : #accessing }
MatchingContext >> inverse [
	^ inverse
]

{ #category : #accessing }
MatchingContext >> inverse: aBoolean [

	inverse := aBoolean
]

{ #category : #accessing }
MatchingContext >> isMatch [

	^ isMatch xor: [ inverse ]
]

{ #category : #accessing }
MatchingContext >> isMatch: aBoolean [

	isMatch := aBoolean
]
