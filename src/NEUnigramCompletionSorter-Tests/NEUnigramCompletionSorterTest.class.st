Class {
	#name : #NEUnigramCompletionSorterTest,
	#superclass : #TestCase,
	#instVars : [
		'sorter'
	],
	#category : #'NEUnigramCompletionSorter-Tests'
}

{ #category : #running }
NEUnigramCompletionSorterTest >> setUp [

	sorter := NEUnigramCompletionSorter new.
	
	sorter frequencyTable: {
		'apple' -> 4 .
		'banana' -> 3 .
		'orange' -> 42 .
		'mango' -> 10 .
		'avocado' -> 13
	} asDictionary.
]

{ #category : #tests }
NEUnigramCompletionSorterTest >> testSort [
	| candidates actual expected |
	
	candidates := #(apple banana avocado orange).
	expected := #(orange avocado apple banana).
	actual := sorter sortCompletionList: candidates.
	
	self assert: actual equals: expected
]

{ #category : #tests }
NEUnigramCompletionSorterTest >> testSortCandidatesNotInDictionary [
	| candidates actual expected |
	
	candidates := #(apple dragonfruit banana avocado).
	expected := #(avocado apple banana dragonfruit).
	actual := sorter sortCompletionList: candidates.
	
	self assert: actual equals: expected
]

{ #category : #tests }
NEUnigramCompletionSorterTest >> testSortEmptyCandidates [
	| candidates actual expected |
	
	candidates := #().
	expected := #().
	actual := sorter sortCompletionList: candidates.
	
	self assert: actual equals: expected
]

{ #category : #tests }
NEUnigramCompletionSorterTest >> testSortEmptyFrequencies [
	| candidates actual expected |
	sorter frequencyTable: Dictionary new.
	
	candidates := #().
	expected := #().
	actual := sorter sortCompletionList: candidates.
	
	self assert: actual equals: expected
]
