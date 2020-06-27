Class {
	#name : #BaselineOfUnigramCompletionSorter,
	#superclass : #BaselineOf,
	#category : #BaselineOfUnigramCompletionSorter
}

{ #category : #baselines }
BaselineOfUnigramCompletionSorter >> baselineOf: spec [
	<baseline>

	spec for: #common do: [ 
		spec
			package: 'NEUnigramCompletionSorter';
			package: 'NEUnigramCompletionSorter-Tests' with: [ spec requires: #(NEUnigramCompletionSorter) ] ]
]
