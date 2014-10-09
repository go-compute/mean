
#############
# VARIABLES #

# NOTES #

NOTES ?= 'TODO|FIXME'


# FORMATTING #

GO_FMT ?= go fmt


# LINTING #

GO_LINT ?= golint


# TESTING #

GO_TEST ?= go test
GO_TEST_COV ?= go tool cover
GO_TEST_OUT ?= ./reports/coverage
#GO_TEST_MODE ?= set
GO_TEST_REPORT_COV_PATH ?= $(GO_TEST_OUT)/coverage.out
GO_TEST_REPORT_COUNT_PATH ?= $(GO_TEST_OUT)/count.out
GO_TEST_REPORT_COV_HTML_PATH ?= $(GO_TEST_OUT)/coverage.html
GO_TEST_REPORT_COUNT_HTML_PATH ?= $(GO_TEST_OUT)/count.html


# FILES #

# Source directory:
SRC ?= ./lib

# Source files:
SOURCES ?= lib/*.go

# Test files:
TESTS ?= lib/*_test.go




###########
# TARGETS #


# NOTES #

.PHONY: notes

notes:
	grep -Ern $(NOTES) $(SOURCES) $(TESTS)



# FORMATTING #

.PHONY: fmt fmt-go

fmt: fmt-go

fmt-go:
	$(GO_FMT) $(SRC)


# LINT #

.PHONY: lint lint-go

lint: lint-go

lint-go:
	$(GO_LINT) $(SRC)


# UNIT TESTS #

.PHONY: test test-go

test: test-go

test-go:
	$(GO_TEST) $(SRC)



# CODE COVERAGE #

.PHONY: test-cov test-go-cov

test-cov: test-go-cov

test-go-cov:
	mkdir -p $(GO_TEST_OUT)
	$(GO_TEST) \
		-coverprofile $(GO_TEST_REPORT_COV_PATH) \
		-covermode set \
		$(SRC)
	$(GO_TEST_COV) \
		-html $(GO_TEST_REPORT_COV_PATH) \
		-o $(GO_TEST_REPORT_COV_HTML_PATH)
	$(GO_TEST) \
		-coverprofile $(GO_TEST_REPORT_COUNT_PATH) \
		-covermode count \
		$(SRC)
	$(GO_TEST_COV) \
		-html $(GO_TEST_REPORT_COUNT_PATH) \
		-o $(GO_TEST_REPORT_COUNT_HTML_PATH)


# COVERAGE REPORT #

.PHONY: view-cov view-go-report view-cov-counts view-go-counts-report

view-cov: view-go-report

view-go-report:
	open $(GO_TEST_REPORT_COV_HTML_PATH)

view-cov-counts: view-go-counts-report

view-go-counts-report:
	open $(GO_TEST_REPORT_COUNT_HTML_PATH)



# BENCHMARKS #

.PHONY: benchmarks benchmarks-go

benchmarks: benchmarks-go

# We assume a test named XXX is improbable...
benchmarks-go:
	$(GO_TEST) $(SRC) \
		-bench . \
		-run XXX


# GO #

# Installation:
.PHONY: install

install:
	go install
