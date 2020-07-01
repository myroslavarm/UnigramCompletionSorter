Class {
	#name : #NEUnigramCompletionSorter,
	#superclass : #CompletionSorter,
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

{ #category : #'data loading' }
NEUnigramCompletionSorter >> frequencyTableJsonFile [
	^ 'pharo-local/iceberg/pharo-completion/UnigramCompletionSorter/data/frequencyTable.json' asFileReference
]

{ #category : #initialization }
NEUnigramCompletionSorter >> initialize [
	super initialize.
	self readFrequancyTableFromFile.
]

{ #category : #'data loading' }
NEUnigramCompletionSorter >> readFrequancyTableFromFile [
	| frequencies dict |
	frequencies := STONJSON fromString: self frequencyTableJsonFile contents.
	dict := Dictionary new.
	frequencies do: [ :each | dict at: each first put: each second ].
	frequencyTable := dict
]

{ #category : #sorting }
NEUnigramCompletionSorter >> sortCompletionList: anOrderedCollection [
	^ anOrderedCollection sort: [ :a :b |
		(frequencyTable at: a contents ifAbsent: 0) > (frequencyTable at: b contents ifAbsent: 0) ]
]
