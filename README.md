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

### Directory Structure

|path|description|
|:-:|:-:|
|lib/ok_class.rb|ok test target|
|lib/ng_class.rb|ng test target|
|lib/ok_class_rewritten.rb|rewritten ok test target generated using --debug option|
|lib/ng_class_rewritten.rb|rewritten ng test target generated using --debug option|
|spec/ok_class_spec.rb|test for ok target|
|spec/ng_class_spec.rb|test for ng target|
|spec/ok_class_rewritten_spec.rb|test for rewritten ok target|
|spec/ng_class_rewritten_spec.rb|test for rewritten ng target|

### Bug reproduction

#### rspec original without deep cover

```bash
DEEP_COVER_REQUIRE=0 bundle exec rspec spec/ng_class_spec.rb
```

-> will pass

#### rspec original requiring deep-cover but without deep-cover exec

```bash
DEEP_COVER_REQUIRE=1 bundle exec rspec spec/ng_class_spec.rb
```

-> will pass

#### rspec original not requiring deep-cover but with deep-cover exec


```bash
DEEP_COVER_REQUIRE=0 bundle exec deep-cover exec rspec spec/ng_class_spec.rb
```

-> will pass

#### rspec original with deep-cover


```bash
DEEP_COVER_REQUIRE=1 bundle exec deep-cover exec rspec spec/ng_class_spec.rb
```

-> will fail

#### rspec rewritten without deep-cover


```bash
DEEP_COVER_REQUIRE=0 bundle exec rspec spec/ng_class_rewritten_spec.rb
```

-> will fail

#### OkClass is not broken

```bash
DEEP_COVER_REQUIRE=0 bundle exec rspec spec/ok_class_spec.rb
DEEP_COVER_REQUIRE=1 bundle exec rspec spec/ok_class_spec.rb
DEEP_COVER_REQUIRE=0 bundle exec deep-cover exec rspec spec/ok_class_spec.rb
DEEP_COVER_REQUIRE=1 bundle exec deep-cover exec rspec spec/ok_class_spec.rb
DEEP_COVER_REQUIRE=0 bundle exec rspec spec/ok_class_rewritten_spec.rb
```

-> will pass

## debug

-d option seems to be only available in https://github.com/deep-cover/deep-cover/tree/d7aba4fa956d226d582b1f2cc126d50b10be3503

