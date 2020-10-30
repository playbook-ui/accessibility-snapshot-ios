SWIFT_TOOL := Tools/swift-run.sh
GITHUB_RAW_CONTENT_PATH := https://raw.githubusercontent.com/playbook-ui/accessibility-snapshot-ios/main/
GITHUB_TREE_PATH := https://github.com/playbook-ui/accessibility-snapshot-ios/main/
LIBS := "PlaybookAccessibilitySnapshot"

.PHONY: all
all: proj pod-install mod format

.PHONY: proj
proj:
	$(SWIFT_TOOL) xcodegen --spec Example/project.yml --project Example

.PHONY: pod-install
pod-install:
	bundle exec pod install --project-directory=Example

.PHONY: mod
mod:
	$(SWIFT_TOOL) swift-mod

.PHONY: format
format:
	$(SWIFT_TOOL) swift-format --configuration .swift-format.json -i -r -m format \
	  Sources Example

.PHONY: lint
lint:
	$(SWIFT_TOOL) swift-format --configuration .swift-format.json -r -m lint \
	  Sources Example

.PHONY: pod-lib-lint
pod-lib-lint:
	bundle exec pod lib lint PlaybookAccessibilitySnapshot.podspec;

.PHONY: pod-release
pod-release:
	bundle exec pod trunk push PlaybookAccessibilitySnapshot.podspec;

.PHONY: gem
gem:
	bundle config path vendor/bundle
	bundle install --jobs 4 --retry 3

.PHONY: npm
npm:
	npm i

.PHONY: docs
docs:
	$(SWIFT_TOOL) swift-doc generate Sources -n PlaybookAccessibilitySnapshot -f html -o docs
