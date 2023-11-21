private
verifySignature: signatureString forMessage: messageString
	signatureString asByteArray = (self signatureOf: messageString) asByteArray
		ifFalse:[self error: 'Signature verification failed']