SWIFT_TOOL := Tools/swift-run.sh
GITHUB_RAW_CONTENT_PATH := https://raw.githubusercontent.com/playbook-ui/accessibility-snapshot-ios/main/
GITHUB_TREE_PATH := https://github.com/playbook-ui/accessibility-snapshot-ios/main/

.PHONY: all
all: proj format

.PHONY: proj
proj:
	$(SWIFT_TOOL) xcodegen --spec Example/project.yml --project Example
	make pod-install

.PHONY: pod-install
pod-install:
	bundle exec pod install --project-directory=Example || bundle exec pod install --repo-update --project-directory=Example

.PHONY: format
format:
	$(SWIFT_TOOL) swift-mod
	$(SWIFT_TOOL) swift-format --configuration .swift-format.json -i -r -m format Sources Example/SampleAccessibilitySnapshot

.PHONY: lint
lint:
	$(SWIFT_TOOL) swift-format --configuration .swift-format.json -r -m lint Sources Example/SampleAccessibilitySnapshot

.PHONY: pod-lib-lint
pod-lib-lint:
	bundle exec pod lib lint --skip-tests PlaybookAccessibilitySnapshot.podspec

.PHONY: pod-release
pod-release:
	bundle exec pod trunk push PlaybookAccessibilitySnapshot.podspec

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

.PHONY: fix-readme-links
fix-readme-links:
	sed -i '' -E '/.?http/!s#(<img src=")([^"]+)#\1$(GITHUB_RAW_CONTENT_PATH)\2#g' README.md
	sed -i '' -E '/.?http/!s#(<img .+src=")([^"]+)#\1$(GITHUB_RAW_CONTENT_PATH)\2#g' README.md
	sed -i '' -E '/.?http/!s#(<a href=")([^"]+)#\1$(GITHUB_TREE_PATH)\2#g' README.md
	sed -i '' -E '/.?http/!s#(<a .+href=")([^"]+)#\1$(GITHUB_TREE_PATH)\2#g' README.md
	sed -i '' -E '/.?http/!s#(\!\[.+\])\((.+)\)#\1($(GITHUB_RAW_CONTENT_PATH)\2)#g' README.md
	sed -i '' -E '/.?http/!s#(\[.+\])\((.+)\)#\1($(GITHUB_TREE_PATH)\2)#g' README.md
