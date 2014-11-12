//
//  CGGeometry+Helper.h
//  Utils
//
//  Created by Jonathan Green on 15/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

/** Offsets the X of a point **/
CG_INLINE CGPoint
CGPointOffsetX(CGPoint point, CGFloat offsetX)
{
    return CGPointMake(point.x + offsetX, point.y);
}

/** Offsets the Y of a point **/
CG_INLINE CGPoint
CGPointOffsetY(CGPoint point, CGFloat offsetY)
{
    return CGPointMake(point.x, point.y + offsetY);
}


CG_INLINE CGRect
CGRectOffsetX(CGRect rect, CGFloat offsetX)
{
    return CGRectMake(rect.origin.x + offsetX, rect.origin.y, rect.size.width, rect.size.height);
}


CG_INLINE CGRect
CGRectOffsetY(CGRect rect, CGFloat offsetY)
{
    return CGRectMake(rect.origin.x, rect.origin.y + offsetY, rect.size.width, rect.size.height);
}

CG_INLINE CGRect
CGRectUpdateWidth(CGRect rect, CGFloat newWidth)
{
    return CGRectMake(rect.origin.x, rect.origin.y, newWidth, rect.size.height);
}

CG_INLINE CGRect
CGRectUpdateHeight(CGRect rect, CGFloat newHeight)
{
    return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, newHeight);
}

CG_INLINE CGRect
CGRectUpdatePosition(CGRect rect, CGFloat x, CGFloat y)
{
    return CGRectMake(x, y, rect.size.width, rect.size.height);
}

CG_INLINE CGSize
CGSizeEdgeInsetsInset(CGSize size, UIEdgeInsets inset)
{
    CGFloat width = size.width;
    width -= inset.left;
    width -= inset.right;
    CGFloat height = size.height;
    height -= inset.top;
    height -= inset.bottom;
    return CGSizeMake(width, height);
}

CG_INLINE CGSize
CGSizeEdgeInsetsInflate(CGSize size, UIEdgeInsets inset)
{
    CGFloat width = size.width;
    width += inset.left;
    width += inset.right;
    CGFloat height = size.height;
    height += inset.top;
    height += inset.bottom;
    return CGSizeMake(width, height);
}



