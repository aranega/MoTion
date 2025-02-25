Class {
	#name : #MTDirectPath,
	#superclass : #MotionPath,
	#category : #'MoTion-paths'
}

{ #category : #'instance creation' }
MTDirectPath class >> of: anObjectPathString [

	^ self new name: anObjectPathString asSymbol
]

{ #category : #resolving }
MTDirectPath >> resolveFrom: anObject [

	^ { ([ (anObject class slotNamed: name) read: anObject ]
		   on: SlotNotFound
		   do: [ anObject perform: name ]) } flattened
]
