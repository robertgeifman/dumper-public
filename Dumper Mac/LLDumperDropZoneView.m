//
//  LLDumperDropZoneView.m
//  Dumper
//
//  Created by Damien DeVille on 8/2/13.
//  Copyright (c) 2013 Damien DeVille. All rights reserved.
//

#import "LLDumperDropZoneView.h"

@interface LLDumperDropZoneView ()

@end

@implementation LLDumperDropZoneView

static void _LLDumperCommonInit(LLDumperDropZoneView *self)
{
}

- (id)initWithCoder:(NSCoder *)decoder
{
	self = [super initWithCoder:decoder];
	if (self == nil) {
		return nil;
	}
	_LLDumperCommonInit(self);
	return self;
}

- (id)initWithFrame:(NSRect)frame
{
	self = [super initWithFrame:frame];
	if (self == nil) {
		return nil;
	}
	_LLDumperCommonInit(self);
	return self;
}

#pragma mark - Dragging

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender
{
	if ([[self delegate] respondsToSelector:@selector(dropZoneView:draggingEntered:)]) {
		return [[self delegate] dropZoneView:self draggingEntered:sender];
	}
	return NSDragOperationNone;
}

- (void)draggingExited:(id <NSDraggingInfo>)sender
{
	if ([[self delegate] respondsToSelector:@selector(dropZoneView:draggingExited:)]) {
		[[self delegate] dropZoneView:self draggingExited:sender];
	}
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender
{
	if ([[self delegate] respondsToSelector:@selector(dropZoneView:acceptDrop:)]) {
		return [[self delegate] dropZoneView:self acceptDrop:sender];
	}
	return NO;
}

@end
