## deep-cover error report

Deep-cover seems to have a bug that test fails when deep-cover is enabled.

This repository is an example that reproduces the bug.

Deep-cover: https://github.com/deep-cover/deep-cover

## How to reproduce the bug?

### Environment

```bash
ruby --version
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin17]

bundle --version
Bundler version 2.0.1

gem --version
2.7.6

sw_vers
ProductName:	Mac OS X
ProductVersion:	10.13.6
BuildVersion:	17G4015
```

### Setup

```bash
bundle install
```

### Bug reproduction

#### rspec without deep cover

```bash
DEEP_COVER_REQUIRE=0 bundle exec rspec
```

-> will pass

#### rspec requiring deep-cover but without deep-cover exec

```bash
DEEP_COVER_REQUIRE=1 bundle exec rspec
```

-> will pass

#### rspec not requiring deep-cover but with deep-cover exec


```bash
DEEP_COVER_REQUIRE=0 bundle exec deep-cover exec rspec
```

-> will pass

#### rspec with deep-cover


```bash
DEEP_COVER_REQUIRE=1 bundle exec deep-cover exec rspec
```

-> will fail
