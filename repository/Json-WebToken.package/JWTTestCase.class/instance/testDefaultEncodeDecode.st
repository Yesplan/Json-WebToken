testing jwt encoding
testDefaultEncodeDecode

	| encodedString key payload encodedJWT decodedJWT |
	key := 'secret'.
	payload := Dictionary new add: ('some' -> 'payload'); yourself.

	encodedJWT := JWT new key: key; payload: payload.
	encodedString := encodedJWT encodedString.
	decodedJWT := JWT new key: key; fromEncodedString: encodedString.

	self assert: decodedJWT headerfields equals: encodedJWT headerfields.
	self assert: decodedJWT payload equals: encodedJWT payload