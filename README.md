# Parallax

Parallax is an iOS library that reproduces the parallax effect of the iOS7 home screen.

## Dependencies

- QuartzCore
- CoreMotion

## Usage

1. Add the _Parallax_ directory into your project.
2. Add `#import "ACParallax.h"` to your view controller.
3. Add a _ACParallax_ view and start the parallax effect with `parallaxView.parallax = YES;`

Optional:

If you want a delegate to be notified of begin/end parallax effect and changes in the motion attitude:
    
    parallaxView.parallaxDelegate = self;

## Bugs

- Some implementations details missing


## Credits

[San Francisco Bridge by Jeff Gunn (Creative Commons)](http://www.flickr.com/photos/jeffgunn/6663234085/)