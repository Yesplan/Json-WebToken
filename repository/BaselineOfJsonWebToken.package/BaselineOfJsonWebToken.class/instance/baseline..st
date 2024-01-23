baselines
baseline: spec
	<baseline>

	spec
		for: #common
		do: [

			spec package: 'Json-WebToken'.

			spec for: #(#WithoutWAJsonParser) do:[
	  			spec
					baseline: 'Seaside3'
					with: [
						spec
		  					repository: 'github://SeasideSt/Seaside:master/repository';
							loads: 'JSON' ].

				spec
					package: 'Json-WebToken'
					with: [ spec requires: #('Seaside3') ] ].

			spec
				group: 'default' with: #('Json-WebToken') ].

	spec
		for: #gemstone
		do: [
			spec for: #(#WithoutSHA256) do:[
				spec
					baseline: 'Cryptography'
  	 				with: [
						spec repository: 'github://GsDevKit/Cryptography:master/repository' ].
				spec
					package: 'Json-WebToken'
					with: [ spec requires: #('Cryptography') ] ].

			spec for: #WithoutPharoCompat do: [
				spec
					baseline: 'PharoCompatibility'
	 	     		with: [
						spec
							repository: 'github://GsDevKit/PharoCompatibility:master/repository';
							loads: 'Core' ].

				spec
					package: 'Json-WebToken'
					with: [ spec requires: #('PharoCompatibility') ] ] ]