initialize-release
fromEncodedString: aString

	| segments headerString payloadString signatureString decoder |
	segments := self substrings: '.' inString: aString.
	(segments size = 2 or: [ segments size = 3 ]) ifFalse: [ 
		self error: 'Too many or not enough segments' ].
	decoder := GRCodec forEncoding: 'utf-8'.
	headerString := decoder decode: (self base64UrlDecoded: segments first).
	payloadString := decoder decode: (self base64UrlDecoded: segments second).
	[ 
	headerfields := WAJsonParser parse: headerString.
	payload := WAJsonParser parse: payloadString ]
		on: WAJsonSyntaxError
		do: [ :e | self error: 'Incorrect string encoding or invalid json content' ].

	segments size = 3 ifTrue: [ 
		signatureString := self base64UrlDecoded: segments third.
		self
			verifySignature: signatureString
			forMessage: segments first , '.' , segments second ]