//
//  ViewController.m
//  AudioRecorder
//
//  Created by DonghuiLi on 16/7/6.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import "ViewController.h"
#import "Recording.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)startRecording:(id)sender {
	Recording* record = [[Recording alloc] initWithDate:[NSDate date]];

	NSString* archive = [NSString stringWithFormat:@"%@/Documents/recArchive", NSHomeDirectory()];
	[NSKeyedArchiver archiveRootObject: record toFile: archive];
	//NSLog(@"ButtonPressed!");
	assert([[NSFileManager defaultManager] fileExistsAtPath: archive]);
	
	archive = [NSString stringWithFormat:@"%@/Documents/recArchive", NSHomeDirectory()];

	Recording* otherRecord;
	if([[NSFileManager defaultManager] fileExistsAtPath: archive]){
		otherRecord = [NSKeyedUnarchiver unarchiveObjectWithFile:archive];
		[[NSFileManager defaultManager] removeItemAtPath:archive error:nil];
	}else{
		// Doesn't exist!
		NSLog(@"No file to open!!");
		exit(1);
	}
	
	NSLog(@"%@", [otherRecord description]);

}
@end
