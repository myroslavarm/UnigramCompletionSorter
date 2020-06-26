Class {
	#name : #NEUnigramCompletionSorter,
	#superclass : #Object,
	#instVars : [
		'frequencyTable'
	],
	#category : #NEUnigramCompletionSorter
}

{ #category : #accessing }
NEUnigramCompletionSorter >> frequencyTable [
	^ frequencyTable
]

{ #category : #accessing }
NEUnigramCompletionSorter >> frequencyTable: anObject [
	frequencyTable := anObject
]

{ #category : #sorting }
NEUnigramCompletionSorter >> sort: anOrderedCollection [

	^ anOrderedCollection sort: [ :a :b |
		(frequencyTable at: a contents ifAbsent: 0) > (frequencyTable at: b contents ifAbsent: 0) ]
]
