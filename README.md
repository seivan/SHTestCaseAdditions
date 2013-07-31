SHTestCaseAdditions
==========
[![Build Status](https://travis-ci.org/seivan/SHTestCaseAdditions.png?branch=master)](https://travis-ci.org/seivan/SHTestCaseAdditions)


Overview
--------
Prefixed Asynchronous test helpers as a category on SenTestCase and XCTestCase

* Swizzle and junk free
* Prefixed selectors.
* Works with both SentTest and/or XCTest
* For iOS and Mac OS
* Comes with tests and example. 



API
----------
#### [EXAMPLES](https://github.com/PodFactory/SHTestCaseAdditions#examples-1)
#### [API](https://github.com/PodFactory/SHTestCaseAdditions#api-1)



Installation
------------

```ruby
pod 'SHTestCaseAdditions'
```

***

Setup
-----

Put this either in specific files or your project prefix file

```objective-c
#import "OCUnit+SHTestCaseAdditions.h"
```
or 
```objective-c
#import "SHTestCaseAdditions.h"
```


API
-----

```objective-c




#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 70000 || __MAC_OS_X_VERSION_MIN_REQUIRED >= 1090)
@interface XCTestCase (SHTestCaseAdditions)
#else
#import <SenTestingKit/SenTestingKit.h>
@interface SenTestCase (SHTestCaseAdditions)
#endif


#pragma mark -
#pragma mark Block Definitions
typedef BOOL (^SHTestCaseConditional)();
typedef void (^SHTestCaseBlock)(BOOL *didFinish);

#pragma mark -
#pragma mark Helpers
-(void)SH_runLoopUntilTestPassesWithBlock:(SHTestCaseConditional)theBlock withTimeOut:(NSTimeInterval)theTimeout;
-(void)SH_performAsyncTestsWithinBlock:(SHTestCaseBlock)theBlock withTimeout:(NSTimeInterval)theTimeout;

@end

```


Contact
-------

If you end up using SHTestCaseAdditions in a project, I'd love to hear about it.

email: [seivan.heidari@icloud.com](mailto:seivan.heidari@icloud.com)  
twitter: [@seivanheidari](https://twitter.com/seivanheidari)

## License

SHTestCaseAdditions is © 2013 [Seivan](http://www.github.com/seivan) and may be freely
distributed under the [MIT license](http://opensource.org/licenses/MIT).
See the [`LICENSE.md`](https://github.com/PodFactory/SHTestCaseAdditions/blob/master/LICENSE.md) file.

