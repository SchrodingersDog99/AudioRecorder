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
@synthesize recordingsList;

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	if(self.recordingsList==nil){
		self.recordingsList = [[NSMutableArray alloc] init];
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)startRecording:(id)sender {
	Recording* record = [[Recording alloc] initWithDate:[NSDate date]];
	[recordingsList addObject:record];
	
	NSString* archive = [NSString stringWithFormat:@"%@/Documents/RecordingArchive", NSHomeDirectory()];
	[NSKeyedArchiver archiveRootObject: recordingsList toFile: archive];
	assert([[NSFileManager defaultManager] fileExistsAtPath: archive]);
	
	archive = [NSString stringWithFormat:@"%@/Documents/RecordingArchive", NSHomeDirectory()];

	NSMutableArray* otherRecordings;
	if([[NSFileManager defaultManager] fileExistsAtPath: archive]){
		otherRecordings = [NSKeyedUnarchiver unarchiveObjectWithFile:archive];
		[[NSFileManager defaultManager] removeItemAtPath:archive error:nil];
	}else{
		// Doesn't exist!
		NSLog(@"No file to open!!");
		exit(1);
	}
	
	NSLog(@"%@", recordingsList);

}
@end
