//
//  ViewController.h
//  AudioRecorder
//
//  Created by DonghuiLi on 16/7/6.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recording.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) NSMutableArray* recordingsList;

- (IBAction)startRecording:(id)sender;

@end

