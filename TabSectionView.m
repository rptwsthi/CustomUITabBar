//
//  TabSectionView.m
//  CustomTabBar
//
//  Created by medma on 7/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TabSectionView.h"


@implementation TabSectionView

@synthesize tabBackground;
@synthesize tabIcon;
@synthesize tabLabel;
@synthesize tabTouch;



// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


//- (void)viewDidUnload {
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//    // e.g. self.myOutlet = nil;
//  
//}

- (id) initWithFrame:(CGRect)frame{
	if (self) {
		[self setBackgroundColor:[UIColor yellowColor]];
		[self setFrame:frame];
	}
	return self;
}



@end
