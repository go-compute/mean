
#############
# VARIABLES #

# NOTES #

NOTES ?= 'TODO|FIXME'


# TESTING #

GO_OUT ?= ./reports/coverage
GO_HTML_REPORT_PATH ?= $(GO_OUT)/coverage.out


# FILES #

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



# UNIT TESTS #

.PHONY: test test-go

test: test-go

test-go:
	go test ./lib



# CODE COVERAGE #

.PHONY: test-cov test-go-cov

test-cov: test-go-cov

test-go-cov:
	go test -cover



# COVERAGE REPORT #

.PHONY: view-cov view-go-report

view-cov: view-go-report

view-go-report:
	go tool cover -html=$(GO_HTML_REPORT_PATH)



# GO #

# Installation:
.PHONY: install

install:
	go install
