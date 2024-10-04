@clean:
	flutter clean && flutter pub get

@pod:
	cd ios && rm -rf Pods && rm -rf Podfile.lock && pod repo update && pod install

.PHONY: @clean @pod