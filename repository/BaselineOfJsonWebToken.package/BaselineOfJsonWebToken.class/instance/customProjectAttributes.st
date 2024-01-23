accessing
customProjectAttributes

	| attributes |
	attributes := OrderedCollection new.
	self class environment at: #WAJsonParser ifAbsent: [ attributes add: #WithoutWAJsonParser ].
	self class environment at: #SHA256 ifAbsent: [ attributes add: #WithoutSHA256 ].
	^ attributes asArray