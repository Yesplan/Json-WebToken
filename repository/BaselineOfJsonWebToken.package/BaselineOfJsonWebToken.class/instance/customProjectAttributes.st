accessing
customProjectAttributes

	| attributes |
	attributes := OrderedCollection new.
	self class environment at: #WAJsonParser ifAbsent: [ attributes add: #WithoutWAJsonParser ].
	self class environment at: #SHA256 ifAbsent: [ attributes add: #WithoutSHA256 ].
	(ByteArray includesSelector: #base64Encoded) ifFalse: [ attributes add: #WithoutPharoCompat ].
	^ attributes asArray