```bash
bundle exec deep-cover -d -e "class MyClass
>                                 def self.my_class_method(
>                                     a0: 0, a1: 0, a2: 0, a3: 0, a4: 0, a5: 0, a6: 0, a7: 0, a8: 0, a9: 0,
>                                     b0: 0, b1: 0, b2: 0, b3: 0, b4: 0, b5: 0, b6: 0, b7: 0, b8: 0, b9: 0,
>                                     c0: 0, c1: 0, c2: 0, c3: 0, c4: 0, c5: 0, c6: 0, c7: 0, c8: 0, c9: 0,
>                                     d0: 0, d1: 0,
>                                     x: 0
>                                   )
>                                   x
>                                 end
>                               end"
Line Coverage: Builtin | DeepCover | DeepCover Strict:
 1 |       class MyClass
 2 |                                       def self.my_class_method(
 3 | - x x                                     a0: 0, a1: 0, a2: 0, a3: 0, a4: 0, a5: 0, a6: 0, a7: 0, a8: 0, a9: 0,
 4 | - x x                                     b0: 0, b1: 0, b2: 0, b3: 0, b4: 0, b5: 0, b6: 0, b7: 0, b8: 0, b9: 0,
 5 | - x x                                     c0: 0, c1: 0, c2: 0, c3: 0, c4: 0, c5: 0, c6: 0, c7: 0, c8: 0, c9: 0,
 6 | - x x                                     d0: 0, d1: 0,
 7 | - x x                                     x: 0
 8 | - - -                                   )
 9 | x x x                                   x
10 | - - -                                 end
11 | - - -                               end

Instrumented code:
($_cov ||= {})[0]||=Array.new(38,0);$_cov[0][37]+=1;_temp=nil;((_temp=(class MyClass
                                $_cov[0][36]+=1;((_temp=(def (self).my_class_method(
                                    a0: ($_cov[0][0]+=1;0), a1: ($_cov[0][1]+=1;0), a2: ($_cov[0][2]+=1;0), a3: ($_cov[0][3]+=1;0), a4: ($_cov[0][4]+=1;0), a5: ($_cov[0][5]+=1;0), a6: ($_cov[0][6]+=1;0), a7: ($_cov[0][7]+=1;0), a8: ($_cov[0][8]+=1;0), a9: ($_cov[0][9]+=1;0),
                                    b0: ($_cov[0][10]+=1;0), b1: ($_cov[0][11]+=1;0), b2: ($_cov[0][12]+=1;0), b3: ($_cov[0][13]+=1;0), b4: ($_cov[0][14]+=1;0), b5: ($_cov[0][15]+=1;0), b6: ($_cov[0][16]+=1;0), b7: ($_cov[0][17]+=1;0), b8: ($_cov[0][18]+=1;0), b9: ($_cov[0][19]+=1;0),
                                    c0: ($_cov[0][20]+=1;0), c1: ($_cov[0][21]+=1;0), c2: ($_cov[0][22]+=1;0), c3: ($_cov[0][23]+=1;0), c4: ($_cov[0][24]+=1;0), c5: ($_cov[0][25]+=1;0), c6: ($_cov[0][26]+=1;0), c7: ($_cov[0][27]+=1;0), c8: ($_cov[0][28]+=1;0), c9: ($_cov[0][29]+=1;0),
                                    d0: ($_cov[0][30]+=1;0), d1: ($_cov[0][31]+=1;0),
                                    x: ($_cov[0][32]+=1;0)
                                  )
                                  $_cov[0][34]+=1;_temp=nil;x
                                end);$_cov[0][33]+=1;_temp=_temp))
                              end);$_cov[0][35]+=1;_temp=_temp))

Parsed code:
(class
  (const[ModuleName] nil :MyClass) nil
  (defs
    (self[SingletonLiteral]) :my_class_method
    (args
      (kwoptarg[Optarg] :a0
        (int 0))
      (kwoptarg[Optarg] :a1
        (int 0))
      (kwoptarg[Optarg] :a2
        (int 0))
      (kwoptarg[Optarg] :a3
        (int 0))
      (kwoptarg[Optarg] :a4
        (int 0))
      (kwoptarg[Optarg] :a5
        (int 0))
      (kwoptarg[Optarg] :a6
        (int 0))
      (kwoptarg[Optarg] :a7
        (int 0))
      (kwoptarg[Optarg] :a8
        (int 0))
      (kwoptarg[Optarg] :a9
        (int 0))
      (kwoptarg[Optarg] :b0
        (int 0))
      (kwoptarg[Optarg] :b1
        (int 0))
      (kwoptarg[Optarg] :b2
        (int 0))
      (kwoptarg[Optarg] :b3
        (int 0))
      (kwoptarg[Optarg] :b4
        (int 0))
      (kwoptarg[Optarg] :b5
        (int 0))
      (kwoptarg[Optarg] :b6
        (int 0))
      (kwoptarg[Optarg] :b7
        (int 0))
      (kwoptarg[Optarg] :b8
        (int 0))
      (kwoptarg[Optarg] :b9
        (int 0))
      (kwoptarg[Optarg] :c0
        (int 0))
      (kwoptarg[Optarg] :c1
        (int 0))
      (kwoptarg[Optarg] :c2
        (int 0))
      (kwoptarg[Optarg] :c3
        (int 0))
      (kwoptarg[Optarg] :c4
        (int 0))
      (kwoptarg[Optarg] :c5
        (int 0))
      (kwoptarg[Optarg] :c6
        (int 0))
      (kwoptarg[Optarg] :c7
        (int 0))
      (kwoptarg[Optarg] :c8
        (int 0))
      (kwoptarg[Optarg] :c9
        (int 0))
      (kwoptarg[Optarg] :d0
        (int 0))
      (kwoptarg[Optarg] :d1
        (int 0))
      (kwoptarg[Optarg] :x
        (int 0)))
    (lvar[Variable] :x)))

Node coverage:
class MyClass
                                def self.my_class_method(
                                    a0: 0, a1: 0, a2: 0, a3: 0, a4: 0, a5: 0, a6: 0, a7: 0, a8: 0, a9: 0,
                                    b0: 0, b1: 0, b2: 0, b3: 0, b4: 0, b5: 0, b6: 0, b7: 0, b8: 0, b9: 0,
                                    c0: 0, c1: 0, c2: 0, c3: 0, c4: 0, c5: 0, c6: 0, c7: 0, c8: 0, c9: 0,
                                    d0: 0, d1: 0,
                                    x: 0
                                  )
                                  x
                                end
                              end

From: /Users/mac2/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/bundler/gems/deep-cover-d7aba4fa956d/lib/deep_cover/cli/debugger.rb @ line 88 DeepCover::CLI::Debugger#pry:

    84: def pry
    85:   a = covered_code.covered_ast
    86:   b = a.children.first
    87:   ::DeepCover.load_pry
 => 88:   binding.pry
    89: end
```
