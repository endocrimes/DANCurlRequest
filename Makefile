.PHONY: release test

test:
	xcodebuild test \
	 	-project DANCurlRequest.xcodeproj \
		-scheme DANCurlRequest -sdk iphonesimulator \
		-destination 'platform=iOS Simulator,name=iPhone 6,OS=latest'

release: test
	git tag $(VERSION)
	git push
	git push --tags
	pod trunk push
