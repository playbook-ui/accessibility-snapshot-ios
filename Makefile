SWIFT_TOOL := Tools/swift-run.sh
GITHUB_RAW_CONTENT_PATH := https://raw.githubusercontent.com/playbook-ui/playbook-accessibility-ios/main/
GITHUB_TREE_PATH := https://github.com/playbook-ui/playbook-accessibility-ios/main/
LIBS := "PlaybookAccessibility"

.PHONY: all
all: proj mod format

.PHONY: proj
proj:
	$(SWIFT_TOOL) xcodegen --spec Example/project.yml --project Example

.PHONY: mod
mod:
	$(SWIFT_TOOL) swift-mod

.PHONY: format
format:
	$(SWIFT_TOOL) swift-format --configuration .swift-format.json -i -r -m format \
	  Sources Example/SamplePlaybook Example/SampleSnapshot

.PHONY: lint
lint:
	$(SWIFT_TOOL) swift-format --configuration .swift-format.json -r -m lint Sources

.PHONY: pod-lib-lint
pod-lib-lint:
	for lib in $(LIBS); do \
	  bundle exec pod lib lint $$lib.podspec; \
	done

.PHONY: pod-release
pod-release:
	for lib in $(LIBS); do \
	  bundle exec pod trunk push $$lib.podspec; \
	done

.PHONY: gem
gem:
	bundle config path vendor/bundle
	bundle install --jobs 4 --retry 3

.PHONY: npm
npm:
	npm i

.PHONY: docs
docs:
	$(SWIFT_TOOL) swift-doc generate Sources -n PlaybookAccessibility -f html -o docs
