//
//  TrackListController.m
//  Ampz
//
//  Created by Maximilian Täschner on 17/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "TrackListController.h"
#import "ETTrack.h"
#import "TrackListItemView.h"
#import "Notifications.h"

@interface TrackListController ()
@end

@implementation TrackListController {
}

#pragma mark - Lifecycle

-(void)awakeFromNib {
    [[NSNotificationCenter defaultCenter]
        addObserver:self.view
        selector:@selector(reloadData)
        name:kNotificationPlaybackTrackDidChange
        object:nil];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - TableViewDelegabe

-(id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
           row:(NSInteger)row
{
    return [_tracks objectAtIndex:row];
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return _tracks.count;
}

- (NSView *)tableView:(NSTableView *)tableView
   viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row
{
    TrackListItemView *view = [tableView makeViewWithIdentifier:@"TrackListItemView" owner:self];
    [view.trackNo setStringValue:[NSString stringWithFormat:@"%li",(long)row + 1]];
    [view setTrack:[_tracks objectAtIndex:row]];
    return view;
}

-(BOOL)tableView:(NSTableView *)tableView
 shouldSelectRow:(NSInteger)row
{
    return NO;
}

#pragma mark - Object

-(void)setTracks:(NSArray *)tracks {
    [self willChangeValueForKey:@"tracks"];
    _tracks = tracks;
    [self didChangeValueForKey:@"tracks"];
    [(NSTableView *)self.view reloadData];
}

@end
