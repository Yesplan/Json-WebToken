testing jwt encoding
testBase64UrlEncodeDecode

	| testString encodedString |

	testString := 'Testing the base64 encoding'.
	encodedString := JWT new base64UrlEncoded: testString.
	self assert: (JWT new base64UrlDecoded: encodedString) equals: testString.
	self assert: (JWT new base64UrlEncoded: (ByteArray withAll: #(16rFB 16rFF 16rFE))) equals: '-__-'.
	self assert: (JWT new base64UrlDecoded: '-__-') asByteArray equals: (ByteArray withAll: #(16rFB 16rFF 16rFE))